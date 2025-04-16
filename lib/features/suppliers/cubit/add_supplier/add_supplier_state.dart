

abstract class AddSupplierState {}

class AddSupplierInitial extends AddSupplierState {}

class AddSupplierLoading extends AddSupplierState {}

class AddSupplierSuccess extends AddSupplierState {}

class AddSupplierError extends AddSupplierState {
  final String error;
  AddSupplierError(this.error);
}
