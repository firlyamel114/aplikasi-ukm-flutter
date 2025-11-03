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
      backgroundColor: Colors.grey.shade50,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 30),

            _buildHeader(),
            const SizedBox(height: 30),

            _buildCardStatistikOrganisasi(),
            const SizedBox(height: 30),

            _buildKategori(),
            const SizedBox(height: 30),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Apa itu Organisasi Internal, Otonom, dan Aslab?",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Geist',
                  color: Colors.grey.shade800,
                ),
              ),
            ),
            const SizedBox(height: 15),

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
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Selamat Datang!',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade800,
                ),
              ),
              const Text(
                'Muhammad Vilary Bustomy',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 1.5, color: Colors.grey.shade400),
            ),
            child: Icon(
              Icons.person_outline,
              size: 28,
              color: Colors.grey.shade700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCardStatistikOrganisasi() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: _buildStatCard(
              'Internal',
              '10',
              Colors.pink.shade100,
              Icons.people_alt_outlined,
            ),
          ),
          const SizedBox(width: 10),

          Expanded(
            flex: 1,
            child: _buildStatCard(
              'Ortom',
              '3',
              Colors.purple.shade100,
              Icons.school_outlined,
            ),
          ),
          const SizedBox(width: 10),

          Expanded(
            flex: 1,
            child: _buildStatCard(
              'Aslab',
              '5',
              Colors.green.shade100,
              Icons.science_outlined,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(
    String title,
    String count,
    Color bgColor,
    IconData icon,
  ) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(color: Colors.grey.shade200, width: 1),
      ),
      color: bgColor,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Icon(icon, size: 30, color: Colors.grey.shade700),
            const SizedBox(height: 10),
            Text(
              count,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade800,
                fontFamily: 'Geist',
              ),
            ),
            const SizedBox(height: 5),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildKategori() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _buildHoverableCategory(
            label: 'Internal',
            icon: Icons.business_outlined,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const InternalPage()),
              );
            },
            id: 'internal',
          ),
          _buildHoverableCategory(
            label: 'Ortom',
            icon: Icons.group_outlined,
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
          _buildHoverableCategory(
            label: 'Aslab',
            icon: Icons.biotech_outlined,
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
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOut,
              padding: const EdgeInsets.all(12),
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: isClicked
                    ? Colors.blue.shade100
                    : isHovered
                    ? Colors.blue.shade50
                    : Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: isHovered
                      ? Colors.blue.shade300
                      : Colors.grey.shade300,
                  width: 1,
                ),
                boxShadow: isClicked
                    ? [
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ]
                    : [],
              ),
              child: Icon(
                icon,
                size: 32,
                color: isHovered ? Colors.blue.shade600 : Colors.grey.shade700,
              ),
            ),
            const SizedBox(height: 8),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOut,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: isHovered ? Colors.blue.shade600 : Colors.grey.shade700,
                fontFamily: 'Geist',
              ),
              child: Text(label),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDeskripsiUmum(String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(color: Colors.grey.shade200, width: 1),
        ),
        color: Colors.white,
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          collapsedIconColor: Colors.grey.shade600,
          iconColor: Colors.blue.shade400,
          title: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade800,
              fontSize: 15,
            ),
          ),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 16.0),
              child: Text(
                description,
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
