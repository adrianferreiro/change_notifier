// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../variables_globales.dart';
import 'general.dart';

Future gestionar_usuarios({
  required String accion,
  String? correo,
}) async {
  try {
    final response = await http.post(
      Uri.parse('$urlGlobal/usuarios.php'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'accion': accion,
        'correo': correo ?? '',
      }),
    );
    final respuestaJson = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return ModelGeneral(
          codigo: respuestaJson['codigo'], detalles: respuestaJson['detalles']);
    } else {
      return const ModelGeneral(
        codigo: '0',
        detalles: [
          {"mensaje": "Error !200."}
        ],
      );
    }
  } on SocketException {
    return const ModelGeneral(
      codigo: '0',
      detalles: [
        {
          "mensaje":
              "Te quedaste sin internet. Verificá tu conexión e intentá de nuevo."
        }
      ],
    );
  } on HttpException {
    return const ModelGeneral(
      codigo: '0',
      detalles: [
        {"mensaje": "Ocurrió un error."}
      ],
    );
  } on FormatException {
    return const ModelGeneral(
      codigo: '0',
      detalles: [
        {"mensaje": "Ocurrió un error."}
      ],
    );
  }
}
