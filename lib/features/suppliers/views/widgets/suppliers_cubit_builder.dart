import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/custom_empty_data.dart';
import '../../../../core/widgets/custom_error.dart';
import '../../../../core/widgets/custom_loading.dart';
import '../../cubit/get_suppliers/get_suppliers_cubit.dart';
import '../../cubit/get_suppliers/get_supplier_state.dart';
import '../../data/models/supplier_model.dart';

class SuppliersCubitBuilder extends StatelessWidget {
  const SuppliersCubitBuilder({super.key, required this.supplierBuilder});

  final Widget Function(BuildContext context, List<SupplierModel> suppliers) supplierBuilder;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetSuppliersCubit, GetSuppliersState>(
      builder: (context, state) {
        if (state is GetSuppliersLoading) {
          return const CustomLoading();
        } else if (state is GetSuppliersError) {
          return CustomError(
            error: state.error,
            onPressed: GetSuppliersCubit.get(context).getSuppliers,
          );
        } else if (state is GetSuppliersSuccess) {
          if (state.suppliers.isEmpty) {
            return CustomEmptyData(
              onPressed: GetSuppliersCubit.get(context).getSuppliers,
            );
          } else {
            return supplierBuilder(context, state.suppliers);
          }
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
