import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/route_manager.dart';
import 'package:home_workout_app/features/login/view/login_screen.dart';
import 'package:home_workout_app/features/register/view/register_screen.dart';

class AppPages {
  static final pages = [
    // Define your app pages here
    GetPage(name: '/register', page: () => RegisterScreen()),
    GetPage(name: '/login', page: () => LoginScreen()),
  ];
}
