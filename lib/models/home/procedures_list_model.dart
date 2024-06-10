
class ProceduresListModelDataCommentsUserDetails {
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

  ProceduresListModelDataCommentsUserDetails({
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
  ProceduresListModelDataCommentsUserDetails.fromJson(Map<String, dynamic> json) {
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

class ProceduresListModelDataComments {
/*
{
  "id": 17,
  "user_id": "3",
  "member_id": "6",
  "procedures_id": "1",
  "title": "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, co",
  "time": "Tue, 28 May 2024",
  "status": "1",
  "created_at": "2024-05-28T10:46:06.000000Z",
  "updated_at": "2024-05-28T10:46:06.000000Z",
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
*/

  int? id;
  String? userId;
  String? memberId;
  String? proceduresId;
  String? title;
  String? time;
  String? status;
  String? createdAt;
  String? updatedAt;
  ProceduresListModelDataCommentsUserDetails? userDetails;

  ProceduresListModelDataComments({
    this.id,
    this.userId,
    this.memberId,
    this.proceduresId,
    this.title,
    this.time,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.userDetails,
  });
  ProceduresListModelDataComments.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    userId = json['user_id']?.toString();
    memberId = json['member_id']?.toString();
    proceduresId = json['procedures_id']?.toString();
    title = json['title']?.toString();
    time = json['time']?.toString();
    status = json['status']?.toString();
    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
    userDetails = (json['user_details'] != null) ? ProceduresListModelDataCommentsUserDetails.fromJson(json['user_details']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['member_id'] = memberId;
    data['procedures_id'] = proceduresId;
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

class ProceduresListModelData {
/*
{
  "id": 1,
  "user_id": "3",
  "member_id": "6",
  "type": "Test",
  "provider": "Dr singh",
  "date_of_procedure": "29/05/2024",
  "add_comment": null,
  "file": "uploads/procedures/file/27126.jpg",
  "status": 1,
  "created_at": "2024-05-28T10:46:06.000000Z",
  "updated_at": "2024-05-28T10:46:06.000000Z",
  "comments": [
    {
      "id": 17,
      "user_id": "3",
      "member_id": "6",
      "procedures_id": "1",
      "title": "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, co",
      "time": "Tue, 28 May 2024",
      "status": "1",
      "created_at": "2024-05-28T10:46:06.000000Z",
      "updated_at": "2024-05-28T10:46:06.000000Z",
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
*/

  int? id;
  String? userId;
  String? memberId;
  String? type;
  String? provider;
  String? dateOfProcedure;
  String? addComment;
  String? file;
  int? status;
  String? createdAt;
  String? updatedAt;
  List<ProceduresListModelDataComments>? comments;

  ProceduresListModelData({
    this.id,
    this.userId,
    this.memberId,
    this.type,
    this.provider,
    this.dateOfProcedure,
    this.addComment,
    this.file,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.comments,
  });
  ProceduresListModelData.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    userId = json['user_id']?.toString();
    memberId = json['member_id']?.toString();
    type = json['type']?.toString();
    provider = json['provider']?.toString();
    dateOfProcedure = json['date_of_procedure']?.toString();
    addComment = json['add_comment']?.toString();
    file = json['file']?.toString();
    status = json['status']?.toInt();
    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
  if (json['comments'] != null) {
  final v = json['comments'];
  final arr0 = <ProceduresListModelDataComments>[];
  v.forEach((v) {
  arr0.add(ProceduresListModelDataComments.fromJson(v));
  });
    comments = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['member_id'] = memberId;
    data['type'] = type;
    data['provider'] = provider;
    data['date_of_procedure'] = dateOfProcedure;
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

class ProceduresListModel {
/*
{
  "message": "Data Fetach Successfully.",
  "status": 200,
  "success": true,
  "data": [
    {
      "id": 1,
      "user_id": "3",
      "member_id": "6",
      "type": "Test",
      "provider": "Dr singh",
      "date_of_procedure": "29/05/2024",
      "add_comment": null,
      "file": "uploads/procedures/file/27126.jpg",
      "status": 1,
      "created_at": "2024-05-28T10:46:06.000000Z",
      "updated_at": "2024-05-28T10:46:06.000000Z",
      "comments": [
        {
          "id": 17,
          "user_id": "3",
          "member_id": "6",
          "procedures_id": "1",
          "title": "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, co",
          "time": "Tue, 28 May 2024",
          "status": "1",
          "created_at": "2024-05-28T10:46:06.000000Z",
          "updated_at": "2024-05-28T10:46:06.000000Z",
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
  List<ProceduresListModelData>? data;

  ProceduresListModel({
    this.message,
    this.status,
    this.success,
    this.data,
  });
  ProceduresListModel.fromJson(Map<String, dynamic> json) {
    message = json['message']?.toString();
    status = json['status']?.toInt();
    success = json['success'];
  if (json['data'] != null) {
  final v = json['data'];
  final arr0 = <ProceduresListModelData>[];
  v.forEach((v) {
  arr0.add(ProceduresListModelData.fromJson(v));
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
