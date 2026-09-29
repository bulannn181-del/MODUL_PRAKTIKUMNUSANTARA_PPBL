import 'package:flutter/material.dart';

class BerandaPage extends StatelessWidget {
  const BerandaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pilar = [
      {
        'nama': 'Smart Governance',
        'icon': Icons.account_balance,
        'deskripsi': 'Pemerintahan yang efektif dan transparan.',
      },
      {
        'nama': 'Smart Economy',
        'icon': Icons.trending_up,
        'deskripsi': 'Mendorong pertumbuhan ekonomi masyarakat.',
      },
      {
        'nama': 'Smart Environment',
        'icon': Icons.eco,
        'deskripsi': 'Menjaga lingkungan kota tetap berkelanjutan.',
      },
      {
        'nama': 'Smart Living',
        'icon': Icons.favorite,
        'deskripsi': 'Meningkatkan kualitas hidup masyarakat.',
      },
      {
        'nama': 'Smart People',
        'icon': Icons.groups,
        'deskripsi': 'Masyarakat yang aktif dan berpengetahuan.',
      },
      {
        'nama': 'Smart Mobility',
        'icon': Icons.directions_bus,
        'deskripsi': 'Transportasi kota yang aman dan efisien.',
      },
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Nusantara Cerdas',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 6),

          const Text(
            'Layanan digital untuk masyarakat kota yang lebih cerdas.',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 24),

          const Text(
            '6 Pilar Smart City',
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 14),

          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: pilar.length,
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.95,
            ),
            itemBuilder: (context, index) {
              final item = pilar[index];

              return Card(
                elevation: 1,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Icon(
                        item['icon'] as IconData,
                        size: 38,
                        color: Colors.teal,
                      ),

                      const SizedBox(height: 12),

                      Text(
                        item['nama'] as String,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),

                      const SizedBox(height: 8),

                      Text(
                        item['deskripsi'] as String,
                        style: const TextStyle(
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}