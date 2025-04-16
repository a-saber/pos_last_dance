
abstract class EditSupplierState {}

class EditSupplierInitial extends EditSupplierState {}

class EditSupplierLoading extends EditSupplierState {}

class EditSupplierSuccess extends EditSupplierState {}

class EditSupplierError extends EditSupplierState {
  final String error;
  EditSupplierError(this.error);
}
