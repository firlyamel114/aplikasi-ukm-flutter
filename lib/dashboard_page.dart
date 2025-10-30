import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget{
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 20),

            //header untuk SELAMAT DATANG, IKON PROFIL, dan NAMA MAHASISWA
            _buildHeader(),
            const SizedBox(height: 20),

            //card untuk menampilkan jumlah organisasi (row dan expanded)
            _buildCardStatistikOrganisasi(),
            const SizedBox(height: 20),

            //button kategori organisasi
            _buildKategori(),
            const SizedBox(height: 20),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Apa itu Organisasi Internal, Otonom, dan Aslab?",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Geist'),
                ), 
              ),
              const SizedBox(height: 10),
              _buildDeskripsiUmum(
                'Organisasi Internal', 'Organisasi Internal UMSIDA adalah wadah utama bagi mahasiswa untuk mengembangkan minat, bakat, dan kemampuan kepemimpinan di luar kegiatan akademik, yang secara garis besar terbagi menjadi dua jenis entitas penting: Unit Kegiatan Mahasiswa (UKM) yang fokus pada pengembangan Minat dan Bakat (seperti UKM Kewirausahaan, Futsal, Teater, Seni, dan Olahraga lainnya), serta Organisasi Pemerintahan Mahasiswa (Ormawa) yang fokus pada pengembangan Kepemimpinan dan Administrasi, meliputi Himpunan Mahasiswa Program Studi/Jurusan (HIMA), Badan Eksekutif Mahasiswa (BEM), dan Dewan Perwakilan Mahasiswa (DPM) Universitas/Fakultas.'),
              _buildDeskripsiUmum(
                'Organisasi Otonom Muhammadiyah (Ortom)', 'ORTOM adalah organisasi yang didirikan dan dinaungi langsung oleh Persyarikatan Muhammadiyah untuk menjalankan misi dakwah dan kaderisasi. Di UMSIDA, organisasi ini berperan sebagai sarana mahasiswa untuk memperdalam pemahaman keislaman, berkhidmat kepada masyarakat, dan membentuk karakter kader.'
              ),
              _buildDeskripsiUmum(
                'Asisten Laboratorium', 'Asisten Laboratorium adalah kelompok mahasiswa terpilih yang secara fungsional membantu kegiatan operasional dan praktikum di bawah Kepala Laboratorium pada masing-masing program studi/jurusan. Tugas utama Aslab mencakup persiapan alat dan bahan, mendampingi praktikum, serta pemeliharaan fasilitas laboratorium. Peran ini adalah jalur bagi mahasiswa untuk mendapatkan pengalaman teknis mendalam dan mengembangkan keahlian di bidang akademik spesifik.'
              ),
          ],
        ),
      ),
    );
  }
}


//Widget method untuk header
Widget _buildHeader(){
  return Padding(
    padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const[
            Text(
              'Selamat Datang!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              'Muhammad Vilary Bustomy',
              style: TextStyle(color: Colors.blueGrey),
            )
          ],
        ),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 1.5)
          ),
          child: const Icon(Icons.person_outline, size: 30),
        )
      ],
    ),
    );
}
// --- WIDGET METHOD: STATISTIK CARDS (ROW + EXPANDED) ---
  Widget _buildCardStatistikOrganisasi() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
      
        children: <Widget>[
    
          Expanded(
            flex: 1, 
            child: _buildStatCard('Organisasi Internal', '12'), 
          ),
          const SizedBox(width: 0), 

          Expanded(
            flex: 1, 
            child: _buildStatCard('Ortom', '5'), 
          ),
        ],
      ),
    );
  }

  // Widget Pembantu untuk Kartu Statistik
  Widget _buildStatCard(String title, String count) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Text(count,
                style: const TextStyle(
                    fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blueAccent)),
            const SizedBox(height: 5),
            Text(title, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }

  // --- WIDGET METHOD: TOMBOL KATEGORI (ROW) ---
  Widget  _buildKategori() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          // Kita hanya memanggil widget Icon, tidak perlu GestureDetector
          _CategoryIcon('Internal', Icons.account_balance),
          _CategoryIcon('Ortom', Icons.group),
          _CategoryIcon('Aslab', Icons.science),
        ],
      ),
    );
  }

  // Widget Pembantu untuk Ikon Kategori (Tanpa state/interaksi)
  Widget _buildDeskripsiUmum(String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
      child: Card(
        elevation: 1,
        child: ExpansionTile(
          title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(description),
            ),
          ],
        ),
      ),
    );
  }

// Widget Category Icon sebagai Stateless Widget sederhana
class _CategoryIcon extends StatelessWidget {
  final String label;
  final IconData icon;

  const _CategoryIcon(this.label, this.icon);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, size: 30),
        ),
        const SizedBox(height: 5),
        Text(label),
      ],
    );
  }
}