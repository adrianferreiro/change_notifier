import 'package:ejemplo_change_notifier/routes.dart';
import 'package:ejemplo_change_notifier/view_model/usuarios_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() async {
  await init();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UsuariosViewModel(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

Future init() async {
  WidgetsFlutterBinding.ensureInitialized();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Change Notifier Ejemplo',
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: getApplicationRoutes(),
    );
  }
}
