import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'edit_supplier_state.dart';
import '../../data/repo/suppliers_repo.dart';
import '../../data/models/supplier_model.dart';

class EditSupplierCubit extends Cubit<EditSupplierState> {
  final SuppliersRepo suppliersRepo;
  final  SupplierModel supplier;
  EditSupplierCubit(this.suppliersRepo, this.supplier) : super(EditSupplierInitial())
  {
    nameController.text = supplier.name ?? "";
    emailController.text = supplier.email ?? "";
    phoneController.text = supplier.phone ?? "";
    addressController.text = supplier.address ?? "";
    commercialRegisterController.text = supplier.commercialRegister ?? "";
    taxIdentificationNumberController.text = supplier.taxIdentificationNumber ?? "";
    noteController.text = supplier.note ?? "";
  }
  static EditSupplierCubit get(context) => BlocProvider.of(context);


  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController commercialRegisterController = TextEditingController();
  final TextEditingController taxIdentificationNumberController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  XFile? image;

  Future<void> editSupplier() async {
    if(!formKey.currentState!.validate()) return;

    supplier.name = nameController.text;
    supplier.email = emailController.text;
    supplier.phone = phoneController.text;
    supplier.address = addressController.text;
    supplier.commercialRegister = commercialRegisterController.text;
    supplier.taxIdentificationNumber = taxIdentificationNumberController.text;
    supplier.note = noteController.text;
    if(image != null) supplier.imagePath = image?.path;
    emit(EditSupplierLoading());
    final result = await suppliersRepo.editSupplier(supplier);
    result.fold(
      (error) => emit(EditSupplierError(error)),
      (data) => emit(EditSupplierSuccess())
    );
  }
}
