class ProfileModelData {
  int? id;
  String? name;
  String? email;
  String? mobile;
  String? dob;
  String? idCard;
  String? prime;
  String? countryCode;
  String? profile;
  String? address;
  int? status;
  String? notification;
  String? deviceToken;
  String? createdAt;
  String? updatedAt;

  ProfileModelData({
    this.id,
    this.name,
    this.email,
    this.mobile,
    this.dob,
    this.prime,
    this.idCard,
    this.countryCode,
    this.profile,
    this.address,
    this.notification,
    this.status,
    this.deviceToken,
    this.createdAt,
    this.updatedAt,
  });
  ProfileModelData.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    name = json['name']?.toString();
    email = json['email']?.toString();
    mobile = json['mobile']?.toString();
    dob = json['dob']?.toString();
    prime = json['prime']?.toString();
    idCard = json['id_card']?.toString();
    countryCode = json['country_code']?.toString();
    profile = json['profile']?.toString();
    notification = json['notification']?.toString();
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
    data['prime'] = prime;
    data['id_card'] = idCard;
    data['country_code'] = countryCode;
    data['profile'] = profile;
    data['address'] = address;
    data['notification'] = notification;
    data['status'] = status;
    data['device_token'] = deviceToken;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class ProfileModel {
/*
{
  "message": "User Fetach Successfully.",
  "status": 200,
  "data": {
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
  ProfileModelData? data;

  ProfileModel({
    this.message,
    this.status,
    this.data,
  });
  ProfileModel.fromJson(Map<String, dynamic> json) {
    message = json['message']?.toString();
    status = json['status']?.toInt();
    data = (json['data'] != null) ? ProfileModelData.fromJson(json['data']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    if (data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}



class CommentData{
  String? title;
  String? time;
  ProfileModelData? user;


  CommentData({
    this.title,
    this.time,
    this.user,
  });

  CommentData.fromJson(Map<String, dynamic> json) {
    title = json['message']?.toString();
    time = json['status']?.toInt();
    user = (json['data'] != null) ? ProfileModelData.fromJson(json['data']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['message'] = title;
    data['status'] = time;
    if (data != null) {
      data['data'] = this.user!.toJson();
    }
    return data;
  }

}