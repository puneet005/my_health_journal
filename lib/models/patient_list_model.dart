class PatientListMember {


  int? id;
  String? userId;
  String? name;
  String? dob;
  String? relation;
  String? profile;
  String? healthInsuranceInformation;
  String? healthInsuranceDocument;
  String? idProof;
  int? status;
  String? createdAt;
  String? updatedAt;

  PatientListMember({
    this.id,
    this.userId,
    this.name,
    this.dob,
    this.relation,
    this.profile,
    this.healthInsuranceInformation,
    this.healthInsuranceDocument,
    this.idProof,
    this.status,
    this.createdAt,
    this.updatedAt,
  });
  PatientListMember.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    userId = json['user_id']?.toString();
    name = json['name']?.toString();
    dob = json['dob']?.toString();
    relation = json['relation']?.toString();
    profile = json['profile']?.toString();
    healthInsuranceInformation = json['health_insurance_information']?.toString();
    healthInsuranceDocument = json['health_insurance_document']?.toString();
    idProof = json['id_proof']?.toString();
    status = json['status']?.toInt();
    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['name'] = name;
    data['dob'] = dob;
    data['relation'] = relation;
    data['profile'] = profile;
    data['health_insurance_information'] = healthInsuranceInformation;
    data['health_insurance_document'] = healthInsuranceDocument;
    data['id_proof'] = idProof;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class PatientList {


  String? message;
  int? status;
  bool? success;
  List<PatientListMember>? member;

  PatientList({
    this.message,
    this.status,
    this.success,
    this.member,
  });
  PatientList.fromJson(Map<String, dynamic> json) {
    message = json['message']?.toString();
    status = json['status']?.toInt();
    success = json['success'];
  if (json['member'] != null) {
  final v = json['member'];
  final arr0 = <PatientListMember>[];
  v.forEach((v) {
  arr0.add(PatientListMember.fromJson(v));
  });
    member = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    data['success'] = success;
    if (member != null) {
      final v = member;
      final arr0 = [];
  v!.forEach((v) {
  arr0.add(v.toJson());
  });
      data['member'] = arr0;
    }
    return data;
  }
}
