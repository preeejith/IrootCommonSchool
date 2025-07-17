class DashboardProfileModel {
  List<Data>? data;
  String? msg;
  String? responseCode;
  String? additionalData;

  DashboardProfileModel(
      {this.data, this.msg, this.responseCode, this.additionalData});

  DashboardProfileModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    msg = json['msg'];
    responseCode = json['responseCode'];
    additionalData = json['additionalData'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['msg'] = msg;
    data['responseCode'] = responseCode;
    data['additionalData'] = additionalData;
    return data;
  }
}

class Data {
  String? name;
  num? studentId;
  String? lastName;
  String? classs;
  String? section;
  String? rollNo;
  String? fatherName;
  String? motherName;
  Null contactNo;
  String? fatherEmail;
  String? email;
  String? attendance;

  Data(
      {this.name,
      this.lastName,
      this.classs,
      this.section,
      this.rollNo,
      this.fatherName,
      this.motherName,
      this.contactNo,
      this.fatherEmail,
      this.email,
      this.attendance});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    studentId = json['studentId'];
    lastName = json['lastName'];
    classs = json['class'];
    section = json['section'];
    rollNo = json['rollNo'] ?? "";
    fatherName = json['fatherName'];
    motherName = json['motherName'];
    contactNo = json['contactNo'];
    fatherEmail = json['fatherEmail'];
    email = json['email'];
    attendance = json['attendance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['lastName'] = lastName;
    data['class'] = classs;
    data['section'] = section;
    data['rollNo'] = rollNo;
    data['fatherName'] = fatherName;
    data['motherName'] = motherName;
    data['contactNo'] = contactNo;
    data['fatherEmail'] = fatherEmail;
    data['email'] = email;
    data['attendance'] = attendance;
    return data;
  }
}
