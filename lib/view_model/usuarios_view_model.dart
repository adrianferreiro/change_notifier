import 'package:ejemplo_change_notifier/model/usuarios_model.dart';
import 'package:flutter/material.dart';

class UsuariosViewModel extends ChangeNotifier {
  String name = 'vacio';

  Future buscarUsuario({required String correo}) async {
    name = 'cargando';

    final resultado = await gestionar_usuarios(
      accion: 'buscar_usuario',
      correo: correo,
    );
    name = resultado.detalles.first['nombre'];
    notifyListeners();
  }
}
