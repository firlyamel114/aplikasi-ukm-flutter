import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Page typography using Google Fonts
final TextStyle _kTitleStyle = GoogleFonts.poppins(
  fontWeight: FontWeight.w700,
  fontSize: 22,
);

final TextStyle _kSectionTitleStyle = GoogleFonts.poppins(
  fontWeight: FontWeight.w600,
  fontSize: 18,
);

final TextStyle _kButtonTextStyle = GoogleFonts.poppins(
  fontSize: 14,
  fontWeight: FontWeight.w600,
);

final TextStyle _kBodyStyle = GoogleFonts.openSans(
  fontSize: 14,
  height: 1.5,
  color: const Color(0xFF616161), // approx Colors.grey.shade700
);

class AslabDetailPage extends StatelessWidget {
  final String title;
  final String logoPath;

  const AslabDetailPage({
    super.key,
    required this.title,
    required this.logoPath,
  });

  final String deskripsi =
      'Asisten Laboratorium (Aslab) adalah mahasiswa yang bertugas membantu dosen dan laboran dalam mengelola kegiatan praktikum di laboratorium. Posisi ini penting untuk memastikan kelancaran praktikum, membimbing praktikan (mahasiswa lain), serta merawat peralatan dan infrastruktur lab. Menjadi aslab adalah kesempatan untuk memperdalam ilmu, melatih kepemimpinan, dan berkontribusi pada almamater.';

  final String tugas = '''
  Tugas & Tanggung Jawab Aslab meliputi:
  • Membantu dosen mempersiapkan materi dan alat untuk praktikum.
  • Mendampingi dan membimbing mahasiswa (praktikan) saat pelaksanaan praktikum.
  • Menjelaskan prosedur penggunaan alat dan keselamatan kerja di lab.
  • Bertanggung jawab atas inventarisasi dan perawatan alat-alat laboratorium.
  • Membantu dalam penilaian awal laporan atau tugas praktikum.
  • Menjaga kebersihan dan ketertiban laboratorium.
  ''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- Bagian Header (Logo, Judul, Tombol Daftar) ---
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(logoPath),
                    backgroundColor: Colors.grey.shade200,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: _kTitleStyle,
                        ),
                        const SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext dialogContext) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  title: const Text('Pendaftaran Berhasil!'),
                                  content: const Text(
                                    'Selamat, Anda terdaftar sebagai calon Asisten Lab! 🔬',
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text('OK'),
                                      onPressed: () {
                                        Navigator.of(dialogContext).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue.shade700,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            textStyle: _kButtonTextStyle,
                          ),
                          child: const Text('Daftar sekarang'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // --- Bagian Deskripsi ---
              Text(
                'Deskripsi',
                style: _kSectionTitleStyle,
              ),
              const SizedBox(height: 8),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  deskripsi,
                  style: _kBodyStyle,
                ),
              ),
              const SizedBox(height: 24),

              // --- Bagian Tugas ---
              Text(
                'Tugas & Tanggung Jawab',
                style: _kSectionTitleStyle,
              ),
              const SizedBox(height: 8),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  tugas,
                  style: _kBodyStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
