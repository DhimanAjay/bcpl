class GiftDetailsModel {
  String? giftDetail;
  String? giftImage;

  GiftDetailsModel({this.giftDetail, this.giftImage});

  GiftDetailsModel.fromJson(Map<String, dynamic> json) {
    giftDetail = json['gift_detail'] ?? "";
    giftImage = json['gift_image'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['gift_detail'] = this.giftDetail;
    data['gift_image'] = this.giftImage;
    return data;
  }
}
