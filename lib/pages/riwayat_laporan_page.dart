import 'package:flutter/material.dart';

class RiwayatLaporanPage extends StatelessWidget {
  const RiwayatLaporanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Riwayat Laporan Warga',
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Card(
            child: ListTile(
              leading: CircleAvatar(
                child: Icon(
                  Icons.warning_amber,
                ),
              ),
              title: Text(
                'Jalan Berlubang di Jl. Nusantara No. 12',
              ),
              subtitle: Text(
                'Status: Diproses oleh Dinas PU\n12 Mei 2026',
              ),
              isThreeLine: true,
            ),
          ),

          Card(
            child: ListTile(
              leading: CircleAvatar(
                child: Icon(
                  Icons.check_circle,
                ),
              ),
              title: Text(
                'Permohonan Izin Usaha Mikro',
              ),
              subtitle: Text(
                'Status: Selesai\n10 Mei 2026',
              ),
              isThreeLine: true,
            ),
          ),

          Card(
            child: ListTile(
              leading: CircleAvatar(
                child: Icon(
                  Icons.report_problem,
                ),
              ),
              title: Text(
                'Lampu Jalan Rusak',
              ),
              subtitle: Text(
                'Status: Sedang Diproses\n8 Mei 2026',
              ),
              isThreeLine: true,
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Form Tambah Laporan Baru dibuka.',
              ),
            ),
          );
        },
        tooltip: 'Tambah Laporan',
        child: const Icon(Icons.add),
      ),

      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Filter laporan.',
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.filter_list),
              tooltip: 'Filter',
            ),

            IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Pencarian laporan.',
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.search),
              tooltip: 'Cari',
            ),

            const SizedBox(width: 48),

            IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Riwayat siap dicetak.',
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.print),
              tooltip: 'Cetak',
            ),

            IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Notifikasi dibuka.',
                    ),
                  ),
                );
              },
              icon: const Icon(
                Icons.notifications,
              ),
              tooltip: 'Notifikasi',
            ),
          ],
        ),
      ),
    );
  }
}