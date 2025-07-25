class AcademicProfileInfoModel {
  Data? data;
  String? msg;
  String? responseCode;
  String? additionalData;

  AcademicProfileInfoModel(
      {this.data, this.msg, this.responseCode, this.additionalData});

  AcademicProfileInfoModel.fromJson(Map<String, dynamic> json) {
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
  List<CoScholasticResults>? coScholasticResults;
  List<AttendanceSummaries>? attendanceSummaries;
  List<TestPercentages>? testPercentages;

  Data(
      {this.coScholasticResults,
      this.attendanceSummaries,
      this.testPercentages});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['coScholasticResults'] != null) {
      coScholasticResults = <CoScholasticResults>[];
      json['coScholasticResults'].forEach((v) {
        coScholasticResults!.add(CoScholasticResults.fromJson(v));
      });
    }
    if (json['attendanceSummaries'] != null) {
      attendanceSummaries = <AttendanceSummaries>[];
      json['attendanceSummaries'].forEach((v) {
        attendanceSummaries!.add(AttendanceSummaries.fromJson(v));
      });
    }
    if (json['testPercentages'] != null) {
      testPercentages = <TestPercentages>[];
      json['testPercentages'].forEach((v) {
        testPercentages!.add(TestPercentages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (coScholasticResults != null) {
      data['coScholasticResults'] =
          coScholasticResults!.map((v) => v.toJson()).toList();
    }
    if (attendanceSummaries != null) {
      data['attendanceSummaries'] =
          attendanceSummaries!.map((v) => v.toJson()).toList();
    }
    if (testPercentages != null) {
      data['testPercentages'] =
          testPercentages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CoScholasticResults {
  num? studentID;
  num? termID;
  num? batchId;
  String? batchName;
  String? title;
  String? obtainedGrade;

  CoScholasticResults(
      {this.studentID,
      this.termID,
      this.batchId,
      this.batchName,
      this.title,
      this.obtainedGrade});

  CoScholasticResults.fromJson(Map<String, dynamic> json) {
    studentID = json['studentID'];
    termID = json['termID'];
    batchId = json['batchId'];
    batchName = json['batch_Name'];
    title = json['title'];
    obtainedGrade = json['obtainedGrade'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['studentID'] = studentID;
    data['termID'] = termID;
    data['batchId'] = batchId;
    data['batch_Name'] = batchName;
    data['title'] = title;
    data['obtainedGrade'] = obtainedGrade;
    return data;
  }
}

class AttendanceSummaries {
  num? studentRegisterId;
  num? batchId;
  num? totalDays;
  num? presentDays;
  num? attendancePercent;
  String? batchName;

  AttendanceSummaries(
      {this.studentRegisterId,
      this.batchId,
      this.totalDays,
      this.presentDays,
      this.attendancePercent,
      this.batchName});

  AttendanceSummaries.fromJson(Map<String, dynamic> json) {
    studentRegisterId = json['studentRegisterId'];
    batchId = json['batchId'];
    totalDays = json['totalDays'];
    presentDays = json['presentDays'];
    attendancePercent = json['attendancePercent'];
    batchName = json['batch_Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['studentRegisterId'] = studentRegisterId;
    data['batchId'] = batchId;
    data['totalDays'] = totalDays;
    data['presentDays'] = presentDays;
    data['attendancePercent'] = attendancePercent;
    data['batch_Name'] = batchName;
    return data;
  }
}

class TestPercentages {
  num? studentId;
  num? termId;
  double? percentage;
  String? grade;
  num? batchId;
  String? batchName;

  TestPercentages(
      {this.studentId,
      this.termId,
      this.percentage,
      this.grade,
      this.batchId,
      this.batchName});

  TestPercentages.fromJson(Map<String, dynamic> json) {
    studentId = json['studentId'];
    termId = json['termId'];
    percentage = json['percentage'];
    grade = json['grade'];
    batchId = json['batchId'];
    batchName = json['batch_Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['studentId'] = studentId;
    data['termId'] = termId;
    data['percentage'] = percentage;
    data['grade'] = grade;
    data['batchId'] = batchId;
    data['batch_Name'] = batchName;
    return data;
  }
}
