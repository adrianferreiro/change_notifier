import 'package:ejemplo_change_notifier/view/usuarios.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/home': (BuildContext context) => const UsuariosView(),
  };
}
