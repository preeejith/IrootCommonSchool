class StaffSectionListModel {
  List<Data>? data;
  String? msg;
  String? responseCode;
  String? additionalData;

  StaffSectionListModel(
      {this.data, this.msg, this.responseCode, this.additionalData});

  StaffSectionListModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    msg = json['msg'];
    responseCode = json['responseCode'];
    additionalData = json['additionalData'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['msg'] = this.msg;
    data['responseCode'] = this.responseCode;
    data['additionalData'] = this.additionalData;
    return data;
  }
}

class Data {
  int? sectionId;
  String? sectionName;

  Data({this.sectionId, this.sectionName});

  Data.fromJson(Map<String, dynamic> json) {
    sectionId = json['sectionId'];
    sectionName = json['sectionName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sectionId'] = this.sectionId;
    data['sectionName'] = this.sectionName;
    return data;
  }
}
