import 'package:chef/core/database/remote/end_point.dart';

class MealModel {
  final String id;
  final String name;
  final String description;
  final String howToSell;
  final String category;
  final String chefId;
  final String status;
  final String createdAt;
  final String updatedAt;
  final int price;
  List<String> images;
  MealModel({
    required this.id,
    required this.name,
    required this.description,
    required this.howToSell,
    required this.category,
    required this.chefId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.price,
    required this.images,
  });
  factory MealModel.fromJson(Map<String, dynamic> jsonData) {
    return MealModel(
      id: jsonData['_id'],
      name: jsonData['name'],
      description: jsonData['description'],
      howToSell: jsonData['howToSell'],
      category: jsonData['category'],
      chefId: jsonData['chefId'],
      status: jsonData['status'],
      createdAt: jsonData['createdAt'],
      updatedAt: jsonData['updatedAt'],
      price: jsonData['price'],
      images: List<String>.from(jsonData['images']),
    );
  }
}

class GetAllMealsModel {
  final String message;
  final List<MealModel> meals;
  factory GetAllMealsModel.fromJson(Map<String, dynamic> jsonData) {
    return GetAllMealsModel(
        message: jsonData[Apikeys.message],
        meals: jsonData[Apikeys.meals]
            .map<MealModel>((i) => MealModel.fromJson(i))
            .toList());
  }

  GetAllMealsModel({required this.message, required this.meals});
}
