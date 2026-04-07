class BaseState<T> {
  final bool isLoading;
  final String? errorMessage;
  final T? data;

  const BaseState({
    this.isLoading = false,
    this.errorMessage,
    this.data,
  });
}