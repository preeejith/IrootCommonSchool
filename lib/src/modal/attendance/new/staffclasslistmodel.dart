class StaffClassListModel {
  List<Data>? data;
  String? msg;
  String? responseCode;
  String? additionalData;

  StaffClassListModel({this.data, this.msg, this.responseCode, this.additionalData});

  StaffClassListModel.fromJson(Map<String, dynamic> json) {
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
  int? dataListItemId;
  String? dataListItemName;
  bool? isClassTeacher;

  Data({this.dataListItemId, this.dataListItemName, this.isClassTeacher});

  Data.fromJson(Map<String, dynamic> json) {
    dataListItemId = json['dataListItemId'];
    dataListItemName = json['dataListItemName'];
    isClassTeacher = json['isClassTeacher'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dataListItemId'] = this.dataListItemId;
    data['dataListItemName'] = this.dataListItemName;
    data['isClassTeacher'] = this.isClassTeacher;
    return data;
  }
}
