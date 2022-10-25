import 'dart:convert';

Cliente clienteFromJson(String str) => Cliente.fromJson(json.decode(str));

String clienteToJson(Cliente data) => json.encode(data.toJson());

class Cliente {
  Cliente({
    required this.idCliente,
    required this.ci,
    required this.nombre,
    required this.paterno,
    required this.materno,
    required this.celular,
    required this.correo,
    required this.nomUsuario,
    required this.passw,
    required this.fotoPerfil,
    required this.idAdministrador,
    required this.idMesa,
  });

  String idCliente;
  String ci;
  String nombre;
  String paterno;
  String materno;
  String celular;
  String correo;
  String nomUsuario;
  String passw;
  String fotoPerfil;
  String idAdministrador;
  String idMesa;

  factory Cliente.fromJson(Map<String, dynamic> json) => Cliente(
        idCliente: json["idCliente"],
        ci: json["ci"],
        nombre: json["nombre"],
        paterno: json["paterno"],
        materno: json["materno"],
        celular: json["celular"],
        correo: json["correo"],
        nomUsuario: json["nomUsuario"],
        passw: json["passw"],
        fotoPerfil: json["fotoPerfil"],
        idAdministrador: json["idAdministrador"],
        idMesa: json["idMesa"],
      );

  Map<String, dynamic> toJson() => {
        "idCliente": idCliente,
        "ci": ci,
        "nombre": nombre,
        "paterno": paterno,
        "materno": materno,
        "celular": celular,
        "correo": correo,
        "nomUsuario": nomUsuario,
        "passw": passw,
        "fotoPerfil": fotoPerfil,
        "idAdministrador": idAdministrador,
        "idMesa": idMesa,
      };
}
