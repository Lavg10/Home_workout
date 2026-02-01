import 'package:get/get.dart';
import 'package:home_workout_app/core/service/register_login/auth_service.dart';
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
  // Login method
  Future<String?> login(String email, String password) async {
    isLoading.value = true;
    String? res = await _authService.login(email, password);
    isLoading.value = false;
    return res;
  }
}
