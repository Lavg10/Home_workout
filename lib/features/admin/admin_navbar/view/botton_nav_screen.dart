import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_workout_app/constant/colors/app_colors.dart';
import 'package:home_workout_app/features/admin/add_exercise/view/add_exercise_screen.dart';
import 'package:home_workout_app/features/admin/admin_navbar/controller/bottom_nva_controller.dart';
// import 'bottom_nav_controller.dart';
// import '../../../constant/colors/app_colors.dart';
import '../../admin_homepage/view/admin_dashboard_screen.dart';
// import '../../user_dashboard/view/user_dashboard_screen.dart';
// import '../../profile/view/profile_screen.dart';
// import '../../exercise/view/add_exercise_screen.dart';

class AdminBottomNavBarScreen extends StatelessWidget {
  AdminBottomNavBarScreen({super.key});

  final BottomNavController controller = Get.put(BottomNavController());

  // Screens for each tab
  final List<Widget> _screens = [
    AdminDashboardScreen(), // Home
   AddExerciseScreen(),  // Add Exercise (Admin)

    // ProfileScreen(),       // Profile
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: _screens[controller.selectedIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.selectedIndex.value,
          onTap: controller.changeIndex,
          backgroundColor: AppColors.white,
          selectedItemColor: AppColors.green,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Add Exercise',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
