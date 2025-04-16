import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'edit_client_state.dart';
import '../../data/repo/clients_repo.dart';
import '../../data/models/client_model.dart';

class EditClientCubit extends Cubit<EditClientState> {
  final ClientsRepo clientsRepo;
  final  ClientModel client;
  EditClientCubit(this.clientsRepo, this.client) : super(EditClientInitial())
  {
    nameController.text = client.name ?? "";
    emailController.text = client.email ?? "";
    phoneController.text = client.phone ?? "";
    addressController.text = client.address ?? "";
    commercialRegisterController.text = client.commercialRegister ?? "";
    taxIdentificationNumberController.text = client.taxIdentificationNumber ?? "";
    noteController.text = client.note ?? "";
  }
  static EditClientCubit get(context) => BlocProvider.of(context);


  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController commercialRegisterController = TextEditingController();
  final TextEditingController taxIdentificationNumberController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  XFile? image;

  Future<void> editClient() async {
    if(!formKey.currentState!.validate()) return;

    client.name = nameController.text;
    client.email = emailController.text;
    client.phone = phoneController.text;
    client.address = addressController.text;
    client.commercialRegister = commercialRegisterController.text;
    client.taxIdentificationNumber = taxIdentificationNumberController.text;
    client.note = noteController.text;
    if(image != null) client.imagePath = image?.path;
    emit(EditClientLoading());
    final result = await clientsRepo.editClient(client);
    result.fold(
      (error) => emit(EditClientError(error)),
      (data) => emit(EditClientSuccess())
    );
  }
}
