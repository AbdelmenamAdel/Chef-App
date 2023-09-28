import 'package:chef/core/database/remote/api_consumer.dart';
import 'package:chef/core/database/remote/end_point.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/error_model.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/models/login_model.dart';
import '../../../../core/services/service_locator.dart';

class AuthRepository {
  //! Login auth function
  Future<Either<String, LoginModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await sl<ApiConsumer>().post(
        EndPoints.chefSignIn,
        data: {
          Apikeys.email: email,
          Apikeys.password: password,
        },
      );
      return Right(LoginModel.fromJson(response));
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }

  //! Sign Up auth function
  Future<Either<ErrorModel, LoginModel>> signUp({
    required String email,
    required String name,
    required String phone,
    required String confirmPassword,
    required String brandName,
    required String password,
  }) async {
    try {
      final response = await sl<ApiConsumer>().post(
        EndPoints.signUp,
        data: {
          Apikeys.name: name,
          Apikeys.phone: phone,
          Apikeys.email: email,
          Apikeys.password: password,
          Apikeys.confirmPassword: confirmPassword,
          Apikeys.brandName: brandName,
        },
      );
      return Right(LoginModel.fromJson(response));
    } on ServerException catch (error) {
      return Left(error.errorModel);
    }
  }

  //! send code auth function
  Future<Either<String, String>> sendCode(String email) async {
    try {
      final response = await sl<ApiConsumer>().post(
        EndPoints.chefSendCode,
        data: {
          Apikeys.email: email,
        },
      );
      return Right(response[Apikeys.message]);
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }

  //!!!!!!!!
  Future<Either<String, String>> resetPassword({
    required String email,
    required String password,
    required String confirmPassword,
    required String code,
  }) async {
    try {
      final response = await sl<ApiConsumer>().patch(
        EndPoints.chefForgetPassword,
        data: {
          Apikeys.email: email,
          Apikeys.password: password,
          Apikeys.confirmPassword: confirmPassword,
          Apikeys.code: code,
        },
      );
      return Right(response[Apikeys.message]);
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
