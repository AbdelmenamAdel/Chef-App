import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';

Future<XFile?> pickImage(ImageSource source) async {
  final XFile? image = await ImagePicker().pickImage(source: source);
  if (image != null) {
    return image;
  } else {
    return null;
  }
}

Future<MultipartFile> uploadImageToApi(XFile image) async {
  return MultipartFile.fromFileSync(image.path,
      filename: image.path.split('/').last);
}
