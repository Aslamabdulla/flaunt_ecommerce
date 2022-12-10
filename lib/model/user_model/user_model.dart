// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  String name;
  String id;
  String email;
  String lastLogin;
  String role;
  UserModel({
    required this.name,
    required this.id,
    required this.email,
    required this.lastLogin,
    required this.role,
  });

  UserModel copyWith({
    String? name,
    String? id,
    String? email,
    String? lastLogin,
    String? role,
  }) {
    return UserModel(
      name: name ?? this.name,
      id: id ?? this.id,
      email: email ?? this.email,
      lastLogin: lastLogin ?? this.lastLogin,
      role: role ?? this.role,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'id': id,
      'email': email,
      'lastLogin': lastLogin,
      'role': role,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      id: map['id'] as String,
      email: map['email'] as String,
      lastLogin: map['lastLogin'] as String,
      role: map['role'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(name: $name, id: $id, email: $email, lastLogin: $lastLogin, role: $role)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.id == id &&
        other.email == email &&
        other.lastLogin == lastLogin &&
        other.role == role;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        id.hashCode ^
        email.hashCode ^
        lastLogin.hashCode ^
        role.hashCode;
  }
}
