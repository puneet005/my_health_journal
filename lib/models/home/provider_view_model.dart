
class ProviderViewModelData {


  int? id;
  String? userId;
  String? name;
  String? specialization;
  String? webUrl;
  String? acNumber;
  String? phone;
  String? visitDate;
  String? reportInfo;
  int? status;
  String? createdAt;
  String? updatedAt;

  ProviderViewModelData({
    this.id,
    this.userId,
    this.name,
    this.specialization,
    this.webUrl,
    this.acNumber,
    this.phone,
    this.visitDate,
    this.reportInfo,
    this.status,
    this.createdAt,
    this.updatedAt,
  });
  ProviderViewModelData.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    userId = json['user_id']?.toString();
    name = json['name']?.toString();
    specialization = json['specialization']?.toString();
    webUrl = json['web_url']?.toString();
    acNumber = json['ac_number']?.toString();
    phone = json['phone']?.toString();
    visitDate = json['visit_date']?.toString();
    reportInfo = json['report_info']?.toString();
    status = json['status']?.toInt();
    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['name'] = name;
    data['specialization'] = specialization;
    data['web_url'] = webUrl;
    data['ac_number'] = acNumber;
    data['phone'] = phone;
    data['visit_date'] = visitDate;
    data['report_info'] = reportInfo;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class ProviderViewModel {


  String? message;
  int? status;
  bool? success;
  List<ProviderViewModelData>? data;

  ProviderViewModel({
    this.message,
    this.status,
    this.success,
    this.data,
  });
  ProviderViewModel.fromJson(Map<String, dynamic> json) {
    message = json['message']?.toString();
    status = json['status']?.toInt();
    success = json['success'];
  if (json['data'] != null) {
  final v = json['data'];
  final arr0 = <ProviderViewModelData>[];
  v.forEach((v) {
  arr0.add(ProviderViewModelData.fromJson(v));
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
