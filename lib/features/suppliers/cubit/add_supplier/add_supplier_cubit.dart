import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'add_supplier_state.dart';
import '../../data/repo/suppliers_repo.dart';
import '../../data/models/supplier_model.dart';

class AddSupplierCubit extends Cubit<AddSupplierState> {
  final SuppliersRepo suppliersRepo;

  AddSupplierCubit(this.suppliersRepo) : super(AddSupplierInitial());
  static AddSupplierCubit get(context) => BlocProvider.of(context);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController commercialRegisterController = TextEditingController();
  final TextEditingController taxIdentificationNumberController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  XFile? image;
  Future<void> addSupplier() async {
    if(!formKey.currentState!.validate()) return;

    emit(AddSupplierLoading());
    final result = await suppliersRepo.addSupplier(SupplierModel(
      name: nameController.text,
      email: emailController.text,
      phone: phoneController.text,
      address: addressController.text,
      commercialRegister: commercialRegisterController.text,
      taxIdentificationNumber: taxIdentificationNumberController.text,
      note: noteController.text,
      imagePath: image?.path
    ));
    result.fold(
      (error) => emit(AddSupplierError(error)),
      (data) => emit(AddSupplierSuccess())
    );
  }
}
