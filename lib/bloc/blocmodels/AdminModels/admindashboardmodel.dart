class AdminDashboardModel {
  Data? data;
  String? msg;
  String? responseCode;
  String? additionalData;

  AdminDashboardModel(
      {this.data, this.msg, this.responseCode, this.additionalData});

  AdminDashboardModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    msg = json['msg'];
    responseCode = json['responseCode'];
    additionalData = json['additionalData'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['msg'] = msg;
    data['responseCode'] = responseCode;
    data['additionalData'] = additionalData;
    return data;
  }
}

class Data {
  num? totalStudents;
  num? newAdmission;
  num? absentStudent;
  num? totalStaff;
  num? newJoinTeacher;
  num? absentTeacher;
  num? totalFeeCollect;
  num? todayFeeCollection;
  num? tc;

  Data(
      {this.totalStudents,
      this.newAdmission,
      this.absentStudent,
      this.totalStaff,
      this.newJoinTeacher,
      this.absentTeacher,
      this.totalFeeCollect,
      this.todayFeeCollection,
      this.tc});

  Data.fromJson(Map<String, dynamic> json) {
    totalStudents = json['totalStudents'];
    newAdmission = json['newAdmission'];
    absentStudent = json['absentStudent'];
    totalStaff = json['totalStaff'];
    newJoinTeacher = json['newJoinTeacher'];
    absentTeacher = json['absentTeacher'];
    totalFeeCollect = json['totalFeeCollect'];
    todayFeeCollection = json['todayFeeCollection'];
    tc = json['tc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['totalStudents'] = totalStudents;
    data['newAdmission'] = newAdmission;
    data['absentStudent'] = absentStudent;
    data['totalStaff'] = totalStaff;
    data['newJoinTeacher'] = newJoinTeacher;
    data['absentTeacher'] = absentTeacher;
    data['totalFeeCollect'] = totalFeeCollect;
    data['todayFeeCollection'] = todayFeeCollection;
    data['tc'] = tc;
    return data;
  }
}
