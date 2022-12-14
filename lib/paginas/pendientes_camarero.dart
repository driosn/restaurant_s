import 'package:flutter/material.dart';
import 'package:restaurant_sullu_app/paginas/carrito_page.dart';
import 'package:restaurant_sullu_app/widgets/main_button.dart';

class CamareroPage extends StatelessWidget {
  CamareroPage({super.key});

  final _ciController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Camarero'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              'Buscar por: ',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            TextField(
              controller: _ciController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text('CI Cliente'),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'ó',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 16,
            ),
            const SizedBox(
              height: 16,
            ),
            const SizedBox(
              height: 32,
            ),
            MainButton(
              label: 'Agregar Pedido',
              expand: true,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CarritoPage()));
              },
            )
          ],
        ),
      ),
    );
  }
}
