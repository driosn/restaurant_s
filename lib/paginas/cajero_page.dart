import 'package:flutter/material.dart';
import 'package:restaurant_sullu_app/widgets/main_button.dart';

class CajeroPage extends StatelessWidget {
  CajeroPage({super.key});

  final _ciController = TextEditingController();
  final _nombreController = TextEditingController();
  final _apellidoPaternoController = TextEditingController();
  final _apellidoMaternoController = TextEditingController();
  final _mesaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cajero, Facturar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _ciController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text('CI'),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              controller: _nombreController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Nombre'),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              controller: _apellidoPaternoController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Apellido Paterno'),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              controller: _apellidoMaternoController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Apellido Materno'),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              controller: _mesaController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Mesa'),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            MainButton(
              label: 'Generar Factura',
              expand: true,
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
