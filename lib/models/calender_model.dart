
class CalendarModelDataMember {
  int? id;
  String? userId;
  String? name;
 
  String? dob;
  String? relation;
  String? order;
  String? profile;
  String? healthInsuranceInformation;
  String? healthInsuranceDocument;
  String? idProof;
  int? status;
  String? createdAt;
  String? updatedAt;

  CalendarModelDataMember({
    this.id,
    this.userId,
    this.name,    
    this.dob,
    this.relation,
    this.order,
    this.profile,
    this.healthInsuranceInformation,
    this.healthInsuranceDocument,
    this.idProof,
    this.status,
    this.createdAt,
    this.updatedAt,
  });
  CalendarModelDataMember.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    userId = json['user_id']?.toString();
    name = json['name']?.toString();
    
    dob = json['dob']?.toString();
    relation = json['relation']?.toString();
    order = json['order']?.toString();
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
    data['order'] = order;
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

class CalendarModelData {
  int? id;
  String? userId;
  String? name;
  String? scanTest;
  String? type;
  String? dateOfProcedure;
  String? memberId;
  String? providerId;
  String? visitDate;
  String? visitTime;
  String? questionForProvider;
  String? providerComment;
  String? note;
  String? photo;
  String? file;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? titleName;
  CalendarModelDataMember? member;

  CalendarModelData({
    this.id,
    this.userId,
    this.name,
    this.scanTest,
    this.type,
    this.dateOfProcedure,
    this.memberId,
    this.providerId,
    this.visitDate,
    this.visitTime,
    this.questionForProvider,
    this.providerComment,
    this.note,
    this.photo,
    this.file,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.titleName,
    this.member,
  });
  CalendarModelData.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    userId = json['user_id']?.toString();
    name = json['name']?.toString();
    scanTest = json['scan_test']?.toString();
    type = json['type']?.toString();
    dateOfProcedure = json['date_of_procedure']?.toString();
    memberId = json['member_id']?.toString();
    providerId = json['provider_id']?.toString();
    visitDate = json['visit_date']?.toString();
    visitTime = json['visit_time']?.toString();
    questionForProvider = json['question_for_provider']?.toString();
    providerComment = json['provider_comment']?.toString();
    note = json['note']?.toString();
    photo = json['photo']?.toString();
    file = json['file']?.toString();
    status = json['status']?.toInt();
    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
    titleName = json['title_name']?.toString();
    member = (json['member'] != null) ? CalendarModelDataMember.fromJson(json['member']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['scan_test'] = scanTest;
    data['type'] = type;
    data['date_of_procedure'] = dateOfProcedure;
    data['user_id'] = userId;
    data['member_id'] = memberId;
    data['provider_id'] = providerId;
    data['visit_date'] = visitDate;
    data['visit_time'] = visitTime;
    data['question_for_provider'] = questionForProvider;
    data['provider_comment'] = providerComment;
    data['note'] = note;
    data['photo'] = photo;
    data['file'] = file;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['title_name'] = titleName;
    if (member != null) {
      data['member'] = member!.toJson();
    }
    return data;
  }
}

class CalendarModel {
/*
{
  "message": "Data Fetach Successfully.",
  "status": 200,
  "success": true,
  "all_date": [
    "2024-06-12"
  ],
  "data": [
    {
      "id": 1,
      "user_id": "3",
      "member_id": "6",
      "provider_id": "1",
      "visit_date": "2024-06-12",
      "visit_time": null,
      "question_for_provider": "Body Test",
      "provider_comment": "Full Body checkup",
      "note": "Airm and Head",
      "photo": "uploads/appointment/photo/96950.jpg",
      "status": 1,
      "created_at": "2024-05-28T10:50:59.000000Z",
      "updated_at": "2024-05-28T10:50:59.000000Z",
      "title_name": "Appointment",
      "member": {
        "id": 6,
        "user_id": "5",
        "name": "Sam",
        "dob": "29/05/2024",
        "relation": "brother",
        "order": null,
        "profile": null,
        "health_insurance_information": "hxg",
        "health_insurance_document": "uploads/member/insurance_document/13045.jpg",
        "id_proof": null,
        "status": 1,
        "created_at": "2024-05-31T10:24:05.000000Z",
        "updated_at": "2024-05-31T10:24:05.000000Z"
      }
    }
  ]
} 
*/

  String? message;
  int? status;
  bool? success;
  List<String>? allDate;
  List<CalendarModelData>? data;

  CalendarModel({
    this.message,
    this.status,
    this.success,
    this.allDate,
    this.data,
  });
  CalendarModel.fromJson(Map<String, dynamic> json) {
    message = json['message']?.toString();
    status = json['status']?.toInt();
    success = json['success'];
  if (json['all_date'] != null) {
  final v = json['all_date'];
  final arr0 = <String>[];
  v.forEach((v) {
  arr0.add(v.toString());
  });
    allDate = arr0;
    }
  if (json['data'] != null) {
  final v = json['data'];
  final arr0 = <CalendarModelData>[];
  v.forEach((v) {
  arr0.add(CalendarModelData.fromJson(v));
  });
    this.data = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    data['success'] = success;
    if (allDate != null) {
      final v = allDate;
      final arr0 = [];
  v!.forEach((v) {
  arr0.add(v);
  });
      data['all_date'] = arr0;
    }
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
