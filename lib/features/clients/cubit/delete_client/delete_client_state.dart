    import '../../data/models/client_model.dart';


abstract class DeleteClientState {}

class DeleteClientInitial extends DeleteClientState {}

class DeleteClientLoading extends DeleteClientState {}

class DeleteClientSuccess extends DeleteClientState {}

class DeleteClientError extends DeleteClientState {
  final String error;
  DeleteClientError(this.error);
}
