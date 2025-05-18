import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import '../../../screens/suggested_recipecs_objectDe_screen.dart';
import '../../../utilis/assets.dart';
import '../../details_widget/custom_elevaterd_button.dart';

class CameraButtons extends StatelessWidget {
  const CameraButtons({super.key});

  Future<void> _pickImage(BuildContext context, ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SuggestedRecipecsObjectdeScreen(imagePath: pickedFile.path),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 284,
          child: CustomElevatedButton(
            text: 'Take Photo',
            icon: SvgPicture.asset(AppImages.Camera),
            color: const Color(0xffFB9E6A),
            onPress: () {
              _pickImage(context, ImageSource.camera);
            },
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          width: 284,
          child: CustomElevatedButton(
            text: 'Upload photo',
            icon: SvgPicture.asset(AppImages.upload),
            onPress: () {
              _pickImage(context, ImageSource.gallery);
            },
          ),
        ),
      ],
    );
  }
}
