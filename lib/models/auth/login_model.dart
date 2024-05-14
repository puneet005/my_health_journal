class LoginModelUser {
  int? id;
  String? name;
  String? email;
  String? mobile;
  String? dob;
  String? idCard;
  String? countryCode;
  String? profile;
  String? address;
  int? status;
  String? deviceToken;
  String? createdAt;
  String? updatedAt;

  LoginModelUser({
    this.id,
    this.name,
    this.email,
    this.mobile,
    this.dob,
    this.idCard,
    this.countryCode,
    this.profile,
    this.address,
    this.status,
    this.deviceToken,
    this.createdAt,
    this.updatedAt,
  });
  LoginModelUser.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    name = json['name']?.toString();
    email = json['email']?.toString();
    mobile = json['mobile']?.toString();
    dob = json['dob']?.toString();
    idCard = json['id_card']?.toString();
    countryCode = json['country_code']?.toString();
    profile = json['profile']?.toString();
    address = json['address']?.toString();
    status = json['status']?.toInt();
    deviceToken = json['device_token']?.toString();
    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['mobile'] = mobile;
    data['dob'] = dob;
    data['id_card'] = idCard;
    data['country_code'] = countryCode;
    data['profile'] = profile;
    data['address'] = address;
    data['status'] = status;
    data['device_token'] = deviceToken;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class LoginModelData {
/*
{
  "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMmU5NDc0NzEwY2Y0NGMyZTA5ZjNhYmM5OGY5YWM1NDFkMmM5Mjc2YTliZDc1MmYyNTk1ODQ2ZDlmYWQ3MzU3YzZhMDhiZTI0Zjg0ZWJjYmEiLCJpYXQiOjE3MTUyMzAwMDkuOTE0NTgsIm5iZiI6MTcxNTIzMDAwOS45MTQ1ODQsImV4cCI6MTc0Njc2NjAwOS45MDg3MzYsInN1YiI6IjMiLCJzY29wZXMiOltdfQ.IW_4ty4_617dyB-eZ3hlMFRl4OSOjKOpQYiEnvM5pi30zigsv2ukpRjTsk81BJskCOHkk8kuD4PHjvR3oXM4r6ZjUbOa_TDCzz4H1kQ2XXLssvLa4R5OPL6b_N-UKnC4NUyLoI0qTs2RilcrD5Iv57BWiwbyy9GN_gelDbgWqnVKh-x-tytFttnMNhzdcVgJc_evwWvhzYrKGQ32DHjYaD3QYIwk8jdmDPirG1yJxzjCFTgosQv8Q8A_1J0ZR_nhwAO0ULEtZ9FkytquJhTKxrerBWknl1guoUl9wP8EWPoKAxWqodHUQ_SUEH_0UIaJMV78FxY8kN5_0TxGoh68weQkc1aw_3nAZ0lmnTW1mKRL3qxFiNKfOhRAuWGA8sFWZFUCuCcOOLNk982tZu7p5AziGYm0KWs81otN7oWUSZPG-rWSb5IpN-yp4OSIEk7KCddYrWWoKgGgtkZ6d7whlN7i9nt7whX6OiUzK-UQ8kEHksy-Ff0JVV3N0wAJq0pCcEwj7yGyiizPxHeLPV4lpc-Db9QOjgMMB9ENJCaNFJnpVWUz08NlHgvvBVVenkLljd3vrLO6Gha-NZ-RiFlKson_HPTddVeIU5Kpk95nCagUAkYARlgMsxv-_znbFZneW9i-dUQWk2TxAEM5IID9dJA0jozSDmrflNUOmtODJc4",
  "name": "user"
} 
*/

  String? token;
  String? name;

  LoginModelData({
    this.token,
    this.name,
  });
  LoginModelData.fromJson(Map<String, dynamic> json) {
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

class LoginModel {
/*
{
  "message": "Login Successfully.",
  "status": 200,
  "data": {
    "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMmU5NDc0NzEwY2Y0NGMyZTA5ZjNhYmM5OGY5YWM1NDFkMmM5Mjc2YTliZDc1MmYyNTk1ODQ2ZDlmYWQ3MzU3YzZhMDhiZTI0Zjg0ZWJjYmEiLCJpYXQiOjE3MTUyMzAwMDkuOTE0NTgsIm5iZiI6MTcxNTIzMDAwOS45MTQ1ODQsImV4cCI6MTc0Njc2NjAwOS45MDg3MzYsInN1YiI6IjMiLCJzY29wZXMiOltdfQ.IW_4ty4_617dyB-eZ3hlMFRl4OSOjKOpQYiEnvM5pi30zigsv2ukpRjTsk81BJskCOHkk8kuD4PHjvR3oXM4r6ZjUbOa_TDCzz4H1kQ2XXLssvLa4R5OPL6b_N-UKnC4NUyLoI0qTs2RilcrD5Iv57BWiwbyy9GN_gelDbgWqnVKh-x-tytFttnMNhzdcVgJc_evwWvhzYrKGQ32DHjYaD3QYIwk8jdmDPirG1yJxzjCFTgosQv8Q8A_1J0ZR_nhwAO0ULEtZ9FkytquJhTKxrerBWknl1guoUl9wP8EWPoKAxWqodHUQ_SUEH_0UIaJMV78FxY8kN5_0TxGoh68weQkc1aw_3nAZ0lmnTW1mKRL3qxFiNKfOhRAuWGA8sFWZFUCuCcOOLNk982tZu7p5AziGYm0KWs81otN7oWUSZPG-rWSb5IpN-yp4OSIEk7KCddYrWWoKgGgtkZ6d7whlN7i9nt7whX6OiUzK-UQ8kEHksy-Ff0JVV3N0wAJq0pCcEwj7yGyiizPxHeLPV4lpc-Db9QOjgMMB9ENJCaNFJnpVWUz08NlHgvvBVVenkLljd3vrLO6Gha-NZ-RiFlKson_HPTddVeIU5Kpk95nCagUAkYARlgMsxv-_znbFZneW9i-dUQWk2TxAEM5IID9dJA0jozSDmrflNUOmtODJc4",
    "name": "user"
  },
  "user": {
    "id": 3,
    "name": "user",
    "email": "test@yopmail.com",
    "mobile": "9090909090",
    "dob": null,
    "id_card": null,
    "country_code": null,
    "profile": null,
    "address": null,
    "status": 1,
    "device_token": null,
    "created_at": "2024-05-08T10:43:56.000000Z",
    "updated_at": "2024-05-08T10:43:56.000000Z"
  }
} 
*/

  String? message;
  int? status;
  LoginModelData? data;
  LoginModelUser? user;

  LoginModel({
    this.message,
    this.status,
    this.data,
    this.user,
  });
  LoginModel.fromJson(Map<String, dynamic> json) {
    message = json['message']?.toString();
    status = json['status']?.toInt();
    data = (json['data'] != null) ? LoginModelData.fromJson(json['data']) : null;
    user = (json['user'] != null) ? LoginModelUser.fromJson(json['user']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    if (data != null) {
      data['data'] = this.data!.toJson();
    }
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}
