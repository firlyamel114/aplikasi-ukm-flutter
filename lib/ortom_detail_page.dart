import 'package:flutter/material.dart';

class OrtomDetailPage extends StatelessWidget {
  final String title;
  final String logoPath;

  const OrtomDetailPage({
    super.key,
    required this.title,
    required this.logoPath,
  });

  final String sejarah =
      'Gerakan Kepanduan Hizbul Wathan (HW) adalah organisasi kepanduan otonom di bawah Persyarikatan Muhammadiyah yang didirikan pada tahun 1918 oleh KH. Ahmad Dahlan dengan nama awal Padvinder Muhammadiyah. HW bertujuan mendidik anak, remaja, dan pemuda agar beriman, berakal budi, berilmu, berteknologi, dan berakhlak mulia, dengan nama "Hizbul Wathan" yang berarti "pembela tanah air" diubah pada tahun 1924. Setelah sempat dilebur ke dalam Gerakan Pramuka pada tahun 1961, HW dihidupkan kembali pada tahun 1999.';
  final String kegiatan = '''
  Kegiatan HW meliputi:
  • Pendidikan dan pelatihan kepanduan untuk anak, remaja, dan pemuda muslim.
  • Pengembangan rasa cinta dan setia kepada persyarikatan (Muhammadiyah) dan bangsa.
  • Penanaman nilai-nilai karakter utama seperti religius, disiplin, tanggung jawab, dan peduli lingkungan.
  • Menggunakan metode yang menarik, menyenangkan, dan menantang untuk membentuk watak anggotanya.
  ''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Kita tambahkan AppBar agar bisa kembali
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
                    radius: 40, // Sedikit lebih besar dari di list
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
                          // --- PERUBAHAN DIMULAI DI SINI ---
                          onPressed: () {
                            // Menampilkan dialog popup
                            showDialog(
                              context: context,
                              builder: (BuildContext dialogContext) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  title: const Text('Pendaftaran Berhasil!'),
                                  content: const Text(
                                    'Selamat, Anda menjadi calon kader ortom 🔥',
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
                          // --- PERUBAHAN BERAKHIR DI SINI ---
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
              const SizedBox(height: 24), // Jarak
              // --- Bagian Sejarah ---
              const Text(
                'Sejarah singkat',
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
                  sejarah, // Menggunakan teks placeholder
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade700,
                    height: 1.5, // Jarak antar baris
                    fontFamily: 'Geist',
                  ),
                ),
              ),
              const SizedBox(height: 24), // Jarak
              // --- Bagian kegiatan ---
              const Text(
                'Kegiatan',
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
                  kegiatan, // Menggunakan teks placeholder
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
