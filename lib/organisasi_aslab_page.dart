import 'package:flutter/material.dart';
import 'package:ukm_app/aslab_detail_page.dart';

class OrganisasiAslabPage extends StatefulWidget {
  const OrganisasiAslabPage({super.key});

  @override
  State<OrganisasiAslabPage> createState() => _OrganisasiAslabPageState();
}

class _OrganisasiAslabPageState extends State<OrganisasiAslabPage> {
  String _hoveredCard = '';

  final List<Map<String, String>> ortomList = [
    {
      'title': 'Aslab Teknik Elektro',
      'subtitle':
          'Asisten Laboratorium yang bertugas memelihara, mendukung, serta membantu kegiatan Akademik dalam lingkungan Laboratorium di Program Studi Informatika UMSIDA',
      'logoPath': 'assets/logos/elektro.png',
    },
    {
      'title': 'Aslab Informatika',
      'subtitle':
          'Asisten Laboratorium yang bertugas memelihara, mendukung, serta membantu kegiatan Akademik dalam lingkungan Laboratorium di Program Studi Informatika UMSIDA',
      'logoPath': 'assets/logos/aslab.png',
    },
    {
      'title': 'Aslab Teknik Mesin',
      'subtitle':
          'Asisten Laboratorium yang bertugas memelihara, mendukung, serta membantu kegiatan Akademik dalam lingkungan Laboratorium di Program Studi Informatika UMSIDA',
      'logoPath': 'assets/logos/mesin.jfif',
    },
    {
      'title': 'Aslab Teknik Industri',
      'subtitle':
          'Asisten Laboratorium yang bertugas memelihara, mendukung, serta membantu kegiatan Akademik dalam lingkungan Laboratorium di Program Studi Informatika UMSIDA',
  'logoPath': 'assets/logos/hmti.png',
    },
    {
      'title': 'Aslab Agroteknologi',
      'subtitle':
          'Asisten Laboratorium yang bertugas memelihara, mendukung, serta membantu kegiatan Akademik dalam lingkungan Laboratorium di Program Studi Informatika UMSIDA',
      'logoPath': 'assets/logos/himagro.jfif',
    },
    {
      'title': 'Aslab Teknologi Pangan',
      'subtitle':
          'Asisten Laboratorium yang bertugas memelihara, mendukung, serta membantu kegiatan Akademik dalam lingkungan Laboratorium di Program Studi Informatika UMSIDA',
      'logoPath': 'assets/logos/himatekpang.jpeg',
    },
    {
      'title': 'Aslab Teknik Sipil',
      'subtitle':
          'Asisten Laboratorium yang bertugas memelihara, mendukung, serta membantu kegiatan Akademik dalam lingkungan Laboratorium di Program Studi Informatika UMSIDA',
      'logoPath': 'assets/logos/HW_Umsida.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Asisten Laboratorium UMSIDA',
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
          itemCount: ortomList.length,
          itemBuilder: (context, index) {
            final item = ortomList[index];
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
                      backgroundColor: Colors.grey.shade200, // Fallback color
                      radius: 30, // Radius 30 (dari permintaan sebelumnya)
                      backgroundImage: AssetImage(
                        item['logoPath']!,
                      ), // Muat gambar
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
                          // --- TOMBOL BARU DITAMBAHKAN DI SINI ---
                          const SizedBox(height: 12), // Beri jarak
                          TextButton(
                            style: TextButton.styleFrom(
                              // ... styling Anda
                            ),
                            onPressed: () {
                              // --- UBAH BAGIAN INI ---
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AslabDetailPage(
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
                          // --- BATAS PENAMBAHAN TOMBOL ---
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
