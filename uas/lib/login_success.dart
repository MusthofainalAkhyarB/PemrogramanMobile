import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp1());
}

class MyApp1 extends StatefulWidget {
  MyApp1({Key? key}) : super(key: key);

  @override
  State<MyApp1> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp1> {
  int _currentIndex = 0;
  final List<Widget> _tabs = [
    MyProject001(title: 'Input Produk'),
    MyProject001(title: 'Input Kategori'),
    MyProject001(title: 'Input Tag'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('My App')),
        ),
        body: _tabs[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Produk',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Kategori',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_offer),
              label: 'Tag',
            ),
          ],
        ),
      ),
    );
  }
}

class MyProject001 extends StatelessWidget {
  final String title;

  MyProject001({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Check if the current page is 'Input Produk'
    if (title == 'Input Produk') {
      return InputProdukForm();
    }
    // Check if the current page is 'Input Kategori'
    else if (title == 'Input Kategori') {
      return InputKategoriForm();
    }
    // Check if the current page is 'Input Tag'
    else if (title == 'Input Tag') {
      return InputTagForm();
    }
    // For other pages, return an empty page
    else {
      return Scaffold();
    }
  }
}

class InputTagForm extends StatefulWidget {
  @override
  _InputTagFormState createState() => _InputTagFormState();
}

class _InputTagFormState extends State<InputTagForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController namaTagController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Tag'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: namaTagController,
                decoration: InputDecoration(labelText: 'Nama Tag'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a tag name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    // Process the form data, e.g., submit it to a server.
                    // You can access the input values using the controllers.
                    // For example:
                    // String namaTag = namaTagController.text;

                    // TODO: Add your logic here

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Form submitted successfully!'),
                      ),
                    );
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InputKategoriForm extends StatefulWidget {
  @override
  _InputKategoriFormState createState() => _InputKategoriFormState();
}

class _InputKategoriFormState extends State<InputKategoriForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController namaKategoriController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Kategori'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: namaKategoriController,
                decoration: InputDecoration(labelText: 'Nama Kategori'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a category name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    // Process the form data, e.g., submit it to a server.
                    // You can access the input values using the controllers.
                    // For example:
                    // String namaKategori = namaKategoriController.text;

                    // TODO: Add your logic here

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Form submitted successfully!'),
                      ),
                    );
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InputProdukForm extends StatefulWidget {
  @override
  _InputProdukFormState createState() => _InputProdukFormState();
}

class _InputProdukFormState extends State<InputProdukForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController slugController = TextEditingController();
  bool isActive = false;

  // Sample data for tags and categories
  List<String> tags = ['Tag1', 'Tag2', 'Tag3'];
  List<String> categories = ['Category1', 'Category2', 'Category3'];

  String selectedTag = 'Tag1'; // Change this to your desired default tag
  String selectedCategory =
      'Category1'; // Change this to your desired default category

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Produk'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: priceController,
                decoration: InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a price';
                  }
                  // You can add more specific validation for the price if needed.
                  return null;
                },
              ),
              TextFormField(
                controller: imageController,
                decoration: InputDecoration(labelText: 'Image'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an image URL';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: slugController,
                decoration: InputDecoration(labelText: 'Slug'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a slug';
                  }
                  return null;
                },
              ),
              Row(
                children: [
                  Checkbox(
                    value: isActive,
                    onChanged: (value) {
                      setState(() {
                        isActive = value ?? false;
                      });
                    },
                  ),
                  Text('Is Active'),
                ],
              ),
              SizedBox(height: 20),
              // Dropdown for selecting tags with default value
              DropdownButtonFormField<String>(
                value: selectedTag,
                onChanged: (value) {
                  setState(() {
                    selectedTag = value ?? '';
                  });
                },
                items: tags.map((tag) {
                  return DropdownMenuItem<String>(
                    value: tag,
                    child: Text(tag),
                  );
                }).toList(),
                decoration: InputDecoration(labelText: 'Tag'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a tag';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              // Dropdown for selecting categories with default value
              DropdownButtonFormField<String>(
                value: selectedCategory,
                onChanged: (value) {
                  setState(() {
                    selectedCategory = value ?? '';
                  });
                },
                items: categories.map((category) {
                  return DropdownMenuItem<String>(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                decoration: InputDecoration(labelText: 'Category'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a category';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    // Process the form data, e.g., submit it to a server.
                    // You can access the input values using the controllers.
                    // For example:
                    // String name = nameController.text;
                    // double price = double.parse(priceController.text);
                    // String image = imageController.text;
                    // String slug = slugController.text;
                    // bool isActive = this.isActive;
                    // String selectedTag = this.selectedTag;
                    // String selectedCategory = this.selectedCategory;

                    // TODO: Add your logic here

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Form submitted successfully!'),
                      ),
                    );
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
