import 'package:flutter/material.dart';
import 'aslab_detail_page.dart';

class OrganisasiAslabPage extends StatefulWidget {
  const OrganisasiAslabPage({super.key});

  @override
  State<OrganisasiAslabPage> createState() => _OrganisasiAslabPageState();
}

class _OrganisasiAslabPageState extends State<OrganisasiAslabPage> {
  String _hoveredCard = '';

  final List<Map<String, String>> aslabList = [
    {
      'title': 'Asisten Lab Informatika',
      'subtitle':
          'Lab Informatika berfokus pada pengembangan perangkat lunak, jaringan komputer, dan kecerdasan buatan. Aslab membantu praktikum pemrograman, basis data, dan proyek IT.',
      'logoPath': 'assets/logos/info_lab.png',
    },
    {
      'title': 'Asisten Lab Elektro',
      'subtitle':
          'Mempelajari sistem kelistrikan, elektronika, dan robotika. Aslab Elektro membimbing praktikum rangkaian listrik, mikrokontroler, dan sistem telekomunikasi.',
      'logoPath': 'assets/logos/elektro_lab.png',
    },
    {
      'title': 'Asisten Lab Mesin',
      'subtitle':
          'Fokus pada desain mekanik, manufaktur, dan konversi energi. Aslab Mesin membantu praktikan dalam penggunaan mesin bubut, CNC, dan pengujian material.',
      'logoPath': 'assets/logos/mesin_lab.png',
    },
    {
      'title': 'Asisten Lab Kimia',
      'subtitle':
          'Melakukan penelitian dan praktikum terkait reaksi kimia, analisis bahan, dan biokimia. Aslab Kimia memastikan keselamatan dan prosedur praktikum berjalan lancar.',
      'logoPath': 'assets/logos/kimia_lab.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Asisten Laboratorium',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: aslabList.length,
          itemBuilder: (context, index) {
            final item = aslabList[index];
            final isHovered = _hoveredCard == item['title'];

            return MouseRegion(
              onEnter: (_) => setState(() => _hoveredCard = item['title']!),
              onExit: (_) => setState(() => _hoveredCard = ''),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                margin: const EdgeInsets.symmetric(vertical: 8),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: isHovered ? Colors.blue.shade50 : Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withValues(alpha: 0.1),
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  border: Border.all(
                    color: isHovered
                        ? Colors.blue.shade200
                        : Colors.grey.shade300,
                  ),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey.shade200,
                      radius: 30,
                      backgroundImage: AssetImage(item['logoPath']!),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['title']!,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            item['subtitle']!,
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 12),
                          TextButton(
                            style: TextButton.styleFrom(
                              // ... styling
                            ),
                            onPressed: () {
                              // --- NAVIGASI ---
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AslabDetailPage(
                                    // <-- TUJUAN
                                    title: item['title']!,
                                    logoPath: item['logoPath']!,
                                  ),
                                ),
                              );
                            },
                            child: Text(
                              'Lihat Detail',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.blue.shade700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
