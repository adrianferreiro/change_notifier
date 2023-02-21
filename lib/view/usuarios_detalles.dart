import 'package:ejemplo_change_notifier/view_model/usuarios_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UsuariosDetalles extends StatefulWidget {
  const UsuariosDetalles({super.key});

  @override
  State<UsuariosDetalles> createState() => _UsuariosDetallesState();
}

class _UsuariosDetallesState extends State<UsuariosDetalles> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Pagina 2'),
          backgroundColor: const Color.fromARGB(255, 139, 84, 1),
        ),
        body: Consumer<UsuariosViewModel>(
          builder: (context, model, child) {
            return Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Text('PAGINA 2'),
                  Text(model.name),
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Colors.amber,
                      ),
                      foregroundColor: MaterialStateProperty.all(
                        Colors.white,
                      ),
                    ),
                    child: const Text('Buscar usuario'),
                    onPressed: () {
                      model.buscarUsuario(
                          correo: 'adrian_ferreiro@hotmail.com');
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
