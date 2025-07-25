class AdminClassListModel {
  List<Data>? data;
  String? msg;
  String? responseCode;
  String? additionalData;

  AdminClassListModel(
      {this.data, this.msg, this.responseCode, this.additionalData});

  AdminClassListModel.fromJson(Map<String, dynamic> json) {
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
  int? dataListItemId;
  String? dataListItemName;
  String? dataListId;
  String? dataListName;
  String? status;

  Data(
      {this.dataListItemId,
      this.dataListItemName,
      this.dataListId,
      this.dataListName,
      this.status});

  Data.fromJson(Map<String, dynamic> json) {
    dataListItemId = json['dataListItemId'];
    dataListItemName = json['dataListItemName'];
    dataListId = json['dataListId'];
    dataListName = json['dataListName'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dataListItemId'] = dataListItemId;
    data['dataListItemName'] = dataListItemName;
    data['dataListId'] = dataListId;
    data['dataListName'] = dataListName;
    data['status'] = status;
    return data;
  }
}
