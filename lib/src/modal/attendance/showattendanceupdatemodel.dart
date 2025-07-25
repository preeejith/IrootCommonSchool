import 'dart:convert';

StudentAttenUpdateModalClass studentAttenUpdateModalClassFromJson(
        String str) =>
    StudentAttenUpdateModalClass.fromJson(json.decode(str));

class StudentAttenUpdateModalClass {
  List<StudentAttendanceReportDatum>? data;
  String? msg;
  String? responseCode;
  String? additionalData;

  StudentAttenUpdateModalClass({
    this.data,
    this.msg,
    this.responseCode,
    this.additionalData,
  });

  factory StudentAttenUpdateModalClass.fromJson(
          Map<String, dynamic> json) =>
      StudentAttenUpdateModalClass(
        data: json["data"] == null
            ? []
            : List<StudentAttendanceReportDatum>.from(json["data"]!
                .map((x) => StudentAttendanceReportDatum.fromJson(x))),
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

class StudentAttendanceReportDatum {
  int? studentId;
  String? studentName;
  List<AttendanceRecord>? attendance;
  String? attendancePer;
  String? totalDays;
  String? totalAttendedDays;

  StudentAttendanceReportDatum({
    this.studentId,
    this.studentName,
    this.attendance,
    this.attendancePer,
    this.totalDays,
    this.totalAttendedDays,
  });

  factory StudentAttendanceReportDatum.fromJson(Map<String, dynamic> json) =>
      StudentAttendanceReportDatum(
        studentId: json["studentId"],
        studentName: json["studentName"],
        attendance: json["attendance"] == null
            ? []
            : List<AttendanceRecord>.from(json["attendance"]!
                .map((x) => AttendanceRecord.fromJson(x))),
        attendancePer: json["attendancePer"],
        totalDays: json["totalDays"],
        totalAttendedDays: json["totalAttendedDays"],
      );

  Map<String, dynamic> toJson() => {
        "studentId": studentId,
        "studentName": studentName,
        "attendance": attendance == null
            ? []
            : List<dynamic>.from(attendance!.map((x) => x.toJson())),
        "attendancePer": attendancePer,
        "totalDays": totalDays,
        "totalAttendedDays": totalAttendedDays,
      };
}

class AttendanceRecord {
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

  AttendanceRecord({
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

  factory AttendanceRecord.fromJson(Map<String, dynamic> json) =>
      AttendanceRecord(
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