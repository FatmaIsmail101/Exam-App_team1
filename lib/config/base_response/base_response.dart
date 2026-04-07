import '../../../core/values/app_strings.dart';

sealed class BaseResponse<T> {}

class SuccessBaseResponse<T> extends BaseResponse<T> {
  final String? message;
  final T? data;

  SuccessBaseResponse({this.message, this.data});
}

class ErrorBaseResponse<T> extends BaseResponse<T> {
  final String? message;
  final int? code;

  ErrorBaseResponse({this.message, this.code});

  String get displayMessage => switch (code) {
    401 => AppStrings.incorrectCredentials,
    403 => AppStrings.unauthorized,
    404 => AppStrings.accountNotFound,
    500 => AppStrings.serverError,
    _   => message ?? AppStrings.unknownError,
  };
}