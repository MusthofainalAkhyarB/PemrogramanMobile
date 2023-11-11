import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UTS Pemrograman Mobile',
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UTS Pemrograman Mobile'),
      ),
      body: _buildBody(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Pembelian',
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    switch (_currentIndex) {
      case 0:
        return const HomeScreenContent();
      case 1:
        return const SearchScreen();
      case 2:
        return const PembelianScreen(
          selectedItems: [],
        ); // Add the new screen here
      default:
        return Container(); // Handle other cases if needed
    }
  }
}

class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({Key? key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            Image.network(
              'https://i2.wp.com/abouttng.com/wp-content/uploads/2018/03/Pasar-Modern.jpg?fit=1920%2C1080',
              width: 800,
              height: 240,
              fit: BoxFit.cover,
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Pasar Modern Online',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Tangerang, Indonesia',
                    style: TextStyle(
                      color: Colors.blueAccent,
                    ),
                  ),
                  Text(
                    '\nPasar Modern Online adalah platform perdagangan elektronik yang memungkinkan konsumen untuk membeli berbagai jenis bahan pangan melalui aplikasi ini. Konsep ini kami gunakan seiring meningkatnya minat konsumen dalam berbelanja bahan pangan secara online.',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        // Add your existing widgets here
      ],
    );
  }
}

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<String> groceryItems = [
    'Beras',
    'Minyak',
    'Mie Instan',
    'Roti',
    'Telur',
    'Ikan',
    'Ayam',
    'Daging',
    'Bawang Putih',
    'Bawang Merah',
    'Bawang Bombay',
    'Cabai',
    'Merica',
    'Ketumbar',
    'Jahe',
    'Kunyit',
  ];

  Map<String, bool> checklist = {};
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    for (var item in groceryItems) {
      checklist[item] = false;
    }
  }

  List<String> _filterItems(String query) {
    if (query.isEmpty) {
      return groceryItems;
    } else {
      return groceryItems
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: searchController,
          onChanged: (value) {
            setState(() {
              // You can perform some filtering logic here if needed
            });
          },
          decoration: InputDecoration(
            labelText: 'Cari item...',
          ),
        ),
        Expanded(
          child: Scrollbar(
            child: ListView.builder(
              itemCount: _filterItems(searchController.text).length,
              itemBuilder: (context, index) {
                return CheckboxListTile(
                  title: Text(_filterItems(searchController.text)[index]),
                  value: checklist[_filterItems(searchController.text)[index]],
                  onChanged: (bool? value) {
                    setState(() {
                      checklist[_filterItems(searchController.text)[index]] =
                          value!;
                    });
                  },
                );
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            onPressed: () {
              // Get the selected items
              List<String> selectedItems = [];
              for (var item in groceryItems) {
                if (checklist[item] == true) {
                  selectedItems.add(item);
                }
              }

              // Navigate to PembelianScreen with selected items
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      PembelianScreen(selectedItems: selectedItems),
                ),
              );
            },
            child: Text('Beli'),
          ),
        ),
      ],
    );
  }
}

class PembelianScreen extends StatelessWidget {
  final List<String> selectedItems;

  const PembelianScreen({Key? key, required this.selectedItems})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Item yang dibeli:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            for (var item in selectedItems)
              Text(
                item,
                style: TextStyle(fontSize: 18),
              ),
          ],
        ),
      ),
    );
  }
}
