import 'package:flutter/material.dart';

class InternalDetailPage extends StatelessWidget {
  final String title;
  final String logoPath;

  const InternalDetailPage({
    super.key,
    required this.title,
    required this.logoPath,
  });

  final String deskripsi =
      'Himpunan Mahasiswa (HIMA) adalah organisasi intra-kampus yang menjadi wadah aspirasi dan pengembangan diri bagi mahasiswa di lingkup program studi atau jurusan tertentu. HIMA berperan sebagai jembatan komunikasi antara mahasiswa dan pihak dosen/departemen, serta aktif menyelenggarakan kegiatan akademik maupun non-akademik, seperti seminar, pelatihan, dan kegiatan sosial, yang bertujuan memperkaya wawasan keilmuan dan mempererat tali persaudaraan antar anggota.';

  final String kegiatanDanbenefit = '''
Kegiatan & Benefit Himpunan Mahasiswa meliputi:
• Pengembangan Akademik: Mengadakan *workshop*, seminar, dan kursus untuk meningkatkan kompetensi keilmuan anggota.
• Benefit Organisasi: Memperoleh kesempatan melatih kepemimpinan, manajemen waktu, dan *soft skill* yang sangat berharga di dunia kerja.
• Program Kerja: Melaksanakan kegiatan yang relevan dengan jurusan, seperti kunjungan industri, bakti sosial, atau kompetisi tingkat regional.
• Jejaring (Networking): Memperluas koneksi dengan alumni, profesional, dan mahasiswa lintas angkatan/jurusan.
• Advokasi: Menjadi perwakilan mahasiswa untuk menyampaikan aspirasi atau masukan kepada pihak program studi.
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
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            fontFamily: 'Geist',
                          ),
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
                                    'Selamat, Anda terdaftar sebagai anggota Himpunan Mahasiswa A!',
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
              const Text(
                'Deskripsi',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  fontFamily: 'Geist',
                ),
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
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade700,
                    height: 1.5,
                    fontFamily: 'Geist',
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // --- Bagian Tugas ---
              const Text(
                'Kegiatan dan Benefit',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  fontFamily: 'Geist',
                ),
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
                  kegiatanDanbenefit,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade700,
                    height: 1.5,
                    fontFamily: 'Geist',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
