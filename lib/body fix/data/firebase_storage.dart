import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageFiles {
  static final _reference = FirebaseStorage.instance.ref();

  static Future<String?> uploadImage(PlatformFile? pickerImage) async {
    if (pickerImage == null) return null;
    final imageName = pickerImage.name;
    final image = File(pickerImage.path!);
    try {
      final ref = _reference.child(imageName);
      final uploadTask = ref.putFile(image);
      final snapShot = await uploadTask.whenComplete(() {});
      return await snapShot.ref.getDownloadURL();
    } catch (e) {
      print("ERORR");
      return null;
    }
  }
}
