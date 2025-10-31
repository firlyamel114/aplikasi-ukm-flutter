import 'package:flutter/material.dart';

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
      'subtitle': 'dlaksjhdbkoasdkljsadkljasnlkdnasklj',
    },
    {
      'title': 'Ikatan Mahasiswa M',
      'subtitle': 'dlaksjhdbkoasdkljsadkljasnlkdnasklj',
    },
    {
      'title': 'Lazismu',
      'subtitle': 'dlaksjhdbkoasdkljsadkljsadkljasnlkdnasklj',
    },
    {
      'title': 'UKM Kewirausahaan',
      'subtitle': 'dlaksjhdbkoasdkljsadkljsadkljasnlkdnasklj',
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
              child: GestureDetector(
                onTap: () {
                  // no action for now
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
                        color: Colors.grey.withValues(alpha: 0.1),
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                    border: Border.all(
                      color: isHovered ? Colors.blue.shade200 : Colors.grey.shade300,
                    ),
                  ),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 20,
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
