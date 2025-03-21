import 'package:flutter/material.dart';
import 'detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Halaman Utama')),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Nama dan Gambar Besar Artis
              const Center(
                child: Column(
                  children: [
                    Text(
                      'Radiohead',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Image(
                      image: AssetImage('assets/radiohead.jpeg'),
                      width: 300,
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Fitur FYI menggunakan CardView
              const Text('FYI', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 230,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildFYICard('assets/konser1.jpg', 'Konser Jakarta', '10 Jan 2024'),
                    _buildFYICard('assets/konser2.jpg', 'Konser Bandung', '5 Feb 2024'),
                    _buildFYICard('assets/konser3.jpg', 'Konser Surabaya', '12 Mar 2024'),
                    _buildFYICard('assets/konser4.jpg', 'Konser Semarang', '22 April 2024'),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Galeri menggunakan GridView (2x2)
              const Text('Galeri', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Padding(
                padding: const EdgeInsets.all(5),
                child: GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  children: [
                    _buildGalleryItem(context, 'assets/galeri.jpeg'),
                    _buildGalleryItem(context, 'assets/galeri.jpeg'),
                    _buildGalleryItem(context, 'assets/galeri.jpeg'),
                    _buildGalleryItem(context, 'assets/galeri.jpeg'),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Discography
              const Text('Discography', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Column(
                children: [
                  _buildDiscographyItem('assets/album1.jpeg', 'The Bends', '1995'),
                  _buildDiscographyItem('assets/album2.jpeg', 'OK Computer', '1997'),
                  _buildDiscographyItem('assets/album3.jpeg', 'Pablo Honey', '1993'),
                ],
              ),
              const SizedBox(height: 20),

              // Bio
              const Text('Bio', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Card(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.asset('assets/bio.jpg', width: 50, height: 50, fit: BoxFit.cover),
                  ),
                  title: const Text('Ridho Dwi Darma Putra'),
                  subtitle: const Text('Motto Hidup: Sing penting urip'),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // CardView untuk FYI
  Widget _buildFYICard(String imagePath, String title, String date) {
    return Card(
      color: Colors.black12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: const EdgeInsets.only(right: 10),
      child: SizedBox(
        width: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10),
                topLeft: Radius.circular(10),
              ),
              child: Image.asset(
                imagePath,
                height: 150,
                width: 200,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    date,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Item untuk Discography
  Widget _buildDiscographyItem(String imagePath, String title, String description) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Image.asset(
            imagePath,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(description),
      ),
    );
  }

  // Gambar di Galeri dengan navigasi ke halaman Detail
  Widget _buildGalleryItem(BuildContext context, String imagePath) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(imagePath: imagePath),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}