import 'package:get/get.dart';
import 'package:home_workout_app/features/admin/admin_homepage/service/admin_service.dart';
// import '../../core/services/admin_service.dart';

class AdminController extends GetxController {
  final AdminService _service = AdminService();

  RxInt totalUsers = 0.obs;
  RxInt totalExercises = 0.obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchDashboardData();
  }

  Future<void> fetchDashboardData() async {
    isLoading.value = true;
    totalUsers.value = await _service.getTotalUsers();
    totalExercises.value = await _service.getTotalExercises();
    isLoading.value = false;
  }
}
