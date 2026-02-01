import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:home_workout_app/features/users/register/model/user_model.dart';
// import '../../features/login/model/user_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// REGISTER USER
  /// Returns null if success, or error message if failed
  Future<String?> register(
    String name,
    String email,
    String password,
    String role,
  ) async {
    try {
      // Create Firebase Auth User
      UserCredential cred = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Create AppUser model
      AppUser user = AppUser(
        uid: cred.user!.uid,
        name: name,
        email: email,
        role: role,
      );

      // Save user to Firestore
      await _firestore.collection('users').doc(user.uid).set(user.toMap());

      Get.snackbar('Success', 'User registered successfully');
      return null;
      // Success
    } catch (e) {
      return e.toString(); // Error message
    }
  }

  /// LOGIN USER
  /// Returns UserCredential if success, or null if failed
  Future<String?> login(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Optional: fetch user info from Firestore if needed
      var userDoc = await _firestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .get();

      if (!userDoc.exists) return 'User data not found';
      return null; // success
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }

  /// LOGOUT USER
  Future<void> logout() async {
    await _auth.signOut();
  }

  /// GET CURRENT USER UID
  String? getCurrentUID() {
    return _auth.currentUser?.uid;
  }

  /// GET CURRENT USER ROLE FROM FIRESTORE
  Future<String?> getUserRole(String uid) async {
    try {
      DocumentSnapshot doc = await _firestore
          .collection('users')
          .doc(uid)
          .get();
      if (doc.exists) {
        return (doc.data() as Map<String, dynamic>)['role'];
      }
      return null;
    } catch (e) {
      print('Get User Role Error: $e');
      return null;
    }
  }
}
