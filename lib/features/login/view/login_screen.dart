import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_workout_app/constant/colors/app_colors.dart';
import 'package:home_workout_app/features/register/controller/auth_controller.dart';
import 'package:home_workout_app/features/register/widgets/custom_button.dart';
import 'package:home_workout_app/features/register/widgets/custom_textfield.dart';
// import '../controller/auth_controller.dart';
// import '../widgets/custom_textfield.dart';
// import '../widgets/custom_button.dart';
// import '../../../constant/colors/app_colors.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final AuthController authController = Get.put(AuthController());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg_images.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(color: Colors.black.withOpacity(0.5)),
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 300.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20.h),
                Text(
                  'Login',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                20.verticalSpace,
                Container(
                  padding: EdgeInsets.all(40.w),
                  decoration: BoxDecoration(
                    color: AppColors.white.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(16.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 8.r,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      CustomTextField(
                        label: 'Email',
                        controller: emailController,
                        hintText: 'Enter your email',
                      ),
                      SizedBox(height: 12.h),
                      CustomTextField(
                        label: 'Password',
                        controller: passwordController,
                        hintText: 'Enter your password',
                        obscureText: true,
                      ),
                      SizedBox(height: 20.h),
                      Obx(
                        () => authController.isLoading.value
                            ? const CircularProgressIndicator()
                            : CustomButton(
                                title: 'Login',
                                onTap: () async {
                                  String? res = await authController.login(
                                    emailController.text.trim(),
                                    passwordController.text.trim(),
                                  );

                                  if (res == null) {
                                    Get.snackbar('Success', 'Login successful');
                                  } else {
                                    Get.snackbar('Error', res);
                                  }
                                },
                              ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: TextStyle(color: AppColors.white, fontSize: 14.sp),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigate to register screen
                        Get.toNamed('/register');
                      },
                      child: Text(
                        "Register",
                        style: TextStyle(
                          color: AppColors.green,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
