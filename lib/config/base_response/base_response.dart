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
}
