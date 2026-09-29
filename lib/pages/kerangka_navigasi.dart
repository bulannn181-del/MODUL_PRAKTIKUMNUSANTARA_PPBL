import 'package:flutter/material.dart';

import '../navigation/app_routes.dart';
import 'beranda_page.dart';
import 'layanan_page.dart';
import 'warga_page.dart';

class KerangkaNavigasi extends StatefulWidget {
  const KerangkaNavigasi({super.key});

  @override
  State<KerangkaNavigasi> createState() => _KerangkaNavigasiState();
}

class _KerangkaNavigasiState extends State<KerangkaNavigasi> {
  int _indeksTerpilih = 0;

  final List<Widget> _halaman = const [
    BerandaPage(),
    LayananPage(),
    WargaPage(),
  ];

  final List<String> _judul = const ['Beranda', 'Layanan', 'Warga'];

  void _pilihTujuan(int index) {
    setState(() {
      _indeksTerpilih = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final lebar = MediaQuery.of(context).size.width;

    if (lebar >= 600) {
      return _tataLetakLebar();
    }

    return Scaffold(
      appBar: AppBar(title: Text(_judul[_indeksTerpilih])),

      drawer: _buatDrawer(),

      body: _halaman[_indeksTerpilih],

      bottomNavigationBar: _buatBilahBawah(),
    );
  }

  Widget _buatBilahBawah() {
    return NavigationBar(
      selectedIndex: _indeksTerpilih,
      onDestinationSelected: _pilihTujuan,
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home),
          label: 'Beranda',
        ),
        NavigationDestination(
          icon: Icon(Icons.miscellaneous_services_outlined),
          selectedIcon: Icon(Icons.miscellaneous_services),
          label: 'Layanan',
        ),
        NavigationDestination(
          icon: Icon(Icons.person_outline),
          selectedIcon: Icon(Icons.person),
          label: 'Warga',
        ),
      ],
    );
  }

  Widget _tataLetakLebar() {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: _indeksTerpilih,
            onDestinationSelected: _pilihTujuan,
            extended: true,
            leading: Builder(
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 16),
                  child: CircleAvatar(
                    radius: 28,
                    child: IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    ),
                  ),
                );
              },
            ),
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.home_outlined),
                selectedIcon: Icon(Icons.home),
                label: Text('Beranda'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.miscellaneous_services_outlined),
                selectedIcon: Icon(Icons.miscellaneous_services),
                label: Text('Layanan'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.person_outline),
                selectedIcon: Icon(Icons.person),
                label: Text('Warga'),
              ),
            ],
          ),

          const VerticalDivider(width: 1),

          Expanded(
            child: Column(
              children: [
                AppBar(title: Text(_judul[_indeksTerpilih])),
                Expanded(child: _halaman[_indeksTerpilih]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buatDrawer() {
    return NavigationDrawer(
      selectedIndex: _indeksTerpilih,
      onDestinationSelected: (index) {
        if (index <= 2) {
          _pilihTujuan(index);
          Navigator.pop(context);
        }
      },
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 12),
          child: UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.teal),
            accountName: Text('Bulan Derby'),
            accountEmail: Text('warga@nusantaracerdas.id'),
            currentAccountPicture: CircleAvatar(
              child: Icon(Icons.person, size: 35),
            ),
          ),
        ),

        const Padding(
          padding: EdgeInsets.fromLTRB(28, 12, 16, 8),
          child: Text(
            'Menu Utama',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),

        const NavigationDrawerDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home),
          label: Text('Beranda'),
        ),

        const NavigationDrawerDestination(
          icon: Icon(Icons.miscellaneous_services_outlined),
          selectedIcon: Icon(Icons.miscellaneous_services),
          label: Text('Layanan'),
        ),

        const NavigationDrawerDestination(
          icon: Icon(Icons.person_outline),
          selectedIcon: Icon(Icons.person),
          label: Text('Warga'),
        ),

        const Divider(),

        const Padding(
          padding: EdgeInsets.fromLTRB(28, 8, 16, 8),
          child: Text(
            'Menu Pendukung',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),

        ListTile(
          leading: const Icon(Icons.settings_outlined),
          title: const Text('Pengaturan Kota'),
          onTap: () {
            Navigator.pop(context);

            Navigator.pushNamed(context, AppRoutes.pengaturan);
          },
        ),

        ListTile(
          leading: const Icon(Icons.info_outline),
          title: const Text('Tentang Aplikasi'),
          onTap: () {
            Navigator.pop(context);

            Navigator.pushNamed(context, AppRoutes.tentang);
          },
        ),

        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text('Keluar'),
          onTap: () {
            Navigator.pop(context);

            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Anda telah keluar dari aplikasi.')),
            );
          },
        ),
      ],
    );
  }
}
