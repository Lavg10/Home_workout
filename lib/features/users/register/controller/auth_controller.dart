import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:home_workout_app/core/service/register_login/auth_service.dart';
import 'package:home_workout_app/features/admin/admin_homepage/view/admin_dashboard_screen.dart';
import 'package:home_workout_app/features/admin/admin_navbar/view/botton_nav_screen.dart';
// import '../../../core/services/auth_service.dart';

class AuthController extends GetxController {
  final AuthService _authService = AuthService();

  var isLoading = false.obs;

  Future<String?> register(
    String name,
    String email,
    String password,
    String role,
  ) async {
    isLoading.value = true;
    String? res = await _authService.register(name, email, password, role);
    isLoading.value = false;
    return res;
  }

  // RxBool isLoading = false.obs;
  //
  // Login method\
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<String?> login(String email, String password) async {
    try {
      isLoading.value = true;

      // Firebase Login
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      String uid = userCredential.user!.uid;

      // Fetch role from Firestore
      DocumentSnapshot userDoc = await _firestore
          .collection('users')
          .doc(uid)
          .get();

      String role = userDoc['role'] ?? 'user';

      // Role-based navigation
      if (role == 'admin') {
        Get.offAll(() => AdminBottomNavBarScreen());
      } else {
        // Get.offAll(() => UserDashboardScreen());
      }

      return null; // success
    } on FirebaseAuthException catch (e) {
      return e.message;
    } finally {
      isLoading.value = false;
    }
  }
}
