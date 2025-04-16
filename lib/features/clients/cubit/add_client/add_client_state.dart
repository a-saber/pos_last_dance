    import '../../data/models/client_model.dart';


abstract class AddClientState {}

class AddClientInitial extends AddClientState {}

class AddClientLoading extends AddClientState {}

class AddClientSuccess extends AddClientState {}

class AddClientError extends AddClientState {
  final String error;
  AddClientError(this.error);
}
