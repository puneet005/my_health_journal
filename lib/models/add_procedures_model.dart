///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class AddProceduresModelData {
/*
{
  "user_id": 3,
  "member_id": "6",
  "type": "test",
  "provider": "Dr singh",
  "date_of_procedure": "29/05/2024",
  "updated_at": "2024-05-28T09:29:29.000000Z",
  "created_at": "2024-05-28T09:29:29.000000Z",
  "id": 13
} 
*/

  int? userId;
  String? memberId;
  String? type;
  String? provider;
  String? dateOfProcedure;
  String? updatedAt;
  String? createdAt;
  int? id;

  AddProceduresModelData({
    this.userId,
    this.memberId,
    this.type,
    this.provider,
    this.dateOfProcedure,
    this.updatedAt,
    this.createdAt,
    this.id,
  });
  AddProceduresModelData.fromJson(Map<String, dynamic> json) {
    userId = json['user_id']?.toInt();
    memberId = json['member_id']?.toString();
    type = json['type']?.toString();
    provider = json['provider']?.toString();
    dateOfProcedure = json['date_of_procedure']?.toString();
    updatedAt = json['updated_at']?.toString();
    createdAt = json['created_at']?.toString();
    id = json['id']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['user_id'] = userId;
    data['member_id'] = memberId;
    data['type'] = type;
    data['provider'] = provider;
    data['date_of_procedure'] = dateOfProcedure;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}

class AddProceduresModel {
/*
{
  "message": "Procedures add Successfully",
  "status": 200,
  "data": {
    "user_id": 3,
    "member_id": "6",
    "type": "test",
    "provider": "Dr singh",
    "date_of_procedure": "29/05/2024",
    "updated_at": "2024-05-28T09:29:29.000000Z",
    "created_at": "2024-05-28T09:29:29.000000Z",
    "id": 13
  }
} 
*/

  String? message;
  int? status;
  AddProceduresModelData? data;

  AddProceduresModel({
    this.message,
    this.status,
    this.data,
  });
  AddProceduresModel.fromJson(Map<String, dynamic> json) {
    message = json['message']?.toString();
    status = json['status']?.toInt();
    data = (json['data'] != null) ? AddProceduresModelData.fromJson(json['data']) : null;
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
