import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pos/core/helper/my_navigator.dart';
import 'package:pos/core/helper/my_service_locator.dart';
import 'package:pos/core/translation/translation_keys.dart';
import 'package:pos/core/widgets/custom_app_bar.dart';
import 'package:pos/core/widgets/custom_pop_up.dart';
import 'package:pos/features/suppliers/cubit/add_supplier/add_supplier_state.dart';
import 'package:pos/features/suppliers/cubit/get_suppliers/get_suppliers_cubit.dart';
import 'package:pos/features/suppliers/data/repo/suppliers_repo.dart';
import 'package:pos/features/suppliers/cubit/add_supplier/add_supplier_cubit.dart';

import 'widgets/supplier_data_builder.dart';


class AddSupplierView extends StatelessWidget {
  const AddSupplierView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => AddSupplierCubit(MyServiceLocator.getSingleton<SuppliersRepo>()),
  child: Scaffold(
      appBar: CustomAppBar(title: TranslationsKeys.addSupplier.tr),
      body: BlocConsumer<AddSupplierCubit, AddSupplierState>(
        listener: (context, state)
        {
          if(state is AddSupplierSuccess)
          {
            GetSuppliersCubit.get(context).getSuppliers();
            CustomPopUp.callMyToast(context: context, massage: TranslationsKeys.addedSuccess.tr, state: PopUpState.SUCCESS);
            MyNavigator.goBack();
          }
          else if(state is AddSupplierError)
          {
            CustomPopUp.callMyToast(context: context, massage: state.error, state: PopUpState.ERROR);
          }
        },
        builder: (context, state)
        {
          return SupplierDataBuilder(
            onSelectedImage: (image) => AddSupplierCubit.get(context).image = image,
            formKey: AddSupplierCubit.get(context).formKey,
            nameController: AddSupplierCubit.get(context).nameController,
            emailController: AddSupplierCubit.get(context).emailController,
            phoneController: AddSupplierCubit.get(context).phoneController,
            addressController: AddSupplierCubit.get(context).addressController,
            commercialRegisterController: AddSupplierCubit.get(context).commercialRegisterController,
            taxIdentificationNumberController: AddSupplierCubit.get(context).taxIdentificationNumberController,
            noteController: AddSupplierCubit.get(context).noteController,
            isLoading: state is AddSupplierLoading,
            onPressed: AddSupplierCubit.get(context).addSupplier,
            isEdit: false,
            imageUrl: null,
          );
        },
      ),
    ),
);
  }
}
