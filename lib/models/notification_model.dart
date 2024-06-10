class NotificationModelData {
  int? id;
  String? title;
  String? message;
  String? createdAt;

  NotificationModelData({
    this.id,
    this.title,
    this.message,
    this.createdAt,
  });
  NotificationModelData.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    title = json['title']?.toString();
    message = json['message']?.toString();
    createdAt = json['created_at']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['message'] = message;
    data['created_at'] = createdAt;
    return data;
  }
}

class NotificationModel {
  String? message;
  int? status;
  List<NotificationModelData>? data;

  NotificationModel({
    this.message,
    this.status,
    this.data,
  });
  NotificationModel.fromJson(Map<String, dynamic> json) {
    message = json['message']?.toString();
    status = json['status']?.toInt();
  if (json['data'] != null) {
  final v = json['data'];
  final arr0 = <NotificationModelData>[];
  v.forEach((v) {
  arr0.add(NotificationModelData.fromJson(v));
  });
    this.data = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
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
