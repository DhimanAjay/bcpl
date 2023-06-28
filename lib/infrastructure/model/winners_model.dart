class WinnerModel {
  bool? status;
  List<Message>? message;
  WinnerModel({this.status, this.message});
  WinnerModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['message'] != null) {
      message = <Message>[];
      json['message'].forEach((v) {
        message!.add(Message.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (message != null) {
      data['message'] = message!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  fromJson(json) {}
}

class Message {
  String? winnersName;

  Message({this.winnersName});

  Message.fromJson(Map<String, dynamic> json) {
    winnersName = json['winners_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['winners_name'] = winnersName;
    return data;
  }
}
