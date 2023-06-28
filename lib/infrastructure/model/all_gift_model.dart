class AllGift {
  bool? status;
  List<MessageData>? message;

  AllGift({this.status, this.message});

  AllGift.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['message'] != null) {
      message = <MessageData>[];
      json['message'].forEach((v) {
        message!.add(MessageData.fromJson(v));
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

class MessageData {
  String? giftName;
  String? giftImage;
  String? giftCategory;

  MessageData({this.giftName, this.giftImage, this.giftCategory});

  MessageData.fromJson(Map<String, dynamic> json) {
    giftName = json['gift_name'];
    giftImage = json['gift_image'];
    giftCategory = json['gift_category']??"";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['gift_name'] = this.giftName;
    data['gift_image'] = this.giftImage;
    data['gift_category'] = this.giftCategory;
    return data;
  }
}
