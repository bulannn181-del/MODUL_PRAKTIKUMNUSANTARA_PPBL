import 'package:flutter/material.dart';

class PengaturanPage extends StatefulWidget {
  const PengaturanPage({super.key});

  @override
  State<PengaturanPage> createState() =>
      _PengaturanPageState();
}

class _PengaturanPageState
    extends State<PengaturanPage> {
  bool notifikasi = true;
  bool lokasi = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaturan Kota'),
      ),

      body: ListView(
        children: [
          SwitchListTile(
            title: const Text(
              'Notifikasi',
            ),
            subtitle: const Text(
              'Menerima informasi layanan kota.',
            ),
            value: notifikasi,
            onChanged: (value) {
              setState(() {
                notifikasi = value;
              });
            },
          ),

          SwitchListTile(
            title: const Text(
              'Lokasi',
            ),
            subtitle: const Text(
              'Gunakan lokasi untuk layanan terdekat.',
            ),
            value: lokasi,
            onChanged: (value) {
              setState(() {
                lokasi = value;
              });
            },
          ),
        ],
      ),
    );
  }
}