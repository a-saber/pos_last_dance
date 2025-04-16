import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pos/core/helper/my_navigator.dart';
import 'package:pos/core/helper/my_service_locator.dart';
import 'package:pos/core/translation/translation_keys.dart';
import 'package:pos/core/widgets/show_delete_confirm_dialog.dart';
import 'package:pos/features/suppliers/data/repo/suppliers_repo.dart';

import '../../cubit/get_suppliers/get_suppliers_cubit.dart';
import '../../cubit/delete_supplier/delete_supplier_cubit.dart';
import '../../cubit/delete_supplier/delete_supplier_state.dart';
import '../../data/models/supplier_model.dart';

Future<bool?> showDeleteSupplierConfirmDialog({
  required BuildContext context,
  required SupplierModel supplier,
  bool goBack = false
}) async {
 return await showDeleteConfirmationDialog(
      context: context,
      title: TranslationsKeys.deleteSupplier.tr,
      content: supplier.name ?? '',
      deleteButtonBuilder: (ctx, button, loading) =>  BlocProvider(
        create: (context) => DeleteSupplierCubit(MyServiceLocator.getSingleton<SuppliersRepo>()),
        child: BlocConsumer<DeleteSupplierCubit, DeleteSupplierState>(
          listener: (context, state)
          {
            if (state is DeleteSupplierSuccess)
            {
              deleteConfirmationDialogSuccess(ctx);
              GetSuppliersCubit.get(context).getSuppliers();
              if(goBack)
              {
                MyNavigator.goBack();
              }
            }
            else if (state is DeleteSupplierError)
            {
              deleteConfirmationDialogError( ctx, state.error);
            }
          },
          builder: (context, state) {
            if (state is DeleteSupplierLoading)
            {
              return loading;
            }
            return button(onPressed: () => DeleteSupplierCubit.get(context).deleteSupplier(supplier));
          },
        ),
      )
  );
}
