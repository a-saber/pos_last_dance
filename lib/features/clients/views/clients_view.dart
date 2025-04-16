import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/core/helper/my_navigator.dart';
import 'package:pos/core/translation/translation_keys.dart';
import 'package:pos/core/utils/app_paddings.dart';
import 'package:pos/core/widgets/custom_app_bar.dart';
import 'package:pos/core/widgets/custom_floating_action_btn.dart';
import 'package:pos/core/widgets/custom_refresh_indicator.dart';
import 'package:pos/features/clients/cubit/get_clients/get_clients_cubit.dart';
import 'package:pos/features/clients/views/add_client_view.dart';
import 'package:pos/features/clients/views/widgets/clients_cubit_builder.dart';

import 'widgets/client_item_builder.dart';

class ClientsView extends StatelessWidget {
  const ClientsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomFloatingActionBtn(
          onPressed: ()
          {
            MyNavigator.goTo(destinationBuilder: () => AddClientView());
          }
      ),
      appBar: CustomAppBar(title: TranslationsKeys.clients.tr),
      body: CustomRefreshIndicator(
        onRefresh: GetClientsCubit.get(context).getClients,
        child: Padding(
          padding: AppPaddings.defaultView,
          child: ClientsCubitBuilder(
              clientBuilder: (context, clients)
              {
                return ListView.builder(
                  itemCount: clients.length,
                  itemBuilder: (context, index) {
                    return ClientItemBuilder(client: clients[index]);
                  },
                );
              }),
        ),
      ),
    );
  }
}
