import 'package:flutter/material.dart';

class AslabPage extends StatefulWidget {
  const AslabPage({super.key});

  @override
  State<AslabPage> createState() => _AslabPageState();
}

class _AslabPageState extends State<AslabPage> {
  String _hoveredCard = '';

  // Contoh data asisten/lab—silakan ganti sesuai kebutuhan
  final List<Map<String, String>> aslabList = [
    {
      'title': 'Asisten Lab Informatika',
      'subtitle': 'Fokus perangkat lunak, jaringan, dan sistem informasi.',
    },
    {
      'title': 'Asisten Lab Elektro',
      'subtitle': 'Rangkaian, mikrokontroler, dan instrumentasi.',
    },
    {
      'title': 'Asisten Lab Mesin',
      'subtitle': 'Manufaktur, CNC, dan material.',
    },
    {
      'title': 'Asisten Lab Kimia',
      'subtitle': 'Analisis, biokimia, dan keselamatan kerja.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aslab Page'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
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
              child: GestureDetector(
                onTap: () {
                  // Aksi saat diklik (misal: navigasi ke detail)
                  // Navigator.push(context, MaterialPageRoute(builder: (_) => DetailPage(item: item)));
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: isHovered ? Colors.blue.shade50 : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.12),
                        blurRadius: 6,
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
                      const CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.grey,
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
                          ],
                        ),
                      ),
                      const Icon(Icons.arrow_forward_ios_rounded, size: 16),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
