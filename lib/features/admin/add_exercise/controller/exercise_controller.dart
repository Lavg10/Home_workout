import 'dart:io';
import 'package:get/get.dart';
import 'package:home_workout_app/core/service/add_exercise/cloudnary_image_service/store_image_service.dart';
import 'package:home_workout_app/core/service/add_exercise/uplaod_image_service.dart';
import 'package:image_picker/image_picker.dart';
// import '../service/image_upload_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddExerciseController extends GetxController {
  RxBool isLoading = false.obs;
  Rx<File?> selectedImage = Rx<File?>(null);

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // final ImageUploadService _imageService = ImageUploadService();

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage() async {
    final picked = await _picker.pickImage(source: ImageSource.gallery);

    if (picked != null) {
      selectedImage.value = File(picked.path);
    }
  }

  final CloudinaryService _cloudService = CloudinaryService();

  Future<String?> addExercise(
    String name,
    String type,
    String category,
    File imageFile,
    int sets,
    int reps,
  ) async {
    try {
      isLoading.value = true;

      String? imageUrl = await _cloudService.uploadImage(imageFile);

      await _firestore.collection('exercises').add({
        'name': name,
        'type': type,
        'category': category,
        'image': imageUrl,
        'sets': sets,
        'reps': reps,
        'createdAt': FieldValue.serverTimestamp(),
      });

      return null;
    } catch (e) {
      return e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
