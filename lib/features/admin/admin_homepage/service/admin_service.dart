import 'package:cloud_firestore/cloud_firestore.dart';

class AdminService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<int> getTotalUsers() async {
    var snapshot = await _firestore.collection('users').get();
    return snapshot.docs.length;
  }

  Future<int> getTotalExercises() async {
    var snapshot = await _firestore.collection('exercises').get();
    return snapshot.docs.length;
  }
}
