// ignore_for_file: file_names

class LoginModel {
  bool? status;
  UserInfo? userInfo;
  String? token;

  LoginModel({this.status, this.userInfo, this.token});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    userInfo =
        json['user_info'] != null ? UserInfo.fromJson(json['user_info']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (userInfo != null) {
      data['user_info'] = userInfo!.toJson();
    }
    data['token'] = token;
    return data;
  }
}

class UserInfo {
  String? id;
  String? picture;
  String? name;

  UserInfo({this.id, this.picture, this.name});

  UserInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    picture = json['picture'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['picture'] = picture;
    data['name'] = name;
    return data;
  }
}
