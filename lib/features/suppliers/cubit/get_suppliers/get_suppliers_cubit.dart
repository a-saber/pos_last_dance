import 'package:flutter_bloc/flutter_bloc.dart';
import 'get_supplier_state.dart';
import '../../data/repo/suppliers_repo.dart';
import '../../data/models/supplier_model.dart';

class GetSuppliersCubit extends Cubit<GetSuppliersState> {
  final SuppliersRepo suppliersRepo;

  GetSuppliersCubit(this.suppliersRepo) : super(GetSuppliersInitial());
  static GetSuppliersCubit get(context) => BlocProvider.of(context);

  Future<void> getSuppliers() async {
    emit(GetSuppliersLoading());
    final result = await suppliersRepo.getSuppliers();
    result.fold(
      (error) => emit(GetSuppliersError(error)),
      (suppliers) => emit(GetSuppliersSuccess(suppliers))
    );
  }
}
