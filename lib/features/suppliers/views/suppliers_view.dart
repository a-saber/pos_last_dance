import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/core/helper/my_navigator.dart';
import 'package:pos/core/translation/translation_keys.dart';
import 'package:pos/core/utils/app_paddings.dart';
import 'package:pos/core/widgets/custom_app_bar.dart';
import 'package:pos/core/widgets/custom_floating_action_btn.dart';
import 'package:pos/core/widgets/custom_refresh_indicator.dart';
import 'package:pos/features/suppliers/cubit/get_suppliers/get_suppliers_cubit.dart';
import 'package:pos/features/suppliers/views/add_supplier_view.dart';

import 'widgets/supplier_item_builder.dart';
import 'widgets/suppliers_cubit_builder.dart';

class SuppliersView extends StatelessWidget {
  const SuppliersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomFloatingActionBtn(
          onPressed: ()
          {
            MyNavigator.goTo(destinationBuilder: () => AddSupplierView());
          }
      ),
      appBar: CustomAppBar(title: TranslationsKeys.suppliers.tr),
      body: CustomRefreshIndicator(
        onRefresh: GetSuppliersCubit.get(context).getSuppliers,
        child: Padding(
          padding: AppPaddings.defaultView,
          child: SuppliersCubitBuilder(
              supplierBuilder: (context, suppliers)
              {
                return ListView.builder(
                  itemCount: suppliers.length,
                  itemBuilder: (context, index) {
                    return SupplierItemBuilder(supplier: suppliers[index]);
                  },
                );
              }),
        ),
      ),
    );
  }
}
