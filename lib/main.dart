import 'package:flutter/material.dart';

import 'navigation/app_routes.dart';
import 'navigation/route_generator.dart';
import 'pages/halaman_tidak_dikenal.dart';

void main() {
  runApp(const NusantaraCerdasApp());
}

class NusantaraCerdasApp extends StatelessWidget {
  const NusantaraCerdasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nusantara Cerdas Mobile',

      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.teal,
        scaffoldBackgroundColor: const Color(0xFFF7F9F9),
      ),

      initialRoute: AppRoutes.beranda,
      onGenerateRoute: RouteGenerator.generateRoute,

      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (_) => HalamanTidakDikenal(namaRoute: settings.name),
        );
      },
    );
  }
}
