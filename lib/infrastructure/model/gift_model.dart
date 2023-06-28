class GiftModel {
  bool? status;
  List<Message>? message;

  GiftModel({this.status, this.message});

  GiftModel.fromJson(Map<String, dynamic> json) {
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
}

class Message {
  String? giftName;
  String? giftImage;
  String? giftCategory;

  Message({this.giftName, this.giftImage, this.giftCategory});

  Message.fromJson(Map<String, dynamic> json) {
    giftName = json['gift_name'];
    giftImage = json['gift_image'];
    giftCategory = json['gift_category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['gift_name'] = giftName;
    data['gift_image'] = giftImage;
    data['gift_category'] = giftCategory;
    return data;
  }
}
