import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pos/core/helper/my_navigator.dart';
import 'package:pos/core/helper/my_service_locator.dart';
import 'package:pos/core/translation/translation_keys.dart';
import 'package:pos/core/widgets/custom_app_bar.dart';
import 'package:pos/core/widgets/custom_pop_up.dart';
import 'package:pos/features/clients/cubit/add_client/add_client_cubit.dart';
import 'package:pos/features/clients/cubit/add_client/add_client_state.dart';
import 'package:pos/features/clients/cubit/get_clients/get_clients_cubit.dart';
import 'package:pos/features/clients/data/repo/clients_repo.dart';
import 'package:pos/features/clients/views/widgets/client_data_builder.dart';

class AddClientView extends StatelessWidget {
  const AddClientView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => AddClientCubit(MyServiceLocator.getSingleton<ClientsRepo>()),
  child: Scaffold(
      appBar: CustomAppBar(title: TranslationsKeys.addClient.tr),
      body: BlocConsumer<AddClientCubit, AddClientState>(
        listener: (context, state)
        {
          if(state is AddClientSuccess)
          {
            GetClientsCubit.get(context).getClients();
            CustomPopUp.callMyToast(context: context, massage: TranslationsKeys.addedSuccess.tr, state: PopUpState.SUCCESS);
            MyNavigator.goBack();
          }
          else if(state is AddClientError)
          {
            CustomPopUp.callMyToast(context: context, massage: state.error, state: PopUpState.ERROR);
          }
        },
        builder: (context, state)
        {
          return ClientDataBuilder(
            onSelectedImage: (image) => AddClientCubit.get(context).image = image,
            formKey: AddClientCubit.get(context).formKey,
            nameController: AddClientCubit.get(context).nameController,
            emailController: AddClientCubit.get(context).emailController,
            phoneController: AddClientCubit.get(context).phoneController,
            addressController: AddClientCubit.get(context).addressController,
            commercialRegisterController: AddClientCubit.get(context).commercialRegisterController,
            taxIdentificationNumberController: AddClientCubit.get(context).taxIdentificationNumberController,
            noteController: AddClientCubit.get(context).noteController,
            isLoading: state is AddClientLoading,
            onPressed: AddClientCubit.get(context).addClient,
            isEdit: false,
            imageUrl: null,
          );
        },
      ),
    ),
);
  }
}
