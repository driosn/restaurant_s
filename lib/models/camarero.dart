import 'dart:convert';

Camarero camareroFromJson(String str) => Camarero.fromJson(json.decode(str));

String camareroToJson(Camarero data) => json.encode(data.toJson());

class Camarero {
  Camarero({
    required this.idCamarero,
    required this.ci,
    required this.nombre,
    required this.paterno,
    required this.materno,
    required this.celular,
    required this.correo,
    required this.nomUsuario,
    required this.contrasea,
    required this.idAdministrador,
  });

  String idCamarero;
  String ci;
  String nombre;
  String paterno;
  String materno;
  String celular;
  String correo;
  String nomUsuario;
  String contrasea;
  String idAdministrador;

  factory Camarero.fromJson(Map<String, dynamic> json) => Camarero(
        idCamarero: json["idCamarero"],
        ci: json["ci"],
        nombre: json["nombre"],
        paterno: json["paterno"],
        materno: json["materno"],
        celular: json["celular"],
        correo: json["correo"],
        nomUsuario: json["nomUsuario"],
        contrasea: json["contraseña"],
        idAdministrador: json["idAdministrador"],
      );

  Map<String, dynamic> toJson() => {
        "idCamarero": idCamarero,
        "ci": ci,
        "nombre": nombre,
        "paterno": paterno,
        "materno": materno,
        "celular": celular,
        "correo": correo,
        "nomUsuario": nomUsuario,
        "contraseña": contrasea,
        "idAdministrador": idAdministrador,
      };
}
