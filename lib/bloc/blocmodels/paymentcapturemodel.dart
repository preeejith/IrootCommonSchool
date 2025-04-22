class CaptureModel {
  String? message;

  CaptureModel({this.message});

  CaptureModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['messagee'] = this.message;
    return data;
  }
}
