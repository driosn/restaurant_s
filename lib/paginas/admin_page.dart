import 'package:flutter/material.dart';
import 'package:restaurant_sullu_app/paginas/menu_page.dart';
import 'package:restaurant_sullu_app/widgets/main_button.dart';

class AdminPage extends StatelessWidget {
  AdminPage({super.key});

  final _ciController = TextEditingController();

  Widget _campoYContenido(
    BuildContext context, {
    required String campo,
    required String contenido,
  }) {
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width - 32,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Text(
              campo,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Expanded(
            child: Text(
              contenido,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          )
        ],
      ),
    );
  }

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
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _ciController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('CI Cliente'),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                ),
                MainButton(
                  label: 'Buscar',
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            _campoYContenido(
              context,
              campo: 'Nombre',
              contenido: '-----',
            ),
            _campoYContenido(
              context,
              campo: 'Ap. Paterno',
              contenido: '-----',
            ),
            _campoYContenido(
              context,
              campo: 'Ap. Materno',
              contenido: '-----',
            ),
            _campoYContenido(
              context,
              campo: 'Celular',
              contenido: '-----',
            ),
            _campoYContenido(
              context,
              campo: 'Correo',
              contenido: '-----',
            ),
            _campoYContenido(
              context,
              campo: 'Usuario',
              contenido: '-----',
            ),
            const SizedBox(height: 32),
            SizedBox(
              height: 80,
              width: MediaQuery.of(context).size.width - 32,
              child: Row(
                children: [
                  Expanded(
                    child: MainButton(
                      label: 'Agregar',
                      onPressed: () {},
                    ),
                  ),
                  Expanded(
                    child: MainButton(
                      label: 'Modificar',
                      onPressed: () {},
                    ),
                  ),
                  Expanded(
                    child: MainButton(
                      label: 'Eliminar',
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
