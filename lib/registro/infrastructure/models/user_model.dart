
import 'package:front_medizin/registro/domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    required String id,
    required String fullName,
    required String email,
    String? phoneNumber,
  }) : super(
         id: id,
         fullName: fullName,
         email: email,
         phoneNumber: phoneNumber,
       );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      fullName: json['fullName'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      'phoneNumber': phoneNumber,
    };
  }
}
