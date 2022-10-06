import 'package:flutter/material.dart';
import 'package:restaurant_sullu_app/models/producto.dart';
import 'package:restaurant_sullu_app/widgets/main_button.dart';

class CarritoPage extends StatelessWidget {
  const CarritoPage({super.key});

  Widget _cardProducto(Producto producto) {
    return Container(
      height: 200,
      width: double.infinity,
      child: Card(
        child: Row(
          children: [
            SizedBox(
              height: 200,
              width: 150,
              child: Image.asset(
                'assets/hamburguesa_prod.jpg',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      producto.nombre,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      child: Text(
                        producto.descripcion,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '${producto.precio} Bs.',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          color: Colors.purple,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          MainButton(label: 'Agregar Observaciones', onPressed: () {}),
          const SizedBox(
            height: 16,
          ),
          MainButton(label: 'Enviar Pedido', onPressed: () {})
        ],
      ),
      appBar: AppBar(
        title: Text('Carrito de compras'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _cardProducto(
                Producto(
                  nombre: 'Hamburguesa tipo 1',
                  descripcion:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In sit amet congue massa. Aliquam facilisis rhoncus nisi et maximus. Sed suscipit finibus dui ac maximus. Aliquam odio eros, faucibus sed.',
                  precio: 12.0,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 40,
                      color: Colors.purple,
                      child: Center(
                        child: Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 40,
                      color: Colors.white,
                      child: Center(
                        child: Text(
                          '1',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 40,
                      color: Colors.purple,
                      child: Center(
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
