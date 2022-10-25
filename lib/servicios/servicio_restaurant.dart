import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:restaurant_sullu_app/models/administrador.dart';
import 'package:restaurant_sullu_app/models/camarero.dart';
import 'package:restaurant_sullu_app/models/cliente.dart';
import 'package:restaurant_sullu_app/models/pedido.dart';
import 'package:restaurant_sullu_app/models/producto.dart';

class ServicioRestaurant {
  late Dio dio;

  ServicioRestaurant() {
    dio = Dio(BaseOptions(baseUrl: 'http://10.0.2.2:80/restaurantAndroid'));
  }

  final String loginAdministradorEndpoint = '/login.php';

  Future<Administrador> loginAdministrador({
    required String correo,
    required String contrasena,
  }) async {
    try {
      final response = await dio.post(
        '/login.php',
        options:
            Options(contentType: 'multipart/form-data; boundary=something'),
        data: FormData.fromMap(
          {
            'correo': correo,
            'contr': contrasena,
          },
        ),
      );

      if (response.statusCode == 200) {
        return Administrador.fromJson(jsonDecode(response.data));
      }

      throw Exception(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<Camarero> loginCamarero({
    required String correo,
    required String contrasena,
  }) async {
    try {
      final response = await dio.post(
        '/loginCamar.php',
        options:
            Options(contentType: 'multipart/form-data; boundary=something'),
        data: FormData.fromMap(
          {
            'correo': correo,
            'contr': contrasena,
          },
        ),
      );

      if (response.statusCode == 200) {
        return Camarero.fromJson(jsonDecode(response.data));
      }

      throw Exception(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<Cliente> loginCliente({
    required String correo,
    required String contrasena,
  }) async {
    try {
      final response = await dio.post(
        '/loginCliente.php',
        options:
            Options(contentType: 'multipart/form-data; boundary=something'),
        data: FormData.fromMap(
          {
            'correo': correo,
            'contr': contrasena,
          },
        ),
      );

      if (response.statusCode == 200) {
        return Cliente.fromJson(jsonDecode(response.data));
      }

      throw Exception(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<Cliente> obtenerClientePorCI({
    required String ci,
  }) async {
    try {
      final response = await dio.get(
        '/adm/CRUD_cliente/fetch.php?ci=$ci',
      );

      if (response.statusCode == 200) {
        return Cliente.fromJson(jsonDecode(response.data));
      }

      throw Exception(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Producto>> obtenerProductos() async {
    try {
      final response = await dio.get(
        '/producto.php',
      );

      if (response.statusCode == 200) {
        final decodedResp = jsonDecode(response.data);
        final listaProductos = (decodedResp as List<dynamic>).map((data) {
          return Producto.fromJson(data);
        }).toList();
        return listaProductos;
      }

      throw Exception(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<Pedido> obtenerUltimoPedido() async {
    try {
      final response = await dio.get(
        '/obtenerUltimoPedido.php',
      );

      if (response.statusCode == 200) {
        return Pedido.fromJson(jsonDecode(response.data));
      }

      throw Exception(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Pedido>> obtenerPendientesCamarero() async {
    try {
      final response = await dio.get(
        '/obtenerPendientesCamarero.php',
      );

      if (response.statusCode == 200) {
        final decodedResp = jsonDecode(response.data);
        final listaPedidos = (decodedResp as List<dynamic>).map((data) {
          return Pedido.fromJson(data);
        }).toList();
        return listaPedidos;
      }

      throw Exception(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> enviarPedido({
    required String idCliente,
    required String observaciones,
  }) async {
    try {
      final response = await dio.post(
        '/agregarPedido.php',
        options:
            Options(contentType: 'multipart/form-data; boundary=something'),
        data: FormData.fromMap(
          {
            'idCliente': idCliente,
            'observaciones': observaciones,
          },
        ),
      );

      if (response.statusCode == 200) {
        return;
      }

      throw Exception(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> agregarPide({
    required String idProducto,
    required String idPedido,
  }) async {
    try {
      final response = await dio.post(
        '/agregarPide.php',
        options:
            Options(contentType: 'multipart/form-data; boundary=something'),
        data: FormData.fromMap(
          {
            'idProducto': idProducto,
            'idPedido': idPedido,
          },
        ),
      );

      if (response.statusCode == 200) {
        return;
      }

      throw Exception(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> cancelarPedido({
    required String idPedido,
  }) async {
    try {
      final response = await dio.post(
        '/cancelarPedido.php',
        options:
            Options(contentType: 'multipart/form-data; boundary=something'),
        data: FormData.fromMap(
          {
            'idPedido': idPedido,
          },
        ),
      );

      if (response.statusCode == 200) {
        return;
      }

      throw Exception(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> marcarPedidoHecho({
    required String idPedido,
  }) async {
    try {
      final response = await dio.post(
        '/marcarPedidoHecho.php',
        options:
            Options(contentType: 'multipart/form-data; boundary=something'),
        data: FormData.fromMap(
          {
            'idPedido': idPedido,
          },
        ),
      );

      if (response.statusCode == 200) {
        return;
      }

      throw Exception(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
