import 'package:restaurant_sullu_app/models/cliente.dart';
import 'package:rxdart/rxdart.dart';

class ClienteBloc {
  static final _instancia = ClienteBloc._();

  ClienteBloc._();

  factory ClienteBloc() => _instancia;

  final _clienteController = BehaviorSubject<Cliente>();

  Stream<Cliente> get clienteStream => _clienteController.stream;

  set cliente(Cliente cliente) => _clienteController.sink.add(cliente);

  Cliente get cliente => _clienteController.value;
}
