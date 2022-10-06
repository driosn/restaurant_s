import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:restaurant_sullu_app/paginas/menu_page.dart';
import 'package:restaurant_sullu_app/widgets/main_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
              Text(
                "Restaurant\nSullu Manq'awi",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 48),
              ),
              const SizedBox(
                height: 48,
              ),
              Text(
                'Iniciar Sesión',
                style: TextStyle(color: Colors.white, fontSize: 32),
              ),
              const SizedBox(
                height: 48,
              ),
              TextField(
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MenuPage()));
                },
              ),
            ],
          ),
        )
      ],
    ));
  }
}
