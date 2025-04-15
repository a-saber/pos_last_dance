import 'package:dartz/dartz.dart';
import 'package:pos/core/cache/cache_data.dart';
import 'package:pos/core/cache/cache_keys.dart';
import 'package:pos/features/permissions/data/models/permission_model.dart';

class PermissionsRepo
{
  List<PermissionModel> permissions =
  [
    PermissionModel.asAdmin(),
    PermissionModel(id: 2, name: 'Cashier', description: 'Cashier permission')..items.first.isSelected = true,
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



  Future<Either<String, void>> addPermission({required PermissionModel permission}) async
  {
    try
    {
      permission.id = permissions.length + 1;
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