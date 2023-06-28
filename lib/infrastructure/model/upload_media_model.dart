class UploadMediaModel {
  String? type;
  String? key;

  UploadMediaModel({this.type, this.key});

  UploadMediaModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    key = json['key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = this.type;
    data['key'] = this.key;
    return data;
  }
}
