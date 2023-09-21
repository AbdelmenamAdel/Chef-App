import 'package:chef/core/models/login_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../../../../../core/database/remote/end_point.dart';
import 'chef_state.dart';

class ChefCubit extends Cubit<ChefState> {
  ChefCubit() : super(ChefInitial());

  void signIn() async {
    await Dio().post((EndPoints.baseUrl + EndPoints.chefSignIn), data: {
      Apikeys.email: "abdelmenamadel96@gmail.com",
      Apikeys.password: "anas123"
    }).then((value) {
      var model = LoginModel.fromJson(value.data);
      print(model.message);
    }).catchError(
      (e) {
        print(e.toString());
      },
    );
  }

  void chefChangePassword() async {
    await Dio(
      BaseOptions(
        headers: {
          "token":
              "FOODAPI eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1MDAyOThjYmIwYjAwNDA4NjU2OTYzMCIsImVtYWlsIjoiZmF6bGFrYTI1QGdtYWlsLmNvbSIsIm5hbWUiOiJBbmFzIiwiaWF0IjoxNjk0NjE1ODc3fQ.3zhGAqmxEn0iTPB95vAcC1Q5b2qjsaiA_DL9e9i1UaU",
        },
      ),
    ).patch(EndPoints.baseUrl + EndPoints.chefChangePassword, data: {
      "oldPass": "anas123",
      "newPass": "anas123",
      "confirmPassword": "anas123"
    }).then((value) {
      print(value.data);
    }).catchError(
      (e) {
        print(e.toString());
      },
    );
  }

  void getChefData() async {
    String token =
        "FOODAPI eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1MDJmMTljMjhiMjhkYjkzMDY1ODIyMCIsImVtYWlsIjoiYWJkZWxtZW5hbWFkZWw5NkBnbWFpbC5jb20iLCJuYW1lIjoiQW5hcyIsImlhdCI6MTY5NDg5NzcwNn0.RSMFjKb-RehoypkIjl0MbECvCb_J5aRzV4zg-N6TKEA";
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
    var id = decodedToken['id'];
    print(decodedToken);
    await Dio(
      BaseOptions(
        headers: {
          "token": token,
        },
      ),
    )
        .get(
      EndPoints.baseUrl + EndPoints.getChefDataEndPoints(id),
    )
        .then((value) {
      print(value.data);
    }).catchError(
      (e) {
        print(e.toString());
      },
    );
  }

  void deleteChefData() async {
    String token =
        "FOODAPI eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1MDJmMTljMjhiMjhkYjkzMDY1ODIyMCIsImVtYWlsIjoiYWJkZWxtZW5hbWFkZWw5NkBnbWFpbC5jb20iLCJuYW1lIjoiQW5hcyIsImlhdCI6MTY5NDg5NzcwNn0.RSMFjKb-RehoypkIjl0MbECvCb_J5aRzV4zg-N6TKEA";
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
    var id = decodedToken['id'];
    print(decodedToken);
    await Dio(
      BaseOptions(
        headers: {
          "token": token,
        },
      ),
    ).delete(EndPoints.baseUrl + EndPoints.chefDelete, queryParameters: {
      "id": id,
    }).then((value) {
      print(value.data);
    }).catchError(
      (e) {
        print(e.toString());
      },
    );
  }
}
