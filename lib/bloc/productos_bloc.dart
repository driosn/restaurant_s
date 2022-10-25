import 'package:restaurant_sullu_app/models/producto.dart';
import 'package:rxdart/rxdart.dart';

class ProductosBloc {
  final productosController = BehaviorSubject<List<Producto>>();
  Stream<List<Producto>> get productosStream => productosController.stream;
}
