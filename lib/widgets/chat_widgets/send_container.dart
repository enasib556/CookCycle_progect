import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:university_graduate_project/utilis/color.dart';

class SendContainer extends StatelessWidget {
  final TextEditingController messageController;
  final VoidCallback sendMessage;
  final VoidCallback toggleRecording;
  final VoidCallback showOption;
  final bool isRecording;

  const SendContainer({
    super.key,
    required this.messageController,
    required this.sendMessage,
    required this.toggleRecording,
    required this.showOption,
    required this.isRecording,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Material(
        elevation: 4,
        shadowColor: Colors.grey,
        borderRadius: BorderRadius.circular(17),
        child: Container(
          width: 360,
          height: 72,
          padding: const EdgeInsets.symmetric(horizontal: 3),
          decoration: BoxDecoration(
            border: Border.all(color: primaryColor),
            color: secondaryColor.withOpacity(0.8),
            borderRadius: BorderRadius.circular(17),
          ),
          child: Row(
            children: [
              const SizedBox(width: 5),
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white,
                child: IconButton(
                  icon: isRecording
                      ? const Icon(Icons.stop, color: Color(0xFF00643A), size: 24)
                      : const Icon(Icons.mic, color: Color(0xFF00643A), size: 24),
                  onPressed: toggleRecording,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Container(
                  constraints: const BoxConstraints(minHeight: 42),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: const Color(0xFFA8BBB3).withOpacity(0.72),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: messageController,
                          maxLines: null,
                          decoration: const InputDecoration(
                            hintText: "Type your message",
                            hintStyle: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 0.49),
                              fontSize: 15,
                            ),
                            border: InputBorder.none,
                          ),
                          style: const TextStyle(color: Color.fromRGBO(0, 0, 0, 0.49)),
                        ),
                      ),
                      IconButton(
                        icon: SvgPicture.asset('assets/icons/Vector.svg'),
                        onPressed: showOption,
                      ),
                    ],
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.send, color: Color(0xFF00643A), size: 24),
                onPressed: sendMessage,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
