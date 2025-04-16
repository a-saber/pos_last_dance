import '../models/supplier_model.dart';
import 'package:dartz/dartz.dart';

class SuppliersRepo {
  List<SupplierModel> _suppliers =
  [
    SupplierModel(
      id: 1,
      name: 'Supplier 1',
      phone: '0100000000',
    )
  ];

  Future<Either<String, List<SupplierModel>>> getSuppliers() async {
    try {
      return Right(_suppliers);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, void>> addSupplier(SupplierModel supplier) async {
    try {
      supplier.id = _suppliers.length + 1;
      _suppliers.add(supplier);
      return Right(null);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, void>> editSupplier(SupplierModel supplier) async {
    try {
      _suppliers[_suppliers.indexWhere((element) => element.id == supplier.id)] = supplier;
      return Right(null);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, void>> deleteSupplier(SupplierModel supplier) async {
    try {
      _suppliers.removeWhere((element) => element.id == supplier.id);
      return Right(null);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
