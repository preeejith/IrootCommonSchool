class CurrentVersionModel {
  String? message;
  String? responseCode;
  Data? data;

  CurrentVersionModel({this.message, this.responseCode, this.data});

  CurrentVersionModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    responseCode = json['responseCode'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['responseCode'] = responseCode;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<MobileApp>? mobileApp;

  Data({this.mobileApp});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['mobileApp'] != null) {
      mobileApp = <MobileApp>[];
      json['mobileApp'].forEach((v) {
        mobileApp!.add(MobileApp.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (mobileApp != null) {
      data['mobileApp'] = mobileApp!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MobileApp {
  int? id;
  String? versionName;
  String? date;

  MobileApp({this.id, this.versionName, this.date});

  MobileApp.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    versionName = json['versionName'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['versionName'] = versionName;
    data['date'] = date;
    return data;
  }
}
