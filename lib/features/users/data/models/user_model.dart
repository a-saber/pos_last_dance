import 'package:pos/features/permissions/data/models/permission_model.dart';

class UserModel
{
  int? id;
  String? name;
  String? email;
  String? password;
  String? phone;
  String? address;
  String? image;
  PermissionModel? permission;

  UserModel({this.id, this.permission, this.name, this.email, this.phone, this.address, this.image, this.password});

  static UserModel from(UserModel source) => UserModel(
    permission: source.permission == null ? null : PermissionModel.from(source.permission!),
      name: source.name, email: source.email,
    phone: source.phone, address: source.address, image: source.image,
    password: source.password,
    id: source.id
  );
}