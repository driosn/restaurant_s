import 'dart:convert';

Pedido pedidoFromJson(String str) => Pedido.fromJson(json.decode(str));

String pedidoToJson(Pedido data) => json.encode(data.toJson());

class Pedido {
  Pedido({
    required this.idPedido,
    required this.observaciones,
    required this.estado,
    required this.idCamarero,
    required this.idChef,
    required this.idCliente,
  });

  String idPedido;
  String observaciones;
  String estado;
  String idCamarero;
  String idChef;
  String idCliente;

  factory Pedido.fromJson(Map<String, dynamic> json) => Pedido(
        idPedido: json["idPedido"],
        observaciones: json["observaciones"],
        estado: json["estado"],
        idCamarero: json["idCamarero"],
        idChef: json["idChef"],
        idCliente: json["idCliente"],
      );

  Map<String, dynamic> toJson() => {
        "idPedido": idPedido,
        "observaciones": observaciones,
        "estado": estado,
        "idCamarero": idCamarero,
        "idChef": idChef,
        "idCliente": idCliente,
      };
}
