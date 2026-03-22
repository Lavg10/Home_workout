// import 'dart:io';
// import 'package:firebase_storage/firebase_storage.dart';

// class ImageUploadService {
//   final FirebaseStorage _storage = FirebaseStorage.instance;

//   Future<String?> uploadImage(File file) async {
//     try {
//       String fileName = DateTime.now().millisecondsSinceEpoch.toString();

//       Reference ref = _storage.ref().child('exercise_images/$fileName');

//       UploadTask uploadTask = ref.putFile(file);

//       TaskSnapshot snapshot = await uploadTask;

//       String downloadUrl = await snapshot.ref.getDownloadURL();

//       return downloadUrl;
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }
// }
