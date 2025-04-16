    import '../../data/models/client_model.dart';


abstract class EditClientState {}

class EditClientInitial extends EditClientState {}

class EditClientLoading extends EditClientState {}

class EditClientSuccess extends EditClientState {}

class EditClientError extends EditClientState {
  final String error;
  EditClientError(this.error);
}
