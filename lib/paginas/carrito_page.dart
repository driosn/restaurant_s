import 'package:flutter/material.dart';
import 'package:restaurant_sullu_app/bloc/cliente_bloc.dart';
import 'package:restaurant_sullu_app/models/producto.dart';
import 'package:restaurant_sullu_app/servicios/servicio_restaurant.dart';
import 'package:restaurant_sullu_app/widgets/main_button.dart';

class CarritoPage extends StatelessWidget {
  CarritoPage({super.key});

  String observaciones = "Ninguna";

  Map<String, int> idProductoYCantidad = <String, int>{};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade100,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          MainButton(
            label: 'Agregar Observaciones',
            onPressed: () {
              final _obsController = TextEditingController();
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Modificar Observaciones',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          controller: _obsController,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text('Observación actual: $observaciones'),
                        const SizedBox(
                          height: 16,
                        ),
                        MainButton(
                          label: 'Confirmar',
                          onPressed: () {
                            observaciones = _obsController.text;
                            Navigator.pop(context);
                          },
                        )
                      ],
                    ),
                  );
                },
              );
            },
          ),
          const SizedBox(
            height: 16,
          ),
          MainButton(
            label: 'Enviar Pedido',
            onPressed: () async {
              try {
                await ServicioRestaurant().enviarPedido(
                  idCliente: ClienteBloc().cliente.idCliente,
                  observaciones: observaciones,
                );
                final ultimoPedido =
                    await ServicioRestaurant().obtenerUltimoPedido();
                final idPedido = ultimoPedido.idPedido;

                for (var prodCarrito in idProductoYCantidad.entries) {
                  // for (int i = 0; i < prodCarrito.value; i++) {
                  await ServicioRestaurant().agregarPide(
                    idProducto: prodCarrito.key,
                    idPedido: idPedido,
                  );
                  // }
                }

                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content:
                          Text('Se realizó tu pedido correctamente, gracias!'),
                      actions: [
                        TextButton(
                          child: Text('Aceptar'),
                          onPressed: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CarritoPage()),
                          ),
                        )
                      ],
                    );
                  },
                );
              } catch (e) {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text('Ocurrio un error al enviar el pedido'),
                        actions: [
                          TextButton(
                            child: Text('Aceptar'),
                            onPressed: () => Navigator.pop(context),
                          )
                        ],
                      );
                    });
              }
            },
          )
        ],
      ),
      appBar: AppBar(
        title: Text('Carrito de compras'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: FutureBuilder<List<Producto>>(
          future: ServicioRestaurant().obtenerProductos(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.hasError) {
              return const Center(
                  child: Text('Hubo un problema al cargar los productos'));
            }

            if (snapshot.hasData) {
              final productos = snapshot.data!;
              return ListView(
                children: [
                  ...productos.map((producto) {
                    return CardProducto(
                      producto: producto,
                      valoresCarrito: idProductoYCantidad,
                      onProductoAgregado: (producto, cantidad) {
                        idProductoYCantidad.putIfAbsent(
                            producto.idProducto, () => cantidad);
                      },
                    );
                  }).toList()
                ],
              );
            }

            return Container();
          },
        ),
      ),
    );
  }
}

class CardProducto extends StatefulWidget {
  const CardProducto({
    required this.producto,
    required this.valoresCarrito,
    required this.onProductoAgregado,
    super.key,
  });

  final Producto producto;
  final Map<String, int> valoresCarrito;
  final Function(Producto, int) onProductoAgregado;

  @override
  State<CardProducto> createState() => _CardProductoState();
}

class _CardProductoState extends State<CardProducto> {
  int cantidad = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return _DialogProducto(
                producto: widget.producto,
                valoresCarrito: widget.valoresCarrito,
                onProductoAgregado: widget.onProductoAgregado,
              );
            });
      },
      child: Container(
        height: 200,
        width: double.infinity,
        child: Card(
          child: Row(
            children: [
              SizedBox(
                  height: 200,
                  width: 150,
                  child: Image.asset(
                    'assets/${widget.producto.fotoProducto}',
                    fit: BoxFit.cover,
                  )),
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
                        widget.producto.nombre,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      const SizedBox(height: 8),
                      Expanded(
                        child: Text(
                          widget.producto.descripcion,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          widget.producto.precio,
                          textAlign: TextAlign.end,
                          style: const TextStyle(
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
      ),
    );
  }
}

class _DialogProducto extends StatefulWidget {
  const _DialogProducto({
    required this.producto,
    required this.onProductoAgregado,
    required this.valoresCarrito,
    super.key,
  });

  final Producto producto;
  final Map<String, int> valoresCarrito;
  final Function(Producto, int) onProductoAgregado;

  @override
  State<_DialogProducto> createState() => __DialogProductoState();
}

class __DialogProductoState extends State<_DialogProducto> {
  late int cantidad;

  @override
  void initState() {
    cantidad = widget.valoresCarrito[widget.producto.idProducto] ?? 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 200,
          width: double.infinity,
          child: Card(
            child: Row(
              children: [
                SizedBox(
                    height: 200,
                    width: 150,
                    child: Image.asset(
                      'assets/${widget.producto.fotoProducto}',
                      fit: BoxFit.cover,
                    )),
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
                          widget.producto.nombre,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        const SizedBox(height: 8),
                        Expanded(
                          child: Text(
                            widget.producto.descripcion,
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            widget.producto.precio,
                            textAlign: TextAlign.end,
                            style: const TextStyle(
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
        ),
        SizedBox(
          height: 40,
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    if (cantidad == 0) {
                      return;
                    }
                    setState(() {
                      cantidad--;
                    });
                  },
                  child: Container(
                    color: Colors.purple,
                    child: Center(
                      child: Icon(
                        Icons.remove,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: Center(
                      child: Text(
                    '$cantidad',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  )),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      cantidad++;
                    });
                  },
                  child: Container(
                    color: Colors.purple,
                    child: Center(
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        MainButton(
          label: 'Agregar a carrito',
          onPressed: () {
            if (cantidad == 0) {
              return;
            }
            widget.onProductoAgregado(widget.producto, cantidad);
            Navigator.pop(context);
          },
        )
      ],
    ));
  }
}
