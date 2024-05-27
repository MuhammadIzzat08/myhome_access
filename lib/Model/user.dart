import 'package:myhome_access/Model/patrol_schedule.dart';

class UserModel {
  String? name;
  String? email;
  String? role;
  String? address;
  String? phoneNo;
  //PatrolSchedule? patrolSchedule; // tambahan

  UserModel({this.name, this.email, this.role, this.address, this.phoneNo});
  //UserModel.schedule({required this.email, required this.role, required this.patrolSchedule}); //sini

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      email: map['email'],
      role: map['role'],
      address: map['address'],
      phoneNo: map['phoneNo'],
    );
  }






  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'role': role,
      'address': address,
      'phoneNo': phoneNo,
    };
  }
//tambah sini
 /* factory UserModel.fromMap(Map<String, dynamic> data, String email) {
    return UserModel.schedule(
      email: email,
      role: data['role'] ?? '',
      patrolSchedule: PatrolSchedule.fromMap(data['patrolSchedule'] ?? {}),
    );
  }*/
}
