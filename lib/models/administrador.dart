import 'dart:convert';

Administrador administradorFromJson(String str) =>
    Administrador.fromJson(json.decode(str));

String administradorToJson(Administrador data) => json.encode(data.toJson());

class Administrador {
  Administrador({
    required this.idAdministrador,
    required this.ci,
    required this.nombre,
    required this.paterno,
    required this.materno,
    required this.celular,
    required this.correo,
    required this.nomUsuario,
    required this.contr,
    required this.fotoPerfil,
  });

  String idAdministrador;
  String ci;
  String nombre;
  String paterno;
  String materno;
  String celular;
  String correo;
  String nomUsuario;
  String contr;
  String fotoPerfil;

  factory Administrador.fromJson(Map<String, dynamic> json) => Administrador(
        idAdministrador: json["idAdministrador"],
        ci: json["ci"],
        nombre: json["nombre"],
        paterno: json["paterno"],
        materno: json["materno"],
        celular: json["celular"],
        correo: json["correo"],
        nomUsuario: json["nomUsuario"],
        contr: json["contr"],
        fotoPerfil: json["fotoPerfil"],
      );

  Map<String, dynamic> toJson() => {
        "idAdministrador": idAdministrador,
        "ci": ci,
        "nombre": nombre,
        "paterno": paterno,
        "materno": materno,
        "celular": celular,
        "correo": correo,
        "nomUsuario": nomUsuario,
        "contr": contr,
        "fotoPerfil": fotoPerfil,
      };
}
