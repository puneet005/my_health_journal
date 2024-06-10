class AddHistoryModelData {
  int? userId;
  int? memberId;
  String? comment;
  int? type;
  String? updatedAt;
  String? createdAt;
  int? id;
  AddHistoryModelData({
    this.userId,
    this.memberId,
    this.comment,
    this.type,
    this.updatedAt,
    this.createdAt,
    this.id,
  });
  AddHistoryModelData.fromJson(Map<String, dynamic> json) {
    userId = json['user_id']?.toInt();
    memberId = json['member_id']?.toInt();
    comment = json['comment']?.toString();
    type = json['type']?.toInt();
    updatedAt = json['updated_at']?.toString();
    createdAt = json['created_at']?.toString();
    id = json['id']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['user_id'] = userId;
    data['member_id'] = memberId;
    data['comment'] = comment;
    data['type'] = type;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}

class AddHistoryModel {
/*
{
  "message": "History add Successfully",
  "status": 200,
  "data": {
    "user_id": 3,
    "member_id": 1,
    "comment": "This is Comment for Personal History",
    "type": 1,
    "updated_at": "2024-05-28T12:15:59.000000Z",
    "created_at": "2024-05-28T12:15:59.000000Z",
    "id": 2
  }
} 
*/

  String? message;
  int? status;
  AddHistoryModelData? data;

  AddHistoryModel({
    this.message,
    this.status,
    this.data,
  });
  AddHistoryModel.fromJson(Map<String, dynamic> json) {
    message = json['message']?.toString();
    status = json['status']?.toInt();
    data = (json['data'] != null) ? AddHistoryModelData.fromJson(json['data']) : null;
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
