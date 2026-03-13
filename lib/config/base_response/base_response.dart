sealed class BaseResponse<T> {}

class SuccessBaseResponse<T> extends BaseResponse<T> {
  final String message;
  final T data;

  SuccessBaseResponse({
    required this.message,
    required this.data,
  });
}

class ErrorBaseResponse<T> extends BaseResponse<T> {
  final String message;
  final int code;

  ErrorBaseResponse({
    required this.message,
    required this.code,
  });
}