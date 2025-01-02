// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_label
class CreateUserModel {
  String? name;
  String? phone;
  String? email;
  String? uId;
  CreateUserModel({
    this.name,
    this.phone,
    this.email,
    this.uId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'phone': phone,
      'email': email,
      'uId': uId,
    };
  }

  CreateUserModel.fromMap(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    uId = json['uId'];
  }
}
