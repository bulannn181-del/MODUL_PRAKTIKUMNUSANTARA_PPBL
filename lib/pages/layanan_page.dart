
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/favorit_model.dart';
import '../navigation/app_routes.dart';

class LayananPage extends StatelessWidget {
  const LayananPage({super.key});

  Future<void> _bukaDetail(
    BuildContext context, {
    required String nama,
    required String dinas,
    required String jam,
    required String keterangan,
  }) async {
    final hasil = await Navigator.pushNamed(
      context,
      AppRoutes.detailLayanan,
      arguments: {
        'namaLayanan': nama,
        'dinas': dinas,
        'jamOperasional': jam,
        'keterangan': keterangan,
      },
    );

    if (!context.mounted) return;

    if (hasil is String) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(hasil),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.description_outlined),
                text: 'Perizinan',
              ),
              Tab(
                icon: Icon(Icons.local_hospital_outlined),
                text: 'Kesehatan',
              ),
              Tab(
                icon: Icon(Icons.directions_bus_outlined),
                text: 'Transportasi',
              ),
            ],
          ),

          Expanded(
            child: TabBarView(
              children: [
                _tabPerizinan(context),
                _tabKesehatan(context),
                _tabTransportasi(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _tabPerizinan(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _kartuLayanan(
          context,
          nama: 'Izin Usaha Mikro',
          dinas: 'Dinas Penanaman Modal',
          jam: '08.00 - 15.00',
          keterangan:
              'Layanan pengurusan izin usaha mikro bagi masyarakat.',
        ),
        _kartuLayanan(
          context,
          nama: 'KTP Elektronik',
          dinas: 'Dinas Kependudukan',
          jam: '08.00 - 14.00',
          keterangan:
              'Layanan pembuatan dan pembaruan KTP elektronik.',
        ),
        _kartuLayanan(
          context,
          nama: 'Kartu Keluarga',
          dinas: 'Dinas Kependudukan',
          jam: '08.00 - 14.00',
          keterangan:
              'Layanan administrasi pembuatan kartu keluarga.',
        ),
      ],
    );
  }

  Widget _tabKesehatan(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _kartuLayanan(
          context,
          nama: 'Puskesmas',
          dinas: 'Dinas Kesehatan',
          jam: '07.30 - 14.00',
          keterangan:
              'Pelayanan kesehatan dasar bagi masyarakat.',
        ),
        _kartuLayanan(
          context,
          nama: 'Ambulans Kota',
          dinas: 'Dinas Kesehatan',
          jam: '24 Jam',
          keterangan:
              'Layanan ambulans untuk kondisi darurat.',
        ),
        _kartuLayanan(
          context,
          nama: 'Posyandu',
          dinas: 'Dinas Kesehatan',
          jam: '08.00 - 12.00',
          keterangan:
              'Pelayanan kesehatan ibu dan anak.',
        ),
      ],
    );
  }

  Widget _tabTransportasi(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _kartuLayanan(
          context,
          nama: 'Bus Kota',
          dinas: 'Dinas Perhubungan',
          jam: '05.00 - 22.00',
          keterangan:
              'Transportasi umum yang menghubungkan wilayah kota.',
        ),
        _kartuLayanan(
          context,
          nama: 'Halte Pintar',
          dinas: 'Dinas Perhubungan',
          jam: '24 Jam',
          keterangan:
              'Informasi lokasi dan jadwal halte transportasi kota.',
        ),
        _kartuLayanan(
          context,
          nama: 'Informasi Lalu Lintas',
          dinas: 'Dinas Perhubungan',
          jam: '24 Jam',
          keterangan:
              'Informasi kondisi lalu lintas kota secara berkala.',
        ),
      ],
    );
  }

  Widget _kartuLayanan(
    BuildContext context, {
    required String nama,
    required String dinas,
    required String jam,
    required String keterangan,
  }) {
    final favoritModel = context.watch<FavoritModel>();
    final isFavorit = favoritModel.favorit.contains(nama);

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),

        leading: const CircleAvatar(
          child: Icon(
            Icons.miscellaneous_services,
          ),
        ),

        title: Text(
          nama,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        subtitle: Text(
          '$dinas\nJam: $jam',
        ),

        isThreeLine: true,

        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(
                isFavorit ? Icons.star : Icons.star_border,
                color: isFavorit ? Colors.amber : Colors.grey,
              ),
              onPressed: () {
                if (isFavorit) {
                  context.read<FavoritModel>().batalTandai(nama);
                } else {
                  context.read<FavoritModel>().tandai(nama);
                }
              },
            ),

            const Icon(
              Icons.arrow_forward_ios,
              size: 18,
            ),
          ],
        ),

        onTap: () {
          _bukaDetail(
            context,
            nama: nama,
            dinas: dinas,
            jam: jam,
            keterangan: keterangan,
          );
        },
      ),
    );
  }
}


