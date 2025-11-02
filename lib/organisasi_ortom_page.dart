import 'package:flutter/material.dart';
import 'ortom_detail_page.dart';

class OrganisasiOrtomPage extends StatefulWidget {
  const OrganisasiOrtomPage({super.key});

  @override
  State<OrganisasiOrtomPage> createState() => _OrganisasiOrtomPageState();
}

class _OrganisasiOrtomPageState extends State<OrganisasiOrtomPage> {
  String _hoveredCard = '';

  final List<Map<String, String>> ortomList = [
    {
      'title': 'Hizbul Wathan',
      'subtitle':
          'Gerakan Kepanduan Hizbul Wathan (HW) adalah organisasi kepanduan otonom di bawah Persyarikatan Muhammadiyah yang didirikan pada tahun 1918 oleh KH. Ahmad Dahlan dengan nama awal Padvinder Muhammadiyah',
      'logoPath': 'assets/logos/HW_Umsida.png',
    },
    {
      'title': 'Ikatan Mahasiswa Muhammadiyah',
      'subtitle':
          'Ikatan Mahasiswa Muhammadiyah (IMM) adalah gerakan mahasiswa Islam dan salah satu organisasi otonom Muhammadiyah yang lahir di Yogyakarta pada 14 Maret 1964 M atau 29 Syawal 1384 H.',
      'logoPath': 'assets/logos/imm.png',
    },
    {
      'title': 'Tapak Suci',
      'subtitle':
          'Tapak Suci Putera Muhammadiyah adalah sebuah perguruan pencak silat yang menjadi organisasi otonom di bawah naungan Persyarikatan Muhammadiyah. Organisasi ini berdiri pada 31 Juli 1963 di Kauman, Yogyakarta, dan didasarkan pada ajaran Islam, bersumber dari Al-Quran dan As-Sunnah.',
      'logoPath': 'assets/logos/tapak_suci.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Organisasi Otonom Muhammadiyah',
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
              // --- GestureDetector SUDAH DIHAPUS ---
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
                                  builder: (context) => OrtomDetailPage(
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
