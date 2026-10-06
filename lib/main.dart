
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/favorit_model.dart';
import 'models/pengajuan_model.dart';
import 'navigation/app_routes.dart';
import 'navigation/route_generator.dart';
import 'pages/halaman_tidak_dikenal.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => FavoritModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => PengajuanModel(),
        ),
      ],
      child: const NusantaraCerdasApp(),
    ),
  );
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

      // Halaman pertama aplikasi
      initialRoute: AppRoutes.beranda,

      // Mengatur seluruh named route
      onGenerateRoute: RouteGenerator.generateRoute,

      // Jika route tidak ditemukan
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (_) => HalamanTidakDikenal(
            namaRoute: settings.name,
          ),
        );
      },
    );
  }
}

