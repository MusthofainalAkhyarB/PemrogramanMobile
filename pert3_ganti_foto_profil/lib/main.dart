import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

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

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _image;

  Future<void> _getImage(ImageSource source) async {
    final pickedImage = await ImagePicker().getImage(source: source);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 20), // Spacing
          GestureDetector(
            onTap: () {
              // Show options to select an image from the camera or gallery
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    height: 120,
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: Icon(Icons.camera),
                          title: Text('Take a picture'),
                          onTap: () {
                            _getImage(ImageSource.camera);
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.photo_library),
                          title: Text('Select from gallery'),
                          onTap: () {
                            _getImage(ImageSource.gallery);
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            child: CircleAvatar(
              radius: 60,
              backgroundImage: _image != null
                  ? FileImage(_image!)
                      as ImageProvider<Object> // Cast to ImageProvider
                  : NetworkImage(
                      'https://lh3.googleusercontent.com/a/ACg8ocI5jrUlO_jNNFhhVGE62CW2blnIw6nzSmrmLJQNWvcavpc=s360-c-no',
                    ),
            ),
          ),

          SizedBox(height: 10), // Spacing
          SizedBox(height: 10), // Spacing
          Text(
            'Musthofainal Akhyar Banifade',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          // Job Experience
          SizedBox(height: 20),
          Text(
            'Job Experience:',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '1. Software Engineer at ABC Tech (2020 - 2022)',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          Text(
            '2. Frontend Developer at XYZ Inc. (2018 - 2020)',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          // ... (rest of your ProfilePage code)
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
