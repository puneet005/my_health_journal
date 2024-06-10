class GetHistoryModelData {
  int? id;
  String? userId;
  String? comment;
  String? memberId;
  String? text;
  String? type;
  String? status;
  String? createdAt;
  String? updatedAt;

  GetHistoryModelData({
    this.id,
    this.userId,
    this.comment,
    this.memberId,
    this.text,
    this.type,
    this.status,
    this.createdAt,
    this.updatedAt,
  });
  GetHistoryModelData.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    userId = json['user_id']?.toString();
    comment = json['comment']?.toString();
    memberId = json['member_id']?.toString();
    text = json['text']?.toString();
    type = json['type']?.toString();
    status = json['status']?.toString();
    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['comment'] = comment;
    data['member_id'] = memberId;
    data['text'] = text;
    data['type'] = type;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
class GetHistoryModel {
  String? message;
  int? status;
  bool? success;
  List<GetHistoryModelData>? data;

  GetHistoryModel({
    this.message,
    this.status,
    this.success,
    this.data,
  });
  GetHistoryModel.fromJson(Map<String, dynamic> json) {
    message = json['message']?.toString();
    status = json['status']?.toInt();
    success = json['success'];
  if (json['data'] != null) {
  final v = json['data'];
  final arr0 = <GetHistoryModelData>[];
  v.forEach((v) {
  arr0.add(GetHistoryModelData.fromJson(v));
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
  arr0.add(v.toJson());
  });
      data['data'] = arr0;
    }
    return data;
  }
}
