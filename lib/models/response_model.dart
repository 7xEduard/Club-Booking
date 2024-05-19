class ResponseModel {
  final String status;
  final String message;

  ResponseModel({required this.status, required this.message});

  factory ResponseModel.fromJson(dynamic data) {
    return ResponseModel(
      status: data["status"],
      message: data["message"],
    );
  }
}
