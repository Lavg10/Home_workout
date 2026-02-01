import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_workout_app/constant/colors/app_colors.dart';
import '../controller/auth_controller.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/custom_button.dart';
import '../widgets/role_dropdown.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final AuthController authController = Get.put(AuthController());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final RxString selectedRole = 'user'.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg_images.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Semi-transparent overlay
          Container(color: Colors.black.withOpacity(0.5)),
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 45.w, vertical: 200.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // left alignment
              children: [
                // Top-left Logo / Icon
                SizedBox(
                  height: 60.h,
                  width: 60.w,
                  child: Image.asset(
                    'assets/images/bg_icon.png',
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 20.h),

                // Title
                Center(
                  child: Text(
                    'Register Users',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                20.verticalSpace,

                // Card Form
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
                        label: 'Name',
                        controller: nameController,
                        hintText: 'Enter your name',
                      ),
                      SizedBox(height: 12.h),
                      CustomTextField(
                        label: 'Email',
                        controller: emailController,
                        hintText: 'Enter your email',
                      ),
                      SizedBox(height: 12.h),
                      CustomTextField(
                        label: 'Password',
                        controller: passwordController,
                        hintText: 'Enter password',
                        obscureText: true,
                      ),
                      SizedBox(height: 12.h),
                      RoleDropdown(selectedRole: selectedRole),
                      SizedBox(height: 20.h),
                      Obx(
                        () => authController.isLoading.value
                            ? const CircularProgressIndicator()
                            : CustomButton(
                                title: 'Register',
                                onTap: () async {
                                  String? res = await authController.register(
                                    nameController.text.trim(),
                                    emailController.text.trim(),
                                    passwordController.text.trim(),
                                    selectedRole.value,
                                  );

                                  if (res == null) {
                                    Get.snackbar(
                                      'Success',
                                      'User registered successfully',
                                    );
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

                // Login Link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: TextStyle(color: AppColors.white, fontSize: 14.sp),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed('/login');
                      },
                      child: Text(
                        "Login",
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
