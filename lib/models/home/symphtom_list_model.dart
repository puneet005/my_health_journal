class SymphtomListModelData {
  int? id;
  String? userId;
  String? memberId;
  String? comment;
  String? date;
  String? time;
  String? file;
  int? status;
  String? createdAt;
  String? updatedAt;

  SymphtomListModelData({
    this.id,
    this.userId,
    this.memberId,
    this.comment,
    this.date,
    this.time,
    this.file,
    this.status,
    this.createdAt,
    this.updatedAt,
  });
  SymphtomListModelData.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    userId = json['user_id']?.toString();
    memberId = json['member_id']?.toString();
    comment = json['comment']?.toString();
    date = json['date']?.toString();
    time = json['time']?.toString();
    file = json['file']?.toString();
    status = json['status']?.toInt();
    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['member_id'] = memberId;
    data['comment'] = comment;
    data['date'] = date;
    data['time'] = time;
    data['file'] = file;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class SymphtomListModel {
  String? message;
  int? status;
  bool? success;
  List<SymphtomListModelData>? data;

  SymphtomListModel({
    this.message,
    this.status,
    this.success,
    this.data,
  });
  SymphtomListModel.fromJson(Map<String, dynamic> json) {
    message = json['message']?.toString();
    status = json['status']?.toInt();
    success = json['success'];
  if (json['data'] != null) {
  final v = json['data'];
  final arr0 = <SymphtomListModelData>[];
  v.forEach((v) {
  arr0.add(SymphtomListModelData.fromJson(v));
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
