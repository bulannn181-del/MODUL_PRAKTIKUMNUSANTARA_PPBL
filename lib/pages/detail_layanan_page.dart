import 'package:flutter/material.dart';

class DetailLayananPage extends StatelessWidget {
  final String namaLayanan;
  final String dinas;
  final String jamOperasional;
  final String keterangan;

  const DetailLayananPage({
    super.key,
    required this.namaLayanan,
    required this.dinas,
    required this.jamOperasional,
    required this.keterangan,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Layanan'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.teal.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.miscellaneous_services,
                  size: 60,
                  color: Colors.teal,
                ),
              ),
            ),

            const SizedBox(height: 24),

            Text(
              namaLayanan,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            _informasi(
              Icons.account_balance,
              'Dinas Penanggung Jawab',
              dinas,
            ),

            _informasi(
              Icons.access_time,
              'Jam Operasional',
              jamOperasional,
            ),

            _informasi(
              Icons.info_outline,
              'Keterangan',
              keterangan,
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(
                    context,
                    'Permohonan "$namaLayanan" telah berhasil diajukan.',
                  );
                },
                icon: const Icon(Icons.send),
                label: const Text(
                  'Ajukan Permohonan',
                ),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    vertical: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _informasi(
    IconData icon,
    String judul,
    String isi,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: Colors.teal,
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  judul,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(isi),
              ],
            ),
          ),
        ],
      ),
    );
  }
}