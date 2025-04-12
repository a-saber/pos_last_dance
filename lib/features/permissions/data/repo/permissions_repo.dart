import 'package:dartz/dartz.dart';
import 'package:pos/core/cache/cache_data.dart';
import 'package:pos/core/cache/cache_keys.dart';
import 'package:pos/features/permissions/data/models/permission_model.dart';

class PermissionsRepo
{
  List<PermissionModel> permissions =
  [
    PermissionModel.asAdmin(),
    PermissionModel(id: 2, nameAr: 'كاشير' , nameEn: 'Cashier', description: 'Cashier permission')..items.first.isSelected = true,
  ];

  Future<Either<String, List<PermissionModel>>> getPermissions() async
  {
    try
    {
      return Right(permissions);
    }
    catch(e)
    {
      return Left(e.toString());
    }
  }

  bool validatePermission({required PermissionModel newPermission, required bool isEdit})
  {
    if(isEdit)
    {
      PermissionModel oldPermission = permissions[permissions.indexWhere((element) => element.id == newPermission.id)];

      // check if permission is same before edit
      if(!((!PermissionModel.isEqual( oldPermission, newPermission)) || oldPermission.nameEn != newPermission.nameEn|| oldPermission.nameAr != newPermission.nameAr || oldPermission.description != newPermission.description))
      {
        throw 'Nothing changed';
      }
    }

    // check if permission with the same name exists
    if(permissions.any((element) => (element.nameEn == newPermission.nameEn || element.nameAr == newPermission.nameAr) && element.id != newPermission.id))
    {
      throw 'Permission with the same name already exists';
    }

    // check if permission with the same items exists
    for(int i = 0; i < permissions.length; i++)
    {
      if(PermissionModel.isEqual(permissions[i], newPermission))
      {
        throw 'Permission ${CacheData.lang == CacheKeys.keyEN ? permissions[i].nameEn : permissions[i].nameAr} has the same permissions';
      }
    }

    // check if permission has at least one enabled item
    if(!newPermission.items.any((element) => element.isSelected))
    {
      throw 'Permission must have at least one enabled item';
    }

    return true;
  }

  Future<Either<String, void>> addPermission({required PermissionModel permission}) async
  {
    try
    {
      // validate permission
      validatePermission(newPermission: permission, isEdit: false);

      // add permission
      permissions.add(permission);
      return Right(null);
    }
    catch(e)
    {
      return Left(e.toString());
    }
  }

  Future<Either<String, void>> editPermission({required PermissionModel newPermission}) async
  {
    try
    {
      // validate permission
      validatePermission(newPermission: newPermission, isEdit: true);

      // reassign permission
      permissions[permissions.indexWhere((element) => element.id == newPermission.id)] = newPermission;
      return Right(null);
    }
    catch(e)
    {
      return Left(e.toString());
    }
  }

  Future<Either<String, void>> deletePermission({required PermissionModel permission}) async
  {
    try
    {
      permissions.removeWhere((element) => element.id == permission.id);
      return Right(null);
    }
    catch(e)
    {
      return Left(e.toString());
    }
  }

}