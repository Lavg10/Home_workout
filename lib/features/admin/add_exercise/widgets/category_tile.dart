import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'exercise_form.dart';
import 'package:get/get.dart';

class CategoryTile extends StatelessWidget {
  final String category;
  final String type; // Beginner / Intermediate / Advanced

  const CategoryTile({super.key, required this.category, required this.type});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to Exercise Form for that category
        Get.to(() => ExerciseForm(type: type, category: category));
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(8.w),
        padding: EdgeInsets.symmetric(vertical: 20.h),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.2),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: Colors.white, width: 1),
        ),
        child: Text(
          category,
          style: TextStyle(color: Colors.black, fontSize: 16.sp),
        ),
      ),
    );
  }
}
