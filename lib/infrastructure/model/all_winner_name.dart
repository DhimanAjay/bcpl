class AllWinerName {
  bool? status;
  List<MessageWinnerName>? message;

  AllWinerName({this.status, this.message});

  AllWinerName.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['message'] != null) {
      message = <MessageWinnerName>[];
      json['message'].forEach((v) {
        message!.add(new MessageWinnerName.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.message != null) {
      data['message'] = this.message!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MessageWinnerName {
  String? winnersName;

  MessageWinnerName({this.winnersName});

  MessageWinnerName.fromJson(Map<String, dynamic> json) {
    winnersName = json['winners_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['winners_name'] = this.winnersName;
    return data;
  }
}
