import 'package:flutter/material.dart';
import 'package:ukm_app/internal_detail_page.dart';
import 'organisasi_ortom_page.dart';
import 'organisasi_aslab_page.dart';
import 'organisasi_internal_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String _hoveredButton = '';
  String _clickedButton = '';

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

            // Penjelasan Umum
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Apa itu Organisasi Internal, Otonom, dan Aslab?",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Geist',
                ),
              ),
            ),
            const SizedBox(height: 10),
            _buildDeskripsiUmum(
              'Organisasi Internal',
              'Organisasi Internal UMSIDA adalah wadah utama bagi mahasiswa untuk mengembangkan minat, bakat, dan kemampuan kepemimpinan di luar kegiatan akademik, yang secara garis besar terbagi menjadi dua jenis entitas penting: Unit Kegiatan Mahasiswa (UKM) yang fokus pada pengembangan Minat dan Bakat (seperti UKM Kewirausahaan, Futsal, Teater, Seni, dan Olahraga lainnya), serta Organisasi Pemerintahan Mahasiswa (Ormawa) yang fokus pada pengembangan Kepemimpinan dan Administrasi, meliputi Himpunan Mahasiswa Program Studi/Jurusan (HIMA), Badan Eksekutif Mahasiswa (BEM), dan Dewan Perwakilan Mahasiswa (DPM) Universitas/Fakultas.',
            ),
            _buildDeskripsiUmum(
              'Organisasi Otonom Muhammadiyah (Ortom)',
              'ORTOM adalah organisasi yang didirikan dan dinaungi langsung oleh Persyarikatan Muhammadiyah untuk menjalankan misi dakwah dan kaderisasi. Di UMSIDA, organisasi ini berperan sebagai sarana mahasiswa untuk memperdalam pemahaman keislaman, berkhidmat kepada masyarakat, dan membentuk karakter kader.',
            ),
            _buildDeskripsiUmum(
              'Asisten Laboratorium',
              'Asisten Laboratorium adalah kelompok mahasiswa terpilih yang secara fungsional membantu kegiatan operasional dan praktikum di bawah Kepala Laboratorium pada masing-masing program studi/jurusan. Tugas utama Aslab mencakup persiapan alat dan bahan, mendampingi praktikum, serta pemeliharaan fasilitas laboratorium. Peran ini adalah jalur bagi mahasiswa untuk mendapatkan pengalaman teknis mendalam dan mengembangkan keahlian di bidang akademik spesifik.',
            ),
          ],
        ),
      ),
    );
  }

  //Widget method untuk header
  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Selamat Datang!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                'Muhammad Vilary Bustomy',
                style: TextStyle(color: Colors.blueGrey),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 1.5),
            ),
            child: const Icon(Icons.person_outline, size: 30),
          ),
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
          Expanded(flex: 1, child: _buildStatCard('Internal & UKM', '10')),
          const SizedBox(width: 0),

          Expanded(flex: 1, child: _buildStatCard('Ortom', '3')),

          Expanded(flex: 1, child: _buildStatCard('Aslab', '5')),
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
            Text(
              count,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 5),
            Text(title, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }

  // --- WIDGET METHOD: TOMBOL KATEGORI (ROW) ---
  Widget _buildKategori() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          // Hoverable category
          _buildHoverableCategory(
            label: 'Internal',
            icon: Icons.account_balance,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const InternalPage()),
              );
            },
            id: 'internal',
          ),

          // Ortom
          _buildHoverableCategory(
            label: 'Ortom',
            icon: Icons.group,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const OrganisasiOrtomPage(),
                ),
              );
            },
            id: 'ortom',
          ),

          // Aslab
          _buildHoverableCategory(
            label: 'Aslab',
            icon: Icons.science,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const OrganisasiAslabPage(),
                ),
              );
            },
            id: 'aslab',
          ),
        ],
      ),
    );
  }

  // Widget Pembantu untuk Ikon Kategori (Tanpa state/interaksi)
  Widget _buildHoverableCategory({
    required String label,
    required IconData icon,
    required VoidCallback onTap,
    required String id,
  }) {
    final bool isHovered = _hoveredButton == id;
    final bool isClicked = _clickedButton == id;

    return MouseRegion(
      onEnter: (_) => setState(() => _hoveredButton = id),
      onExit: (_) => setState(() => _hoveredButton = ''),
      child: GestureDetector(
        onTapDown: (_) => setState(() => _clickedButton = id),
        onTapUp: (_) => Future.delayed(const Duration(milliseconds: 100), () {
          setState(() => _clickedButton = '');
        }),
        onTapCancel: () => setState(() => _clickedButton = ''),
        onTap: onTap,
        child: Column(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeInOut,
              padding: const EdgeInsets.all(8),
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: isClicked
                    ? Colors.blue.withValues(
                        alpha: 0.10,
                      ) // light blue tint like ExpansionTile
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: isHovered ? Colors.blue : Colors.black,
                  width: 1,
                ),
                boxShadow: isClicked
                    ? [
                        BoxShadow(
                          color: Colors.blue.withValues(alpha: 0.15),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ]
                    : [],
              ),
              child: TweenAnimationBuilder<Color?>(
                tween: ColorTween(
                  begin: Colors.black,
                  end: isHovered ? Colors.blue : Colors.black,
                ),
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                builder: (context, color, _) =>
                    Icon(icon, size: 30, color: color),
              ),
            ),
            const SizedBox(height: 5),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeInOut,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: isHovered ? Colors.blue : Colors.black,
                fontFamily: 'Geist',
              ),
              child: Text(label),
            ),
          ],
        ),
      ),
    );
  }

  // --- DESKRIPSI UMUM ---
  Widget _buildDeskripsiUmum(String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
      child: Card(
        elevation: 1,
        child: ExpansionTile(
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
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
}
