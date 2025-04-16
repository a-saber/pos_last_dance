import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/custom_empty_data.dart';
import '../../../../core/widgets/custom_error.dart';
import '../../../../core/widgets/custom_loading.dart';
import '../../cubit/get_clients/get_clients_cubit.dart';
import '../../cubit/get_clients/get_clients_state.dart';
import '../../data/models/client_model.dart';

class ClientsCubitBuilder extends StatelessWidget {
  const ClientsCubitBuilder({super.key, required this.clientBuilder});

  final Widget Function(BuildContext context, List<ClientModel> clients) clientBuilder;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetClientsCubit, GetClientsState>(
      builder: (context, state) {
        if (state is GetClientsLoading) {
          return const CustomLoading();
        } else if (state is GetClientsError) {
          return CustomError(
            error: state.error,
            onPressed: GetClientsCubit.get(context).getClients,
          );
        } else if (state is GetClientsSuccess) {
          if (state.clients.isEmpty) {
            return CustomEmptyData(
              onPressed: GetClientsCubit.get(context).getClients,
            );
          } else {
            return clientBuilder(context, state.clients);
          }
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
