import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:restaurant_sullu_app/paginas/admin_page.dart';
import 'package:restaurant_sullu_app/paginas/cajero_page.dart';
import 'package:restaurant_sullu_app/paginas/camarero_page.dart';
import 'package:restaurant_sullu_app/paginas/menu_page.dart';
import 'package:restaurant_sullu_app/widgets/main_button.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _usuarioController = TextEditingController();
  final _contrasenaController = TextEditingController();

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
              TextField(
                controller: _usuarioController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Usuario'),
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              TextField(
                controller: _contrasenaController,
                decoration: InputDecoration(
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
                onPressed: () {
                  Widget pantallaRuta = MenuPage();

                  if (_usuarioController.text == 'cajero') {
                    pantallaRuta = CajeroPage();
                  }

                  if (_usuarioController.text == 'camarero') {
                    pantallaRuta = CamareroPage();
                  }

                  if (_usuarioController.text == 'admin') {
                    pantallaRuta = AdminPage();
                  }

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => pantallaRuta),
                  );
                },
              ),
            ],
          ),
        )
      ],
    ));
  }
}
