class ForgetPasswordModel {
  String? message;
  int? status;
  int? otp;
  bool? success;

  ForgetPasswordModel({
    this.message,
    this.status,
    this.otp,
    this.success,
  });
  ForgetPasswordModel.fromJson(Map<String, dynamic> json) {
    message = json['message']?.toString();
    status = json['status']?.toInt();
    otp = json['otp']?.toInt();
    success = json['success'];
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    data['otp'] = otp;
    data['success'] = success;
    return data;
  }
}
