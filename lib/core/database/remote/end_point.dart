class EndPoints {
  static const String baseUrl = 'https://food-api-omega.vercel.app/api/v1/';
  static const String chefSignIn = 'chef/signin';
  static const String chefChangePassword = 'chef/change-password';
  static const String chefDelete = 'chef/delete';
  static const String chefGet = 'chef/get-chef/';
  static const String chefSendCode = 'chef/send-code';
  static const String chefForgetPassword = 'chef/change-forgotten-password';
  static const String updateChef = 'chef/update';
  static const String logout = 'chef/logout';
  static const String addMeal = 'meal/add-to-menu';
  static const String updateMeal = 'chef/update-meal/';
  static const String getAllMeal = 'meal/get-meals';
  static const String deleteMeal = 'meal/delete-meal/';
  static const String signUp = 'chef/signup';

  static String getChefDataEndPoints(String id) {
    return '$chefGet$id';
  }

  static String getUpdateMealEndPoints(String id) {
    return '$updateMeal$id';
  }

  static String getDeleteMealEndPoints(String id) {
    return '$deleteMeal$id';
  }
}

class Apikeys {
  static const String email = 'email';
  static const String name = 'name';
  static const String confirmPassword = 'confirmPassword';
  static const String password = 'password';
  static const String phone = 'phone';
  static const String code = 'code';
  static const String brandName = 'brandName';
  // static const String frontId = 'frontId';
  // static const String backId = 'backId';
  // static const String profilPic = 'profilPic';
  static const String message = 'message';
  static const String token = 'token';
}
