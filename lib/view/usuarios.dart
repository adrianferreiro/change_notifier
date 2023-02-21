import 'package:ejemplo_change_notifier/view/usuarios_detalles.dart';
import 'package:ejemplo_change_notifier/view_model/usuarios_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UsuariosView extends StatefulWidget {
  const UsuariosView({super.key});

  @override
  State<UsuariosView> createState() => _UsuariosViewState();
}

class _UsuariosViewState extends State<UsuariosView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Change Notifier'),
          backgroundColor: const Color.fromARGB(255, 139, 84, 1),
        ),
        body: Consumer<UsuariosViewModel>(
          builder: (context, model, child) {
            return Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(20),
              child: Column(
                children: [
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
                      model.buscarUsuario(correo: 'adrian@yahoo.com.ar');
                    },
                  ),
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Colors.amber,
                      ),
                      foregroundColor: MaterialStateProperty.all(
                        Colors.white,
                      ),
                    ),
                    child: const Text('Ir a pagina 2'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const UsuariosDetalles(),
                        ),
                      );
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
