import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_workout_app/constant/colors/app_colors.dart';
// import '../../../constants/app_colors.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;

  const CustomButton({
    super.key,
    required this.onTap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50.h,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(fontSize: 18.sp, color: AppColors.white),
        ),
      ),
    );
  }
}
