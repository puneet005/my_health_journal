class MedicationListModelData {
  int? id;
  String? userId;
  String? memberId;
  String? name;
  String? dosage;
  String? dosageForm;
  String? prescription;
  String? overTheCounter;
  String? administrationOption;
  String? startDate;
  String? endDate;
  String? custom;
  String? dateAndTime;
  String? nitifyForMedication;
  String? comment;
  String? file;
  int? status;
  String? createdAt;
  String? updatedAt;

  MedicationListModelData({
    this.id,
    this.userId,
    this.memberId,
    this.name,
    this.dosage,
    this.dosageForm,
    this.prescription,
    this.overTheCounter,
    this.administrationOption,
    this.startDate,
    this.endDate,
    this.custom,
    this.dateAndTime,
    this.nitifyForMedication,
    this.comment,
    this.file,
    this.status,
    this.createdAt,
    this.updatedAt,
  });
  MedicationListModelData.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    userId = json['user_id']?.toString();
    memberId = json['member_id']?.toString();
    name = json['name']?.toString();
    dosage = json['dosage']?.toString();
    dosageForm = json['dosage_form']?.toString();
    prescription = json['prescription']?.toString();
    overTheCounter = json['over_the_counter']?.toString();
    administrationOption = json['administration_option']?.toString();
    startDate = json['start_date']?.toString();
    endDate = json['end_date']?.toString();
    custom = json['custom']?.toString();
    dateAndTime = json['date_and_time']?.toString();
    nitifyForMedication = json['nitify_for_medication']?.toString();
    comment = json['comment']?.toString();
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
    data['name'] = name;
    data['dosage'] = dosage;
    data['dosage_form'] = dosageForm;
    data['prescription'] = prescription;
    data['over_the_counter'] = overTheCounter;
    data['administration_option'] = administrationOption;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['custom'] = custom;
    data['date_and_time'] = dateAndTime;
    data['nitify_for_medication'] = nitifyForMedication;
    data['comment'] = comment;
    data['file'] = file;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class MedicationListModel {
/*
{
  "message": "Data Fetach Successfully.",
  "status": 200,
  "success": true,
  "data": [
    {
      "id": 1,
      "user_id": "2",
      "member_id": "2",
      "name": "test",
      "dosage": "asd",
      "dosage_form": "asd",
      "prescription": "asd",
      "over_the_counter": "asd",
      "administration_option": "asd",
      "start_date": "2024-05-12",
      "end_date": "2024-05-25",
      "custom": "asdfsdfs",
      "date_and_time": "2024-05-25 10:30",
      "nitify_for_medication": "1",
      "comment": "ter",
      "file": "uploads/medication/file/22348.png",
      "status": 1,
      "created_at": "2024-05-23T06:51:42.000000Z",
      "updated_at": "2024-05-23T06:51:42.000000Z"
    }
  ]
} 
*/

  String? message;
  int? status;
  bool? success;
  List<MedicationListModelData>? data;

  MedicationListModel({
    this.message,
    this.status,
    this.success,
    this.data,
  });
  MedicationListModel.fromJson(Map<String, dynamic> json) {
    message = json['message']?.toString();
    status = json['status']?.toInt();
    success = json['success'];
  if (json['data'] != null) {
  final v = json['data'];
  final arr0 = <MedicationListModelData>[];
  v.forEach((v) {
  arr0.add(MedicationListModelData.fromJson(v));
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
