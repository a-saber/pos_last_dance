import '../models/client_model.dart';
import 'package:dartz/dartz.dart';

class ClientsRepo {
  List<ClientModel> _clients =
  [
    ClientModel(
      id: 1,
      name: 'Client 1',
      phone: '0123456789',
      address: 'Address 1',
    )
  ];

  Future<Either<String, List<ClientModel>>> getClients() async {
    try {
      return Right(_clients);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, void>> addClient(ClientModel client) async {
    try {
      client.id = _clients.length + 1;
      _clients.add(client);
      return Right(null);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, void>> editClient(ClientModel client) async {
    try {
      _clients[_clients.indexWhere((element) => element.id == client.id)] = client;
      return Right(null);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, void>> deleteClient(ClientModel client) async {
    try {
      _clients.removeWhere((element) => element.id == client.id);
      return Right(null);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
