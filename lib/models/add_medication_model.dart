class AddMedicationModelData {
  String? file;
  int? userId;
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
  String? updatedAt;
  String? createdAt;
  int? id;

  AddMedicationModelData({
    this.file,
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
    this.updatedAt,
    this.createdAt,
    this.id,
  });
  AddMedicationModelData.fromJson(Map<String, dynamic> json) {
    file = json['file']?.toString();
    userId = json['user_id']?.toInt();
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
    updatedAt = json['updated_at']?.toString();
    createdAt = json['created_at']?.toString();
    id = json['id']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['file'] = file;
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
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}

class AddMedicationModel {
/*
{
  "message": "Medication add Successfully",
  "status": 200,
  "data": {
    "file": "uploads/medication/file/67064.jpg",
    "user_id": 2,
    "member_id": "1",
    "name": "Oxycodone",
    "dosage": "10 mg",
    "dosage_form": "Pill",
    "prescription": "True",
    "over_the_counter": "True",
    "administration_option": "PM",
    "start_date": "27/05/2024",
    "end_date": "02/06/2024",
    "custom": null,
    "date_and_time": "25/06/2024 11 : 57  am",
    "nitify_for_medication": "1",
    "comment": "This is my head attack pill",
    "updated_at": "2024-05-27T06:29:04.000000Z",
    "created_at": "2024-05-27T06:29:04.000000Z",
    "id": 2
  }
} 
*/

  String? message;
  int? status;
  AddMedicationModelData? data;

  AddMedicationModel({
    this.message,
    this.status,
    this.data,
  });
  AddMedicationModel.fromJson(Map<String, dynamic> json) {
    message = json['message']?.toString();
    status = json['status']?.toInt();
    data = (json['data'] != null) ? AddMedicationModelData.fromJson(json['data']) : null;
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
