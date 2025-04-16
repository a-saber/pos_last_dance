import 'package:flutter_bloc/flutter_bloc.dart';
import 'get_clients_state.dart';
import '../../data/repo/clients_repo.dart';
import '../../data/models/client_model.dart';

class GetClientsCubit extends Cubit<GetClientsState> {
  final ClientsRepo clientsRepo;

  GetClientsCubit(this.clientsRepo) : super(GetClientsInitial());
  static GetClientsCubit get(context) => BlocProvider.of(context);

  Future<void> getClients() async {
    emit(GetClientsLoading());
    final result = await clientsRepo.getClients();
    result.fold(
      (error) => emit(GetClientsError(error)),
      (data) => emit(GetClientsSuccess(data))
    );
  }
}
