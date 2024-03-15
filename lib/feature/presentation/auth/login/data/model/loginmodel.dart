class ApiResponse {
  final bool isSuccess;
  final int status;
  final String? token;
  final String? error;

  ApiResponse({
    required this.isSuccess,
    required this.status,
    this.token,
    this.error,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      isSuccess: json['IsSuccess'],
      status: json['Status'],
      token: json['token'],
      error: json['Error'],
    );
  }
}
