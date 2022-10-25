import 'dart:convert';

List<Producto> productosFromJson(List<dynamic> json) =>
    json.map((producto) => Producto.fromJson(producto)).toList();

Producto productoFromJson(String str) => Producto.fromJson(json.decode(str));

String productoToJson(Producto data) => json.encode(data.toJson());

class Producto {
  Producto({
    required this.idProducto,
    required this.nombre,
    required this.tipo,
    required this.descripcion,
    required this.precio,
    required this.cantidad,
    required this.fotoProducto,
  });

  String idProducto;
  String nombre;
  String tipo;
  String descripcion;
  String precio;
  String cantidad;
  String fotoProducto;

  factory Producto.fromJson(Map<String, dynamic> json) => Producto(
        idProducto: json["idProducto"],
        nombre: json["nombre"],
        tipo: json["tipo"],
        descripcion: json["descripcion"],
        precio: json["precio"],
        cantidad: json["cantidad"],
        fotoProducto: json["fotoProducto"],
      );

  Map<String, dynamic> toJson() => {
        "idProducto": idProducto,
        "nombre": nombre,
        "tipo": tipo,
        "descripcion": descripcion,
        "precio": precio,
        "cantidad": cantidad,
        "fotoProducto": fotoProducto,
      };
}
