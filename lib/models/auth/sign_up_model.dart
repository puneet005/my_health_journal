class SignUpModelUser {
  String? name;
  String? mobile;
  String? email;
  String? deviceToken;
  String? updatedAt;
  String? createdAt;
  int? id;

  SignUpModelUser({
    this.name,
    this.mobile,
    this.email,
    this.deviceToken,
    this.updatedAt,
    this.createdAt,
    this.id,
  });
  SignUpModelUser.fromJson(Map<String, dynamic> json) {
    name = json['name']?.toString();
    mobile = json['mobile']?.toString();
    email = json['email']?.toString();
    deviceToken = json['device_token']?.toString();
    updatedAt = json['updated_at']?.toString();
    createdAt = json['created_at']?.toString();
    id = json['id']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['mobile'] = mobile;
    data['email'] = email;
    data['device_token'] = deviceToken;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}

class SignUpModelData {
  String? token;
  String? name;

  SignUpModelData({
    this.token,
    this.name,
  });
  SignUpModelData.fromJson(Map<String, dynamic> json) {
    token = json['token']?.toString();
    name = json['name']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['token'] = token;
    data['name'] = name;
    return data;
  }
}

class SignUpModel {
  int? status;
  String? message;
  SignUpModelData? data;
  SignUpModelUser? user;

  SignUpModel({
    this.status,
    this.message,
    this.data,
    this.user,
  });
  SignUpModel.fromJson(Map<String, dynamic> json) {
    status = json['status']?.toInt();
    message = json['message']?.toString();
    data = (json['data'] != null) ? SignUpModelData.fromJson(json['data']) : null;
    user = (json['user'] != null) ? SignUpModelUser.fromJson(json['user']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (data != null) {
      data['data'] = this.data!.toJson();
    }
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}
