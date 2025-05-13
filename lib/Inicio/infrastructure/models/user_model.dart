import 'package:front_medizin/Inicio/domain/entities/user.dart';

class UserModel extends User {
  UserModel({required String id, required String email, String? name})
    : super(id: id, email: email, name: name);

  // Método para crear UserModel desde JSON (opcional)
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(id: json['id'], email: json['email'], name: json['name']);
  }

  // Método para convertir a JSON (opcional)
  Map<String, dynamic> toJson() {
    return {'id': id, 'email': email, 'name': name};
  }
}
