import 'package:flutter/material.dart';

import '../pages/detail_layanan_page.dart';
import '../pages/halaman_tidak_dikenal.dart';
import '../pages/kerangka_navigasi.dart';
import '../pages/pengaturan_page.dart';
import '../pages/riwayat_laporan_page.dart';
import '../pages/tentang_page.dart';
import 'app_routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.beranda:
        return MaterialPageRoute(
          builder: (_) => const KerangkaNavigasi(),
        );

      case AppRoutes.detailLayanan:
        final args = settings.arguments;

        if (args is Map<String, String>) {
          return MaterialPageRoute(
            builder: (_) => DetailLayananPage(
              namaLayanan: args['namaLayanan'] ?? '',
              dinas: args['dinas'] ?? '',
              jamOperasional: args['jamOperasional'] ?? '',
              keterangan: args['keterangan'] ?? '',
            ),
          );
        }

        return MaterialPageRoute(
          builder: (_) => const HalamanTidakDikenal(
            namaRoute: AppRoutes.detailLayanan,
          ),
        );

      case AppRoutes.riwayatLaporan:
        return MaterialPageRoute(
          builder: (_) => const RiwayatLaporanPage(),
        );

      case AppRoutes.pengaturan:
        return MaterialPageRoute(
          builder: (_) => const PengaturanPage(),
        );

      case AppRoutes.tentang:
        return MaterialPageRoute(
          builder: (_) => const TentangPage(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => HalamanTidakDikenal(
            namaRoute: settings.name,
          ),
        );
    }
  }
}