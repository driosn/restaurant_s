import 'package:flutter/material.dart';
import 'package:restaurant_sullu_app/bloc/cliente_bloc.dart';
import 'package:restaurant_sullu_app/models/pedido.dart';
import 'package:restaurant_sullu_app/paginas/carrito_page.dart';
import 'package:restaurant_sullu_app/servicios/servicio_restaurant.dart';
import 'package:restaurant_sullu_app/widgets/main_button.dart';

class CamareroPage extends StatefulWidget {
  CamareroPage({super.key});

  @override
  State<CamareroPage> createState() => _CamareroPageState();
}

class _CamareroPageState extends State<CamareroPage> {
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
          crossAxisAlignment: CrossAxisAlignment.start,
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
            const SizedBox(
              height: 32,
            ),
            MainButton(
              label: 'Agregar Pedido',
              expand: true,
              onPressed: () async {
                try {
                  final cliente =
                      await ServicioRestaurant().obtenerClientePorCI(
                    ci: _ciController.text,
                  );

                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Text(
                              'Está seguro de iniciar un pedido para cliente: ${cliente.nombre} ${cliente.paterno} ${cliente.materno}'),
                          actions: [
                            TextButton(
                              child: Text('Cancelar'),
                              onPressed: () => Navigator.pop(context),
                            ),
                            TextButton(
                              child: Text('Aceptar'),
                              onPressed: () {
                                ClienteBloc clienteBloc = ClienteBloc();
                                clienteBloc.cliente = cliente;

                                Navigator.pop(context);

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CarritoPage(),
                                  ),
                                );
                              },
                            )
                          ],
                        );
                      });
                } catch (e) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Text('El cliente buscado no existe'),
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
            ),
            const SizedBox(height: 16),
            const Text(
              'Pedidos pendientes: ',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Expanded(
              child: FutureBuilder<List<Pedido>>(
                future: ServicioRestaurant().obtenerPendientesCamarero(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (snapshot.hasError) {
                    return const Center(
                        child: Text('Hubo un problema al cargar pendientes'));
                  }

                  if (snapshot.hasData) {
                    final pendientes = snapshot.data!;

                    return Container(
                      width: double.infinity,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            ...pendientes.map((pendiente) {
                              return ListTile(
                                title: Text("ID PEDIDO: ${pendiente.idPedido}"),
                                subtitle:
                                    Text("ID CLIENTE: ${pendiente.idCliente}"),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              content: const Text(
                                                '¿Está seguro de cancelar el pedido?',
                                              ),
                                              actions: [
                                                TextButton(
                                                  onPressed: () async {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text('No'),
                                                ),
                                                TextButton(
                                                  onPressed: () async {
                                                    Navigator.pop(context);
                                                    try {
                                                      await ServicioRestaurant()
                                                          .cancelarPedido(
                                                              idPedido: pendiente
                                                                  .idPedido);

                                                      setState(() {});
                                                      showDialog(
                                                          context: context,
                                                          builder: (context) {
                                                            return AlertDialog(
                                                              content: Text(
                                                                  'Pedido cancelado correctamente'),
                                                              actions: [
                                                                TextButton(
                                                                  child: Text(
                                                                      'Aceptar'),
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          context),
                                                                )
                                                              ],
                                                            );
                                                          });
                                                    } catch (e) {
                                                      showDialog(
                                                        context: context,
                                                        builder: (context) {
                                                          return AlertDialog(
                                                            content: Text(
                                                                'No se pudo cancelar el pedido'),
                                                            actions: [
                                                              TextButton(
                                                                child: Text(
                                                                    'Aceptar'),
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        context),
                                                              )
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    }
                                                  },
                                                  child: Text('Aceptar'),
                                                )
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      child: const Text(
                                        'Cancelar',
                                        style: TextStyle(
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              content: const Text(
                                                '¿Está seguro de marcar el pedido como hecho?',
                                              ),
                                              actions: [
                                                TextButton(
                                                  onPressed: () async {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text('No'),
                                                ),
                                                TextButton(
                                                  onPressed: () async {
                                                    Navigator.pop(context);
                                                    try {
                                                      await ServicioRestaurant()
                                                          .marcarPedidoHecho(
                                                              idPedido: pendiente
                                                                  .idPedido);

                                                      setState(() {});
                                                      showDialog(
                                                          context: context,
                                                          builder: (context) {
                                                            return AlertDialog(
                                                              content: Text(
                                                                  'Pedido marcado como hecho correctamente'),
                                                              actions: [
                                                                TextButton(
                                                                  child: Text(
                                                                      'Aceptar'),
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          context),
                                                                )
                                                              ],
                                                            );
                                                          });
                                                    } catch (e) {
                                                      showDialog(
                                                        context: context,
                                                        builder: (context) {
                                                          return AlertDialog(
                                                            content: Text(
                                                                'No se pudo marcar como hecho el pedido'),
                                                            actions: [
                                                              TextButton(
                                                                child: Text(
                                                                    'Aceptar'),
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        context),
                                                              )
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    }
                                                  },
                                                  child: Text('Aceptar'),
                                                )
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      child: Text(
                                        'Hecho',
                                        style: TextStyle(
                                          color: Colors.green.shade700,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            }).toList()
                          ],
                        ),
                      ),
                    );
                  }

                  return Container();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
