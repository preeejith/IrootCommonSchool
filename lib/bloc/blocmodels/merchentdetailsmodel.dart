class MerchentDetailsModel {
  Data? data;
  String? msg;
  String? responseCode;
  String? additionalData;

  MerchentDetailsModel(
      {this.data, this.msg, this.responseCode, this.additionalData});

  MerchentDetailsModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    msg = json['msg'];
    responseCode = json['responseCode'];
    additionalData = json['additionalData'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['msg'] = this.msg;
    data['responseCode'] = this.responseCode;
    data['additionalData'] = this.additionalData;
    return data;
  }
}

class Data {
  String? marchentId;
  String? userId;
  String? encryptKey;
  String? decryptKey;
  String? password;
  String? returnUrl;

  Data(
      {this.marchentId,
      this.userId,
      this.encryptKey,
      this.decryptKey,
      this.password,
      this.returnUrl});

  Data.fromJson(Map<String, dynamic> json) {
    marchentId = json['marchentId'];
    userId = json['userId'];
    encryptKey = json['encryptKey'];
    decryptKey = json['decryptKey'];
    password = json['password'];
    returnUrl = json['returnUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['marchentId'] = this.marchentId;
    data['userId'] = this.userId;
    data['encryptKey'] = this.encryptKey;
    data['decryptKey'] = this.decryptKey;
    data['password'] = this.password;
    data['returnUrl'] = this.returnUrl;
    return data;
  }
}
