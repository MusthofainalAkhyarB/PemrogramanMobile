import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Portofolio Flutter',
      debugShowCheckedModeBanner: false,
      home: PortfolioPage(),
    );
  }
}

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  _PortfolioPageState createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  int _selectedIndex = 1; // 0 for Profile, 1 for Home, 2 for About

  final List<Widget> _pages = [
    const ProfilePage(),
    const HomePage(),
    const AboutPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Portofolio'),
        centerTitle: true,
      ),
      body: _pages[_selectedIndex], // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person), // Profile
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home), // Home
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info), // About
            label: 'About',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue, // Change the selected item color
        onTap: (int index) {
          setState(() {
            _selectedIndex = index; // Update the selected index
          });
        },
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          SizedBox(height: 20), // Spacing
          CircleAvatar(
            radius: 60,
            backgroundImage: NetworkImage(
              'https://scontent.fcgk24-2.fna.fbcdn.net/v/t39.30808-6/283088108_7828136940537265_2274906450003938579_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeELqU_mky2qX8wStqTXpzWS4IH8wTrRsBvggfzBOtGwG6yqRCaHbyVz8z4V7ySfckVKHq24yr4bY3f4Di99MnxU&_nc_ohc=xfd_2vDS4vUAX88dugp&_nc_zt=23&_nc_ht=scontent.fcgk24-2.fna&oh=00_AfCfQ2rvglvUQMJVoLGSlVOZIs9q7PWJ3GdGMN3l8-R3xQ&oe=6537EB3F', // Ganti dengan URL gambar profil Anda
            ),
          ),
          SizedBox(height: 10), // Spacing
          Text(
            'Musthofainal Akhyar Banifade',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10), // Spacing
          Text(
            'Mahasiswa Teknik Informatika',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 20), // Spacing
          Text(
            'Riwayat Pekerjaan:',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '1. PT Gajah Tunggal, Tbk. - 2016 sampai sekarang',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(height: 20), // Spacing
          Text(
            'Riwayat Pendidikan:',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '1. Politeknik Gajah Tunggal - 2013 sampai 2016',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          Text(
            '2. Universitas Esa Unggul - 2020 sampai sekarang',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          // Tambahkan daftar pekerjaan sesuai kebutuhan Anda
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Selamat datang di portfolio saya',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 20), // Spacing
          Image.network(
            'https://sekawantriasa.com/wp-content/uploads/2021/08/Esa-Unggul-Tangerang.jpg', // Ganti dengan URL gambar untuk halaman About Anda
            width: 400, // Sesuaikan lebar gambar sesuai kebutuhan Anda
            height: 400, // Sesuaikan tinggi gambar sesuai kebutuhan Anda
          ),
          const SizedBox(height: 10), // Spacing
          const Text(
            'Universitas Esa Unggul',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10), // Spacing
          const Text(
            'Tangerang, Indonesia',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
