
abstract class DeleteSupplierState {}

class DeleteSupplierInitial extends DeleteSupplierState {}

class DeleteSupplierLoading extends DeleteSupplierState {}

class DeleteSupplierSuccess extends DeleteSupplierState {}

class DeleteSupplierError extends DeleteSupplierState {
  final String error;
  DeleteSupplierError(this.error);
}
