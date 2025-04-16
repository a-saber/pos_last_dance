import 'package:flutter_bloc/flutter_bloc.dart';
import 'delete_client_state.dart';
import '../../data/repo/clients_repo.dart';
import '../../data/models/client_model.dart';

class DeleteClientCubit extends Cubit<DeleteClientState> {
  final ClientsRepo clientsRepo;

  DeleteClientCubit(this.clientsRepo) : super(DeleteClientInitial());
  static DeleteClientCubit get(context) => BlocProvider.of(context);

  Future<void> deleteClient(ClientModel client) async {
    emit(DeleteClientLoading());
    final result = await clientsRepo.deleteClient(client);
    result.fold(
      (error) => emit(DeleteClientError(error)),
      (data) => emit(DeleteClientSuccess())
    );
  }
}
