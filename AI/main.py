from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
from azure.ai.inference import ChatCompletionsClient
from azure.ai.inference.models import SystemMessage, UserMessage
from azure.core.credentials import AzureKeyCredential
import uvicorn
from config import Config

# إعداد API
app = FastAPI()

# إضافة CORS Middleware
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # يمكنك تحديد نطاق معين بدلاً من "*"
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# نقطة نهاية الصفحة الرئيسية
@app.get("/")
async def home():
    return {"message": "Welcome to my FastAPI app!"}

# بيانات Azure OpenAI
endpoint = Config.ENDPOINT
api_key = Config.API_KEY
model_name = Config.MODEL_NAME

# تهيئة العميل
client = ChatCompletionsClient(
    endpoint=endpoint,
    credential=AzureKeyCredential(api_key),
)

# نموذج البيانات المستقبلة من التطبيق
class ChatRequest(BaseModel):
    user_input: str

# نقطة نهاية API لاستقبال الرسائل من التطبيق
@app.post("/chat/")
async def chat(request: ChatRequest):
    try:
        response = client.complete(
            messages=[
                SystemMessage(content="You are a helpful assistant. Respond in English concisely. Include calories for each recipe and preparation methods."),
                UserMessage(content=request.user_input)
            ],
            max_tokens=2048,
            model=model_name
        )
        # إزالة أي جزء من الاستجابة يحتوي على <think> ... </think>
        final_response = response.choices[0].message.content.strip()
        final_response = final_response.split("</think>\n\n")[-1]  # حذف المقدمة إذا كانت موجودة
        return {"response": final_response}
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
    
# تشغيل التطبيق
if __name__ == "__main__":
    uvicorn.run("main:app", host="0.0.0.0", port=8000, reload=True)
