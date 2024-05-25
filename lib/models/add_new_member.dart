///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class AddNewMemberModelData {
/*
{
  "health_insurance_document": "uploads/member/insurance_document/82449.jpg",
  "id_proof": "uploads/member/id_proof/78707.jpg",
  "profile": "uploads/member/profile/1835.jpg",
  "user_id": 13,
  "name": "Chandra Bhushan",
  "dob": "13/05/2024",
  "relation": "Son",
  "health_insurance_information": "Not Now",
  "updated_at": "2024-05-21T13:07:02.000000Z",
  "created_at": "2024-05-21T13:07:02.000000Z",
  "id": 8
} 
*/

  String? healthInsuranceDocument;
  String? idProof;
  String? profile;
  int? userId;
  String? name;
  String? dob;
  String? relation;
  String? healthInsuranceInformation;
  String? updatedAt;
  String? createdAt;
  int? id;

  AddNewMemberModelData({
    this.healthInsuranceDocument,
    this.idProof,
    this.profile,
    this.userId,
    this.name,
    this.dob,
    this.relation,
    this.healthInsuranceInformation,
    this.updatedAt,
    this.createdAt,
    this.id,
  });
  AddNewMemberModelData.fromJson(Map<String, dynamic> json) {
    healthInsuranceDocument = json['health_insurance_document']?.toString();
    idProof = json['id_proof']?.toString();
    profile = json['profile']?.toString();
    userId = json['user_id']?.toInt();
    name = json['name']?.toString();
    dob = json['dob']?.toString();
    relation = json['relation']?.toString();
    healthInsuranceInformation = json['health_insurance_information']?.toString();
    updatedAt = json['updated_at']?.toString();
    createdAt = json['created_at']?.toString();
    id = json['id']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['health_insurance_document'] = healthInsuranceDocument;
    data['id_proof'] = idProof;
    data['profile'] = profile;
    data['user_id'] = userId;
    data['name'] = name;
    data['dob'] = dob;
    data['relation'] = relation;
    data['health_insurance_information'] = healthInsuranceInformation;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}

class AddNewMemberModel {
/*
{
  "message": "Member add Successfully",
  "status": 200,
  "data": {
    "health_insurance_document": "uploads/member/insurance_document/82449.jpg",
    "id_proof": "uploads/member/id_proof/78707.jpg",
    "profile": "uploads/member/profile/1835.jpg",
    "user_id": 13,
    "name": "Chandra Bhushan",
    "dob": "13/05/2024",
    "relation": "Son",
    "health_insurance_information": "Not Now",
    "updated_at": "2024-05-21T13:07:02.000000Z",
    "created_at": "2024-05-21T13:07:02.000000Z",
    "id": 8
  }
} 
*/

  String? message;
  int? status;
  AddNewMemberModelData? data;

  AddNewMemberModel({
    this.message,
    this.status,
    this.data,
  });
  AddNewMemberModel.fromJson(Map<String, dynamic> json) {
    message = json['message']?.toString();
    status = json['status']?.toInt();
    data = (json['data'] != null) ? AddNewMemberModelData.fromJson(json['data']) : null;
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
