import 'package:flutter/material.dart';
import 'package:restaurant_sullu_app/paginas/productos_page.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  Widget _menuOpcion(
      {required String dirImagen, required VoidCallback onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(3, 3),
              blurRadius: 3,
              spreadRadius: 3,
            )
          ],
          image: DecorationImage(
            image: AssetImage(dirImagen),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _menuOpcion(
                dirImagen: 'assets/ensaladas.png',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductosPage(
                          nombreCategoria: 'Ensalada',
                          imagenDummyCard: 'assets/ensalada_prod.jpg'),
                    ),
                  );
                },
              ),
              _menuOpcion(
                dirImagen: 'assets/pizzas.png',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductosPage(
                        nombreCategoria: 'Pizza',
                        imagenDummyCard: 'assets/pizza_prod.jpg',
                      ),
                    ),
                  );
                },
              ),
              _menuOpcion(
                dirImagen: 'assets/hamburguesas.png',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductosPage(
                        nombreCategoria: 'Hamburguesa',
                        imagenDummyCard: 'assets/hamburguesa_prod.jpg',
                      ),
                    ),
                  );
                },
              ),
              _menuOpcion(
                dirImagen: 'assets/postres.png',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductosPage(
                        nombreCategoria: 'Postre',
                        imagenDummyCard: 'assets/postre_prod.jpg',
                      ),
                    ),
                  );
                },
              ),
              _menuOpcion(
                dirImagen: 'assets/bebidas.png',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductosPage(
                        nombreCategoria: 'Bebida',
                        imagenDummyCard: 'assets/bebida_prod.jpg',
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
