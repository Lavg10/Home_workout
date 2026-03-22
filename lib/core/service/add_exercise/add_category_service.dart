class CategoryService {
  static List<Map<String, dynamic>> getCategories(String type) {
    if (type == 'Beginner') {
      return [
        {'name': 'Chest', 'image': 'assets/images/bg_images.jpg'},
        {'name': 'Shoulder', 'image': 'assets/images/bg_images.jpg'},
        {'name': 'Leg', 'image': 'assets/images/bg_images.jpg'},
        {'name': 'Back', 'image': 'assets/images/bg_images.jpg'},
        {'name': 'Abs', 'image': 'assets/images/bg_images.jpg'},
      ];
    } else if (type == 'Intermediate') {
      return [
        {'name': 'Chest', 'image': 'assets/images/intermediate/chest.png'},
        {
          'name': 'Shoulder',
          'image': 'assets/images/intermediate/shoulder.png',
        },
        {'name': 'Leg', 'image': 'assets/images/intermediate/leg.png'},
        {'name': 'Back', 'image': 'assets/images/intermediate/back.png'},
        {'name': 'Abs', 'image': 'assets/images/intermediate/abs.png'},
      ];
    } else {
      return [
        {'name': 'Chest', 'image': 'assets/images/advanced/chest.png'},
        {'name': 'Shoulder', 'image': 'assets/images/advanced/shoulder.png'},
        {'name': 'Leg', 'image': 'assets/images/advanced/leg.png'},
        {'name': 'Back', 'image': 'assets/images/advanced/back.png'},
        {'name': 'Abs', 'image': 'assets/images/advanced/abs.png'},
      ];
    }
  }
}
