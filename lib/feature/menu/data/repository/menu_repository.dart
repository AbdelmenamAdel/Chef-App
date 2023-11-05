import 'package:chef/core/common/pick_image.dart';
import 'package:chef/core/database/remote/api_consumer.dart';
import 'package:chef/core/database/remote/end_point.dart';
import 'package:chef/core/errors/exception.dart';
import 'package:chef/core/services/service_locator.dart';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

class MenuRepository {
  Future<Either<String, String>> addDishToMenu({
    required XFile image,
    required String mealName,
    required String mealDesc,
    required String mealCate,
    required String howToSell,
    required double mealPrice,
  }) async {
    try {
      final response = await sl<ApiConsumer>().post(EndPoints.addMeal, data: {
        Apikeys.name: mealName,
        Apikeys.price: mealPrice,
        Apikeys.category: mealCate,
        Apikeys.description: mealDesc,
        Apikeys.howToSell: howToSell,
        Apikeys.mealImages: await uploadImageToApi(image),
      });
      return Right(response[Apikeys.message]);
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }
}
