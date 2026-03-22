import 'package:get/get.dart';
import 'package:home_workout_app/core/service/add_exercise/add_category_service.dart';
// import '../service/category_service.dart';

class CategoryController extends GetxController {
  List<Map<String, dynamic>> getCategories(String type) {
    return CategoryService.getCategories(type);
  }
}
