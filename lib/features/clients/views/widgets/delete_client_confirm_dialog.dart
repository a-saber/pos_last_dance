import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pos/core/helper/my_navigator.dart';
import 'package:pos/core/helper/my_service_locator.dart';
import 'package:pos/core/translation/translation_keys.dart';
import 'package:pos/core/widgets/show_delete_confirm_dialog.dart';
import 'package:pos/features/clients/data/repo/clients_repo.dart';

import '../../cubit/get_clients/get_clients_cubit.dart';
import '../../cubit/delete_client/delete_client_cubit.dart';
import '../../cubit/delete_client/delete_client_state.dart';
import '../../data/models/client_model.dart';

Future<bool?> showDeleteClientConfirmDialog({
  required BuildContext context,
  required ClientModel client,
  bool goBack = false
}) async {
 return await showDeleteConfirmationDialog(
      context: context,
      title: TranslationsKeys.deleteClient.tr,
      content: client.name ?? '',
      deleteButtonBuilder: (ctx, button, loading) =>  BlocProvider(
        create: (context) => DeleteClientCubit(MyServiceLocator.getSingleton<ClientsRepo>()),
        child: BlocConsumer<DeleteClientCubit, DeleteClientState>(
          listener: (context, state)
          {
            if (state is DeleteClientSuccess)
            {
              deleteConfirmationDialogSuccess(ctx);
              GetClientsCubit.get(context).getClients();
              if(goBack)
              {
                MyNavigator.goBack();
              }
            }
            else if (state is DeleteClientError)
            {
              deleteConfirmationDialogError( ctx, state.error);
            }
          },
          builder: (context, state) {
            if (state is DeleteClientLoading)
            {
              return loading;
            }
            return button(onPressed: () => DeleteClientCubit.get(context).deleteClient(client));
          },
        ),
      )
  );
}
