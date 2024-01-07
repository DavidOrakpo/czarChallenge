import 'dart:io';

import 'package:image_picker/image_picker.dart';


class FilePicker {
  static Future<String?> selectSingleImage() async {
    final XFile? image =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return null;
    // NotificationManager.showLoading(msg: "Updating...");
    final path = File(image.path).path;
    return path;
  }
}
