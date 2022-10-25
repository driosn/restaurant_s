import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:restaurant_sullu_app/bloc/cliente_bloc.dart';
import 'package:restaurant_sullu_app/paginas/admin_page.dart';
import 'package:restaurant_sullu_app/paginas/camarero_page.dart';
import 'package:restaurant_sullu_app/paginas/carrito_page.dart';
import 'package:restaurant_sullu_app/servicios/servicio_restaurant.dart';
import 'package:restaurant_sullu_app/widgets/main_button.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usuarioController = TextEditingController();
  final _contrasenaController = TextEditingController();

  String opcionSeleccionada = 'cliente';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/fondo_login.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.black.withOpacity(0.3),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: kToolbarHeight,
                ),
                const SizedBox(
                  height: 64,
                ),
                SizedBox(
                  height: 200,
                  child: Image.asset('assets/logo_horizontal.png'),
                ),
                const SizedBox(
                  height: 48,
                ),
                const Text(
                  'Iniciar Sesión',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 48,
                ),
                SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      // Expanded(
                      //   child: GestureDetector(
                      //     onTap: () {
                      //       setState(() {
                      //         opcionSeleccionada = 'adm';
                      //       });
                      //     },
                      //     child: Container(
                      //       color: opcionSeleccionada == 'adm'
                      //           ? Colors.orange
                      //           : Colors.orange.shade200,
                      //       child: const Center(
                      //         child: Text(
                      //           'Adm',
                      //           style: TextStyle(color: Colors.white),
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              opcionSeleccionada = 'camarero';
                            });
                          },
                          child: Container(
                            color: opcionSeleccionada == 'camarero'
                                ? Colors.orange
                                : Colors.orange.shade200,
                            child: const Center(
                              child: Text(
                                'Camarero',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              opcionSeleccionada = 'cliente';
                            });
                          },
                          child: Container(
                            color: opcionSeleccionada == 'cliente'
                                ? Colors.orange
                                : Colors.orange.shade200,
                            child: const Center(
                              child: Text(
                                'Cliente',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                TextField(
                  controller: _usuarioController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Correo'),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                TextField(
                  controller: _contrasenaController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Contraseña'),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                  obscureText: true,
                ),
                const SizedBox(
                  height: 64,
                ),
                MainButton(
                  label: 'Iniciar Sesión',
                  onPressed: () async {
                    try {
                      if (opcionSeleccionada == 'adm') {
                        await _loginAdministrador();
                        return;
                      }

                      if (opcionSeleccionada == 'camarero') {
                        await _loginCamarero();
                        return;
                      }

                      if (opcionSeleccionada == 'cliente') {
                        await _loginCliente();
                        return;
                      }
                    } catch (e) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content:
                                const Text('Usuario o contraseña incorrectos'),
                            actions: [
                              TextButton(
                                child: const Text('Aceptar'),
                                onPressed: () => Navigator.pop(context),
                              )
                            ],
                          );
                        },
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }

  Future<void> _loginAdministrador() async {
    try {
      final correo = _usuarioController.text;
      final contrasena = _contrasenaController.text;

      final administrador = await ServicioRestaurant().loginAdministrador(
        correo: correo,
        contrasena: contrasena,
      );

      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return AdminPage();
          },
        ),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> _loginCamarero() async {
    try {
      final correo = _usuarioController.text;
      final contrasena = _contrasenaController.text;

      final camarero = await ServicioRestaurant().loginCamarero(
        correo: 'will.carlo@outlook.com',
        // correo: correo,
        contrasena: 'admin123',
        // contrasena: contrasena,
      );

      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return CamareroPage();
          },
        ),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> _loginCliente() async {
    try {
      final correo = _usuarioController.text;
      final contrasena = _contrasenaController.text;

      final cliente = await ServicioRestaurant().loginCliente(
        correo: 'daniel@gmail.com',
        // correo: correo,
        contrasena: 'dsae123',
        // contrasena: contrasena,
      );

      ClienteBloc clienteBloc = ClienteBloc();
      clienteBloc.cliente = cliente;

      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return CarritoPage();
          },
        ),
      );
    } catch (e) {
      rethrow;
    }
  }
}
