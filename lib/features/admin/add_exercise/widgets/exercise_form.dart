import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_workout_app/constant/colors/app_colors.dart';
import 'package:home_workout_app/features/admin/add_exercise/controller/exercise_controller.dart';
import 'package:home_workout_app/features/users/register/widgets/custom_button.dart';
import 'package:home_workout_app/features/users/register/widgets/custom_textfield.dart';
// import '../../controller/add_exercise_controller.dart';
// import '../../../constant/colors/app_colors.dart';
// import '../../../shared/widgets/custom_textfield.dart';
// import '../../../shared/widgets/custom_button.dart';

class ExerciseForm extends StatelessWidget {
  final AddExerciseController controller = Get.put(AddExerciseController());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
  final TextEditingController setsController = TextEditingController();
  final TextEditingController repsController = TextEditingController();
  final String type; // Beginner/Intermediate/Advanced
  final String category; // Chest/Leg/Shoulder/Back/Abs

  ExerciseForm({super.key, required this.type, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.green,
        title: Text('$type - $category'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            // CustomTextField(
            //   label: 'Exercise Name',
            //   controller: nameController,
            //   hintText: 'Enter exercise name',
            // ),
            CustomTextField(
              label: 'Exercise Name',
              controller: nameController,
              hintText: 'Enter exercise name',
            ),

            SizedBox(height: 12.h),

            Obx(() {
              return Column(
                children: [
                  controller.selectedImage.value == null
                      ? const Text("No image selected")
                      : Image.file(
                          controller.selectedImage.value!,
                          height: 120,
                        ),

                  SizedBox(height: 10.h),

                  CustomButton(
                    title: "Pick Image",
                    onTap: () {
                      controller.pickImage();
                    },
                  ),
                ],
              );
            }),

            SizedBox(height: 12.h),

            CustomTextField(
              label: 'Sets',
              controller: setsController,
              hintText: 'Enter sets (e.g. 3)',
            ),

            SizedBox(height: 12.h),

            CustomTextField(
              label: 'Reps',
              controller: repsController,
              hintText: 'Enter reps (e.g. 12)',
            ),
            SizedBox(height: 20.h),
            Obx(
              () => controller.isLoading.value
                  ? const CircularProgressIndicator()
                  : CustomButton(
                      title: 'Add Exercise',
                      onTap: () async {
                        if (controller.selectedImage.value == null) {
                          Get.snackbar('Error', 'Please select an image');
                          return;
                        }

                        String? res = await controller.addExercise(
                          nameController.text.trim(),
                          type,
                          category,
                          controller.selectedImage.value!, //  image pass
                          int.tryParse(setsController.text.trim()) ?? 0,
                          int.tryParse(repsController.text.trim()) ?? 0,
                        );

                        if (res == null) {
                          Get.snackbar(
                            'Success',
                            'Exercise added successfully',
                          );

                          nameController.clear();
                          setsController.clear();
                          repsController.clear();
                        } else {
                          Get.snackbar('Error', res);
                        }
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
