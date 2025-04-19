# 🤖 AI Recipe Assistant (FastAPI + Azure SDK)

This project implements a simple backend using **FastAPI** and the **Azure AI SDK (Python)** to power an AI chat assistant that returns recipes based on user input. The system is designed to connect with a mobile application built using **Flutter (Dart)**.

---

## 📌 Overview

- **Purpose**: Receive user input (like "I want to eat chicken") and return AI-generated recipe suggestions.
- **AI Model**: Azure OpenAI GPT via `azure-ai-inference` SDK.
- **Frontend**: A Flutter mobile app sending user input.
- **Backend**: Python (FastAPI), which connects to Azure AI services.
- **Communication**: FastAPI exposes a POST endpoint at `/chat/`.

---

## 🧠 SDK Client vs REST Client

Azure AI services can be accessed in two main ways:

| Feature             | **SDK Client** (Used Here)                   | **REST Client**                           |
|---------------------|----------------------------------------------|-------------------------------------------|
| Code Abstraction    | High – uses pre-built classes/methods        | Low – manual HTTP requests                |
| Complexity          | Easy to use                                  | More verbose and error-prone              |
| Performance         | Comparable, but SDK manages retries/errors   | Full control, but more setup              |
| Language Support    | Python, C#, Java (via official SDKs)         | Any language supporting HTTP              |
| Authentication      | Built-in (`AzureKeyCredential`)              | Manual (set headers, keys)                |

### 🔹 We used: **SDK Client**  
The SDK provides a simpler, cleaner way to interact with Azure AI—ideal for Python development and prototyping.

---

## 🛠️ How SDK Works (Simple Terms)

With SDK, you don’t need to construct raw HTTP requests. Instead, you use classes like `ChatCompletionsClient`, `UserMessage`, and `SystemMessage`.

The SDK handles:
- Authentication
- Message formatting
- Token limits
- Retry logic
- Response parsing

---

## 🔁 Sequence of Execution

Below is a step-by-step breakdown of how the system works from end to end:

### 1. ✅ Mobile App Sends Input

The Flutter app sends a POST request to the FastAPI server:

```
POST http://localhost:8000/chat/
Content-Type: application/json

{
  "user_input": "I want to eat chicken"
}
```

---

### 2. ⚙️ FastAPI Receives the Request

Inside `main.py`, the `/chat/` endpoint parses this using a Pydantic model:

```python
class ChatRequest(BaseModel):
    user_input: str
```

---

### 3. 💬 Message Sent to Azure AI

The SDK sends a message to Azure OpenAI using the `ChatCompletionsClient`:

```python
response = client.complete(
    messages=[
        SystemMessage(content="You are a helpful assistant. Respond in English..."),
        UserMessage(content=request.user_input)
    ],
    model=model_name,
    max_tokens=2048
)
```

**Note**: `SystemMessage` is used to guide the AI’s tone and format.

---

### 4. 🧹 Response Cleanup (Remove Internal Markup)

The Azure model sometimes includes internal tags like `<think>`. We clean them:

```python
final_response = response.choices[0].message.content.strip()
final_response = final_response.split("</think>\n\n")[-1]
```

---

### 5. 🔁 Return Response to Mobile App

The FastAPI app returns a JSON response back to Flutter:

```json
{
  "response": "Here are 3 simple chicken recipes..."
}
```

---

## 📁 Project Structure

```
project/
│
├── main.py               # Main FastAPI app
├── config.py             # Contains API key, endpoint, model
├── requirements.txt      # Python dependencies
└── README.md             # This documentation
```

---

## 🔐 config.py Example

```python
class Config:
    ENDPOINT = "https://<your-endpoint>.openai.azure.com"
    API_KEY = "your-azure-api-key"
    MODEL_NAME = "gpt-35-turbo"
```

---

## 📦 requirements.txt

```text
fastapi
uvicorn
azure-ai-inference
python-dotenv
pydantic
```

---

## ✅ Conclusion

- This project uses **SDK Client** for fast, clean integration with Azure AI.
- It is easier to maintain and extend than manual REST-based implementations.
- The FastAPI backend acts as a bridge between the AI model and a Flutter frontend.
- Markdown formatting is supported in responses, and system prompts control the output style.

---

## 🔄 Future Enhancements

- Add support for image input (via Azure Vision API)
- Use REST client for advanced customization
- Add user authentication and role management
- Handle streaming responses (real-time AI typing)

---

📧 **Developed by:**  
Ali Arabi | Machine Learning Engineer. 
📩 **Email:** aliarabimak@gmail.com  
🔗 **LinkedIn:** [Ali Arabi](https://www.linkedin.com/in/aliarabi55/)

