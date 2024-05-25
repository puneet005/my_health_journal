///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class AddAppointmentModelData {
/*
{
  "user_id": 2,
  "member_id": "1",
  "provider_id": "3",
  "visit_date": "30/05/2024",
  "question_for_provider": "asa",
  "provider_comment": "as",
  "note": "as x sdxsd fsdfsdfdsf",
  "updated_at": "2024-05-25T06:49:50.000000Z",
  "created_at": "2024-05-25T06:49:50.000000Z",
  "id": 4
} 
*/

  int? userId;
  String? memberId;
  String? providerId;
  String? visitDate;
  String? questionForProvider;
  String? providerComment;
  String? note;
  String? updatedAt;
  String? createdAt;
  int? id;

  AddAppointmentModelData({
    this.userId,
    this.memberId,
    this.providerId,
    this.visitDate,
    this.questionForProvider,
    this.providerComment,
    this.note,
    this.updatedAt,
    this.createdAt,
    this.id,
  });
  AddAppointmentModelData.fromJson(Map<String, dynamic> json) {
    userId = json['user_id']?.toInt();
    memberId = json['member_id']?.toString();
    providerId = json['provider_id']?.toString();
    visitDate = json['visit_date']?.toString();
    questionForProvider = json['question_for_provider']?.toString();
    providerComment = json['provider_comment']?.toString();
    note = json['note']?.toString();
    updatedAt = json['updated_at']?.toString();
    createdAt = json['created_at']?.toString();
    id = json['id']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['user_id'] = userId;
    data['member_id'] = memberId;
    data['provider_id'] = providerId;
    data['visit_date'] = visitDate;
    data['question_for_provider'] = questionForProvider;
    data['provider_comment'] = providerComment;
    data['note'] = note;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}

class AddAppointmentModel {
  String? message;
  int? status;
  AddAppointmentModelData? data;

  AddAppointmentModel({
    this.message,
    this.status,
    this.data,
  });
  AddAppointmentModel.fromJson(Map<String, dynamic> json) {
    message = json['message']?.toString();
    status = json['status']?.toInt();
    data = (json['data'] != null) ? AddAppointmentModelData.fromJson(json['data']) : null;
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