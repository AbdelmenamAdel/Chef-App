import '../utils/app_strings.dart';

class ErrorModel {
  final int status;
  final String errorMessage;
  ErrorModel({required this.status, required this.errorMessage});
  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) => ErrorModel(
        status: jsonData['status'],
        errorMessage: jsonData['status'] == 500
            ? AppStrings.validcode
            : jsonData['ErrorMessage'],
      );
}
