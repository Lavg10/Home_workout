import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_workout_app/constant/colors/app_colors.dart';
import '../controller/admin_controller.dart';
import '../widgets/dashboard_card.dart';
// import '../../../constant/colors/app_colors.dart';

class AdminDashboardScreen extends StatelessWidget {
  AdminDashboardScreen({super.key});

  final AdminController controller = Get.put(AdminController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Obx(
            () => controller.isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Admin Dashboard',
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.green,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      GridView(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 16.h,
                          crossAxisSpacing: 16.w,
                          childAspectRatio: 1.3,
                        ),
                        children: [
                          DashboardCard(
                            title: 'Total Users',
                            count: controller.totalUsers.value.toString(),
                            color: Colors.blueAccent,
                            icon: Icons.person,
                          ),
                          DashboardCard(
                            title: 'Total Exercises',
                            count: controller.totalExercises.value.toString(),
                            color: Colors.orangeAccent,
                            icon: Icons.fitness_center,
                          ),
                        ],
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
