import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pos/core/helper/my_navigator.dart';
import 'package:pos/core/helper/my_service_locator.dart';
import 'package:pos/core/translation/translation_keys.dart';
import 'package:pos/core/widgets/custom_app_bar.dart';
import 'package:pos/core/widgets/custom_fields/custom_btn.dart';
import 'package:pos/core/widgets/custom_pop_up.dart';
import 'package:pos/features/clients/cubit/edit_client/edit_client_cubit.dart';
import 'package:pos/features/clients/cubit/get_clients/get_clients_cubit.dart';
import 'package:pos/features/clients/data/models/client_model.dart';
import 'package:pos/features/clients/data/repo/clients_repo.dart';
import 'package:pos/features/clients/views/widgets/client_data_builder.dart';

import '../cubit/edit_client/edit_client_state.dart';
import 'widgets/delete_client_confirm_dialog.dart';

class EditClientView extends StatelessWidget {
  const EditClientView({super.key, required this.client});
  final ClientModel client;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditClientCubit(MyServiceLocator.getSingleton<ClientsRepo>(), client),
      child: Scaffold(
        appBar: CustomAppBar(title: TranslationsKeys.editClient.tr,
        actions:
        [
            CustomTextBtn(
              text: TranslationsKeys.delete.tr,
              onPressed: () async {
                await showDeleteClientConfirmDialog(
                  context: context, client: client, goBack: true
                );
              })
        ],),
        body: BlocConsumer<EditClientCubit, EditClientState>(
          listener: (context, state)
          {
            if(state is EditClientSuccess)
            {
              GetClientsCubit.get(context).getClients();
              CustomPopUp.callMyToast(context: context, massage: TranslationsKeys.updatedSuccess.tr, state: PopUpState.SUCCESS);
              MyNavigator.goBack();
            }
            else if(state is EditClientError)
            {
              CustomPopUp.callMyToast(context: context, massage: state.error, state: PopUpState.ERROR);
            }
          },
          builder: (context, state)
          {
            return ClientDataBuilder(
              onSelectedImage: (image) => EditClientCubit.get(context).image = image,
              formKey: EditClientCubit.get(context).formKey,
              nameController: EditClientCubit.get(context).nameController,
              emailController: EditClientCubit.get(context).emailController,
              phoneController: EditClientCubit.get(context).phoneController,
              addressController: EditClientCubit.get(context).addressController,
              commercialRegisterController: EditClientCubit.get(context).commercialRegisterController,
              taxIdentificationNumberController: EditClientCubit.get(context).taxIdentificationNumberController,
              noteController: EditClientCubit.get(context).noteController,
              isLoading: state is EditClientLoading,
              onPressed: EditClientCubit.get(context).editClient,
              isEdit: true,
              imageUrl: client.imagePath,
            );
          },
        ),
      ),
    );
  }
}
