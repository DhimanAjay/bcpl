class SendOtpModel {
  bool? status;
  String? message;
  String? model;

  SendOtpModel({this.status, this.message,this.model});

  SendOtpModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    model = json['model'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['model'] = this.model;
    return data;
  }
}
