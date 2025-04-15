import 'package:pos/core/utils/app_constants.dart';

class PermissionModel
{
  int? id;
  String? name;
  String? description;
  late List<PermissionItemModel> items ;

  factory PermissionModel.from(PermissionModel source)
  {
    return PermissionModel(id: source.id, name: source.name, description: source.description)
      ..items = source.items.map((e) => e.copy()).toList();
  }

  PermissionModel.asAdmin()
  {
    id = 1;
    name = 'Admin';
    description = 'Admin permission';
    items = List.from(AppConstants.allPermissions(asAdmin: true));
  }
  PermissionModel({this.id, this.name, this.description})
  {
    items = List.from(AppConstants.allPermissions());
  }
}
class PermissionItemModel
{
  int? id;
  String? name;
  bool isSelected ;

  PermissionItemModel copy() => PermissionItemModel(id: id, name: name, isSelected: isSelected);

  PermissionItemModel({this.id,required this.name, this.isSelected = false});
}
