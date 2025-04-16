import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'add_client_state.dart';
import '../../data/repo/clients_repo.dart';
import '../../data/models/client_model.dart';

class AddClientCubit extends Cubit<AddClientState> {
  final ClientsRepo clientsRepo;

  AddClientCubit(this.clientsRepo) : super(AddClientInitial());
  static AddClientCubit get(context) => BlocProvider.of(context);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController commercialRegisterController = TextEditingController();
  final TextEditingController taxIdentificationNumberController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  XFile? image;
  Future<void> addClient() async {
    if(!formKey.currentState!.validate()) return;

    emit(AddClientLoading());
    final result = await clientsRepo.addClient(ClientModel(
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
      (error) => emit(AddClientError(error)),
      (data) => emit(AddClientSuccess())
    );
  }
}
