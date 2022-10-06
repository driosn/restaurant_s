import 'package:flutter/material.dart';
import 'package:restaurant_sullu_app/models/producto.dart';
import 'package:restaurant_sullu_app/paginas/carrito_page.dart';
import 'package:restaurant_sullu_app/widgets/main_button.dart';

class ProductosPage extends StatefulWidget {
  const ProductosPage({
    required this.nombreCategoria,
    required this.imagenDummyCard,
    super.key,
  });

  final String nombreCategoria;
  final String imagenDummyCard;

  @override
  State<ProductosPage> createState() => _ProductosPageState();
}

class _ProductosPageState extends State<ProductosPage> {
  late List<Producto> productos;

  @override
  void initState() {
    super.initState();
    productos = List<Producto>.generate(
      10,
      (index) => Producto(
        nombre: '${widget.nombreCategoria} tipo $index',
        descripcion:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In sit amet congue massa. Aliquam facilisis rhoncus nisi et maximus. Sed suscipit finibus dui ac maximus. Aliquam odio eros, faucibus sed.',
        precio: 12.0,
      ),
    );
  }

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
                widget.imagenDummyCard,
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
      floatingActionButton: MainButton(
        label: 'Ir al carrito',
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CarritoPage(),
              ));
        },
      ),
      appBar: AppBar(
        title: Text(widget.nombreCategoria),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ...productos.map((producto) {
                return _cardProducto(producto);
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
