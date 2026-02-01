import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_workout_app/constant/colors/app_colors.dart';

class RoleDropdown extends StatelessWidget {
  final RxString selectedRole;
  final String label;

  const RoleDropdown({
    super.key,
    required this.selectedRole,
    this.label = "Role",
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label above dropdown
        Text(
          label,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.white,
          ),
        ),
        SizedBox(height: 6.h),
        Obx(
          () => Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: AppColors.white, width: 1.5),
              color: Colors.transparent, // main box transparent
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: selectedRole.value,
                isExpanded: true,
                dropdownColor: Colors.transparent, // dropdown menu transparent
                iconEnabledColor: AppColors.white, // arrow color
                style: TextStyle(color: AppColors.white, fontSize: 16.sp),
                items: const [
                  DropdownMenuItem(value: 'user', child: Text('User')),
                  DropdownMenuItem(value: 'admin', child: Text('Admin')),
                ],
                onChanged: (value) {
                  if (value != null) selectedRole.value = value;
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
