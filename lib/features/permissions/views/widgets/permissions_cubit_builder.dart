import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos/core/widgets/custom_empty_data.dart';
import 'package:pos/core/widgets/custom_error.dart';
import 'package:pos/core/widgets/custom_loading.dart';
import 'package:pos/features/permissions/cubit/get_permissions/get_permissions_cubit.dart';
import 'package:pos/features/permissions/cubit/get_permissions/get_permissions_state.dart';
import 'package:pos/features/permissions/data/models/permission_model.dart';

class PermissionsCubitBuilder extends StatelessWidget {
  const PermissionsCubitBuilder({super.key, required this.permissionsBuilder});

  final Widget Function(BuildContext context, List<PermissionModel> permissions) permissionsBuilder;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetPermissionsCubit, GetPermissionsState>(
        builder: (context, state) {
          if (state is GetPermissionsLoading) {
            return const CustomLoading();
          }
          else if (state is GetPermissionsError) {
            return CustomError(error: state.error,
              onPressed: GetPermissionsCubit.get(context).getPermissions,
            );
          }
          else if (state is GetPermissionsSuccess) {
            if (state.permissions.isEmpty) {
              return CustomEmptyData(
                onPressed: GetPermissionsCubit.get(context).getPermissions,
              );
            }
            else
            {
              return permissionsBuilder(context, state.permissions);
            }
          }
          else {
            return const SizedBox();
          }
        }
    );
  }
}
