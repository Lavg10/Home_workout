import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddExerciseController extends GetxController {
  RxBool isLoading = false.obs;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String?> addExercise(String name, String type, String category) async {
    try {
      isLoading.value = true;
      await _firestore.collection('exercises').add({
        'name': name,
        'type': type, // Beginner/Intermediate/Advanced
        'category': category, // Chest, Leg, Shoulder...
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
