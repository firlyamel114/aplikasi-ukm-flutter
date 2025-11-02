import 'package:flutter/material.dart';
import 'internal_detail_page.dart';

class InternalPage extends StatefulWidget {
  const InternalPage({super.key});

  @override
  State<InternalPage> createState() => _InternalPageState();
}

class _InternalPageState extends State<InternalPage> {
  String _hoveredCard = '';

  final List<Map<String, String>> internalList = [
    {
      'title': 'Himpunan Mahasiswa Teknologi Pangan',
      'subtitle':
          'HIMA berperan sebagai jembatan komunikasi antara mahasiswa dan pihak dosen/departemen, serta aktif menyelenggarakan kegiatan akademik maupun non-akademik, seperti seminar, pelatihan, dan kegiatan sosial, yang bertujuan memperkaya wawasan keilmuan dan mempererat tali persaudaraan antar anggota.',
      'logoPath': 'assets/logos/himatekpang.jpeg',
    },
    {
      'title': 'UKM Teater Gedhek',
      'subtitle':
          'Unit Kegiatan Mahasiswa (UKM) merupakan wadah bagi mahasiswa yang ingin meningkatkan minat dan bakat yang dimiliki guna mengembangkan potensi diri, memperluas wawasan, memperoleh pengalaman berorganisasi, dan berkontribusi secara positif kepada masyarakat dan kampus.',
      'logoPath': 'assets/logos/teater.jpeg',
    },
    {
      'title': 'Ikatan Band Mahasiswa UMSIDA',
      'subtitle':
          'Unit Kegiatan Mahasiswa (UKM) merupakan wadah bagi mahasiswa yang ingin meningkatkan minat dan bakat yang dimiliki guna mengembangkan potensi diri, memperluas wawasan, memperoleh pengalaman berorganisasi, dan berkontribusi secara positif kepada masyarakat dan kampus.',
      'logoPath': 'assets/logos/ikabama.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Organisasi Internal dan UKM UMSIDA',
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
          itemCount: internalList.length,
          itemBuilder: (context, index) {
            final item = internalList[index];
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
                                  builder: (context) => InternalDetailPage(
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
