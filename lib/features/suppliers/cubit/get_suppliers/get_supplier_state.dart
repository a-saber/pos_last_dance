    import '../../data/models/supplier_model.dart';


abstract class GetSuppliersState {}

class GetSuppliersInitial extends GetSuppliersState {}

class GetSuppliersLoading extends GetSuppliersState {}

class GetSuppliersSuccess extends GetSuppliersState {
  final List<SupplierModel> suppliers;
  GetSuppliersSuccess(this.suppliers);
}

class GetSuppliersError extends GetSuppliersState {
  final String error;
  GetSuppliersError(this.error);
}
