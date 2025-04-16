    import '../../data/models/client_model.dart';


abstract class GetClientsState {}

class GetClientsInitial extends GetClientsState {}

class GetClientsLoading extends GetClientsState {}

class GetClientsSuccess extends GetClientsState { final List<ClientModel> clients; GetClientsSuccess(this.clients); }

class GetClientsError extends GetClientsState {
  final String error;
  GetClientsError(this.error);
}
