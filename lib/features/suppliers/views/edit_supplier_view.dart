import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pos/core/helper/my_navigator.dart';
import 'package:pos/core/helper/my_service_locator.dart';
import 'package:pos/core/translation/translation_keys.dart';
import 'package:pos/core/widgets/custom_app_bar.dart';
import 'package:pos/core/widgets/custom_fields/custom_btn.dart';
import 'package:pos/core/widgets/custom_pop_up.dart';
import 'package:pos/features/suppliers/data/repo/suppliers_repo.dart';
import 'package:pos/features/suppliers/cubit/edit_supplier/edit_supplier_cubit.dart';
import 'package:pos/features/suppliers/cubit/get_suppliers/get_suppliers_cubit.dart';
import 'package:pos/features/suppliers/cubit/edit_supplier/edit_supplier_state.dart';
import 'package:pos/features/suppliers/data/models/supplier_model.dart';

import 'widgets/delete_supplier_confirm_dialog.dart';
import 'widgets/supplier_data_builder.dart';

class EditSupplierView extends StatelessWidget {
  const EditSupplierView({super.key, required this.supplier});
  final SupplierModel supplier;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditSupplierCubit(MyServiceLocator.getSingleton<SuppliersRepo>(), supplier),
      child: Scaffold(
        appBar: CustomAppBar(title: TranslationsKeys.editSupplier.tr,
        actions:
        [
            CustomTextBtn(
              text: TranslationsKeys.delete.tr,
              onPressed: () async {
                await showDeleteSupplierConfirmDialog(
                  context: context, supplier: supplier, goBack: true
                );
              })
        ],),
        body: BlocConsumer<EditSupplierCubit, EditSupplierState>(
          listener: (context, state)
          {
            if(state is EditSupplierSuccess)
            {
              GetSuppliersCubit.get(context).getSuppliers();
              CustomPopUp.callMyToast(context: context, massage: TranslationsKeys.updatedSuccess.tr, state: PopUpState.SUCCESS);
              MyNavigator.goBack();
            }
            else if(state is EditSupplierError)
            {
              CustomPopUp.callMyToast(context: context, massage: state.error, state: PopUpState.ERROR);
            }
          },
          builder: (context, state)
          {
            return SupplierDataBuilder(
              onSelectedImage: (image) => EditSupplierCubit.get(context).image = image,
              formKey: EditSupplierCubit.get(context).formKey,
              nameController: EditSupplierCubit.get(context).nameController,
              emailController: EditSupplierCubit.get(context).emailController,
              phoneController: EditSupplierCubit.get(context).phoneController,
              addressController: EditSupplierCubit.get(context).addressController,
              commercialRegisterController: EditSupplierCubit.get(context).commercialRegisterController,
              taxIdentificationNumberController: EditSupplierCubit.get(context).taxIdentificationNumberController,
              noteController: EditSupplierCubit.get(context).noteController,
              isLoading: state is EditSupplierLoading,
              onPressed: EditSupplierCubit.get(context).editSupplier,
              isEdit: true,
              imageUrl: supplier.imagePath,
            );
          },
        ),
      ),
    );
  }
}
