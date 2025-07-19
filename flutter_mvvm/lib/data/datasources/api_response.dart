class ApiResponse<T> {
  T? data;
  String? error;

  ApiResponse.error({required this.error});
  ApiResponse.success({required this.data});
}
