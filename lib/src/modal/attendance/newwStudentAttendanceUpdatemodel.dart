import 'dart:convert';

UpdatettStudentAttendanceModalClass updatettStudentAttendanceModalClassFromJson(String str) =>
    UpdatettStudentAttendanceModalClass.fromJson(json.decode(str));

class UpdatettStudentAttendanceModalClass {
  List<StudentAttendanceDatum>? data;
  String? msg;
  String? responseCode;
  String? additionalData;

  UpdatettStudentAttendanceModalClass({
    this.data,
    this.msg,
    this.responseCode,
    this.additionalData,
  });

  factory UpdatettStudentAttendanceModalClass.fromJson(Map<String, dynamic> json) =>
      UpdatettStudentAttendanceModalClass(
        data: json["data"] == null
            ? []
            : List<StudentAttendanceDatum>.from(
                json["data"]!.map((x) => StudentAttendanceDatum.fromJson(x))),
        msg: json["msg"],
        responseCode: json["responseCode"],
        additionalData: json["additionalData"],
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "msg": msg,
        "responseCode": responseCode,
        "additionalData": additionalData,
      };
}

class StudentAttendanceDatum {
  int? studentId;
  String? studentName;
  List<Attendance>? attendance;

  StudentAttendanceDatum({
    this.studentId,
    this.studentName,
    this.attendance,
  });

  factory StudentAttendanceDatum.fromJson(Map<String, dynamic> json) =>
      StudentAttendanceDatum(
        studentId: json["studentId"],
        studentName: json["studentName"],
        attendance: json["attendance"] == null
            ? []
            : List<Attendance>.from(
                json["attendance"]!.map((x) => Attendance.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "studentId": studentId,
        "studentName": studentName,
        "attendance": attendance == null
            ? []
            : List<dynamic>.from(attendance!.map((x) => x.toJson())),
      };
}

class Attendance {
  int? attendanceId;
  int? classId;
  int? sectionId;
  String? className;
  String? sectionName;
  String? markFullDayAbsent;
  String? markHalfDayAbsent;
  int? studentRegisterId;
  String? studentName;
  String? createdDate;
  String? day;
  String? createdBy;
  String? others;
  int? batchId;

  Attendance({
    this.attendanceId,
    this.classId,
    this.sectionId,
    this.className,
    this.sectionName,
    this.markFullDayAbsent,
    this.markHalfDayAbsent,
    this.studentRegisterId,
    this.studentName,
    this.createdDate,
    this.day,
    this.createdBy,
    this.others,
    this.batchId,
  });

  factory Attendance.fromJson(Map<String, dynamic> json) => Attendance(
        attendanceId: json["attendanceId"],
        classId: json["classId"],
        sectionId: json["sectionId"],
        className: json["className"],
        sectionName: json["sectionName"],
        markFullDayAbsent: json["markFullDayAbsent"],
        markHalfDayAbsent: json["markHalfDayAbsent"],
        studentRegisterId: json["studentRegisterId"],
        studentName: json["studentName"],
        createdDate: json["createdDate"],
        day: json["day"],
        createdBy: json["createdBy"],
        others: json["others"],
        batchId: json["batchId"],
      );

  Map<String, dynamic> toJson() => {
        "attendanceId": attendanceId,
        "classId": classId,
        "sectionId": sectionId,
        "className": className,
        "sectionName": sectionName,
        "markFullDayAbsent": markFullDayAbsent,
        "markHalfDayAbsent": markHalfDayAbsent,
        "studentRegisterId": studentRegisterId,
        "studentName": studentName,
        "createdDate": createdDate,
        "day": day,
        "createdBy": createdBy,
        "others": others,
        "batchId": batchId,
      };
}