import 'package:pos/core/utils/app_constants.dart';

class PermissionModel
{
  int? id;
  String? nameAr;
  String? nameEn;
  String? description;
  late List<PermissionItemModel> items ;

  PermissionModel.asAdmin()
  {
    id = 1;
    nameAr = 'المسؤول';
    nameEn = 'Admin';
    description = 'Admin permission';
    items = List.from(AppConstants.allPermissions(asAdmin: true));
  }
  PermissionModel({this.id, this.nameAr, this.nameEn, this.description})
  {
    items = List.from(AppConstants.allPermissions());
  }

  static bool isEqual(PermissionModel model1, PermissionModel model2)
  {
    for (int i = 0; i < model1.items.length; i++)
    {
      if(model1.items[i].isSelected != model2.items[i].isSelected)
      {
        return false;
      }
    }
    return true;
  }
}
class PermissionItemModel
{
  int? id;
  String? nameAr;
  String? nameEn;
  bool isSelected ;

  PermissionItemModel({this.id,required this.nameAr,required this.nameEn, this.isSelected = false});
}
