class GetTestScanModelDataCommentsUserDetails {
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

  GetTestScanModelDataCommentsUserDetails({
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
  GetTestScanModelDataCommentsUserDetails.fromJson(Map<String, dynamic> json) {
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

class GetTestScanModelDataComments {
  int? id;
  String? userId;
  String? memberId;
  String? testscanId;
  String? title;
  String? time;
  String? status;
  String? createdAt;
  String? updatedAt;
  GetTestScanModelDataCommentsUserDetails? userDetails;

  GetTestScanModelDataComments({
    this.id,
    this.userId,
    this.memberId,
    this.testscanId,
    this.title,
    this.time,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.userDetails,
  });
  GetTestScanModelDataComments.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    userId = json['user_id']?.toString();
    memberId = json['member_id']?.toString();
    testscanId = json['testscan_id']?.toString();
    title = json['title']?.toString();
    time = json['time']?.toString();
    status = json['status']?.toString();
    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
    userDetails = (json['user_details'] != null) ? GetTestScanModelDataCommentsUserDetails.fromJson(json['user_details']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['member_id'] = memberId;
    data['testscan_id'] = testscanId;
    data['title'] = title;
    data['time'] = time;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (userDetails != null) {
      data['user_details'] = userDetails!.toJson();
    }
    return data;
  }
}

class GetTestScanModelData {


  int? id;
  String? userId;
  String? memberId;
  String? name;
  String? provider;
  String? scanTest;
  String? addComment;
  String? file;
  int? status;
  String? createdAt;
  String? updatedAt;
  List<GetTestScanModelDataComments>? comments;

  GetTestScanModelData({
    this.id,
    this.userId,
    this.memberId,
    this.name,
    this.provider,
    this.scanTest,
    this.addComment,
    this.file,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.comments,
  });
  GetTestScanModelData.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    userId = json['user_id']?.toString();
    memberId = json['member_id']?.toString();
    name = json['name']?.toString();
    provider = json['provider']?.toString();
    scanTest = json['scan_test']?.toString();
    addComment = json['add_comment']?.toString();
    file = json['file']?.toString();
    status = json['status']?.toInt();
    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
  if (json['comments'] != null) {
  final v = json['comments'];
  final arr0 = <GetTestScanModelDataComments>[];
  v.forEach((v) {
  arr0.add(GetTestScanModelDataComments.fromJson(v));
  });
    comments = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['member_id'] = memberId;
    data['name'] = name;
    data['provider'] = provider;
    data['scan_test'] = scanTest;
    data['add_comment'] = addComment;
    data['file'] = file;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (comments != null) {
      final v = comments;
      final arr0 = [];
  v!.forEach((v) {
  arr0.add(v!.toJson());
  });
      data['comments'] = arr0;
    }
    return data;
  }
}

class GetTestScanModel {
/*
{
  "message": "Data Fetch Successfully.",
  "status": 200,
  "success": true,
  "data": [
    {
      "id": 1,
      "user_id": "3",
      "member_id": "6",
      "name": "Blood Test",
      "provider": "Dr singh",
      "scan_test": "29/05/2024",
      "add_comment": null,
      "file": "uploads/procedures/file/33508.jpg",
      "status": 1,
      "created_at": "2024-05-28T10:40:58.000000Z",
      "updated_at": "2024-05-28T10:40:58.000000Z",
      "comments": [
        {
          "id": 15,
          "user_id": "3",
          "member_id": "6",
          "testscan_id": "1",
          "title": "The first treatment is to calm the inflammation and control the swelling and pin. This can be managed with Rest, Ice, Painkillers and Elevation.",
          "time": "Tue, 28 May 2024",
          "status": "1",
          "created_at": "2024-05-28T10:40:58.000000Z",
          "updated_at": "2024-05-28T10:40:58.000000Z",
          "user_details": {
            "id": 3,
            "name": "user",
            "email": "rranjansingh25@gmail.com",
            "mobile": "7894479302",
            "dob": null,
            "id_card": null,
            "country_code": null,
            "profile": null,
            "address": null,
            "status": 1,
            "device_token": "cbbLDQFrxk5MsJ9M5g5NDk:APA91bGoyIcL2hAphZrnC30A4IFhF7aKL_iDMC5Sz8tNhOsgS5FFX--xeLhY2s7gKoVDVJo7WqdZIKlmHMTz3zymyF8i-HkJijvQVzgUJedOZh-dyIcXsnA2zBbokyK3580ulGHQ9UmW",
            "created_at": "2024-05-28T07:59:14.000000Z",
            "updated_at": "2024-05-28T08:46:11.000000Z"
          }
        }
      ]
    }
  ]
} 
*/

  String? message;
  int? status;
  bool? success;
  List<GetTestScanModelData>? data;

  GetTestScanModel({
    this.message,
    this.status,
    this.success,
    this.data,
  });
  GetTestScanModel.fromJson(Map<String, dynamic> json) {
    message = json['message']?.toString();
    status = json['status']?.toInt();
    success = json['success'];
  if (json['data'] != null) {
  final v = json['data'];
  final arr0 = <GetTestScanModelData>[];
  v.forEach((v) {
  arr0.add(GetTestScanModelData.fromJson(v));
  });
    this.data = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    data['success'] = success;
    if (this.data != null) {
      final v = this.data;
      final arr0 = [];
  v!.forEach((v) {
  arr0.add(v!.toJson());
  });
      data['data'] = arr0;
    }
    return data;
  }
}
