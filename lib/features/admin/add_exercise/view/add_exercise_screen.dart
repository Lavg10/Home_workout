import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_workout_app/constant/colors/app_colors.dart';
import '../controller/category_controller.dart';
import '../widgets/category_tile.dart';

class AddExerciseScreen extends StatelessWidget {
  AddExerciseScreen({super.key});

  final List<String> tabs = ['Beginner', 'Intermediate', 'Advanced'];
  final CategoryController controller = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.green,
          title: Text('Add Exercises'),
          bottom: TabBar(tabs: tabs.map((e) => Tab(text: e)).toList()),
        ),
        body: TabBarView(
          children: tabs.map((type) {
            final categories = controller.getCategories(type);

            return GridView.builder(
              padding: EdgeInsets.all(16.w),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12.w,
                mainAxisSpacing: 12.h,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final item = categories[index];

                return CategoryTile(
                  category: item['name'],
                  type: type,
                  image: item['image'],
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
