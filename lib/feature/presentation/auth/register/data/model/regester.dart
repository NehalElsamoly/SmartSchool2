import 'dart:convert';
class Regigester {
  bool isSuccess;
  int status;
  String message;

  Regigester({
    required this.isSuccess,
    required this.status,
    required this.message,
  });

  factory Regigester.fromJson(Map<String, dynamic> json) => Regigester(
    isSuccess: json["IsSuccess"],
    status: json["Status"],
    message: json["Message"],
  );

  Map<String, dynamic> toJson() => {
    "IsSuccess": isSuccess,
    "Status": status,
    "Message": message,
  };
}
