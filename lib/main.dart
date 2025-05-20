import 'package:flutter/material.dart';
import 'package:training_dz/models/cake.model.dart';

void main() {
  runApp(const CakeApp());
}

class CakeApp extends StatelessWidget {
  const CakeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cake App',
      theme: ThemeData(fontFamily: 'Roboto'),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CakeModel> cakes = [];

  Future<List<CakeModel>> fetchCakes() async {
    await Future.delayed(Duration(seconds: 5));

    setState(() {
      cakes = [
        // database, api call,
        CakeModel(
          name: "Chocolate Icing Cake",
          price: 9.99,
          imageUrl:
              "https://cdn.pixabay.com/photo/2015/03/27/04/55/cupcake-694328_1280.jpg",
        ),
        CakeModel(
          name: "Black Forest Icing Cake",
          price: 5.12,
          imageUrl:
              "https://cdn.pixabay.com/photo/2020/03/10/03/49/red-velvet-cake-4917734_1280.jpg",
        ),
      ];
    });

    return cakes;
  }

  @override
  void initState() {
    cakes = [
      CakeModel(
        name: "Happy Birthday Icing Cake",
        price: 4.29,
        imageUrl:
            "https://cdn.pixabay.com/photo/2017/03/14/05/49/small-cake-2142072_1280.jpg",
      ),
      CakeModel(
        name: "Wedding Cakes Customized",
        price: 6.48,
        imageUrl:
            "https://cdn.pixabay.com/photo/2017/06/27/14/41/cake-2447535_1280.jpg",
      ),
      CakeModel(
        name: " Red velvet cake",
        price: 10.20,
        imageUrl:
            "https://cdn.pixabay.com/photo/2019/01/28/10/08/red-velvet-cake-3960016_1280.jpg",
      ),
      CakeModel(
        name: "Cup cakes",
        price: 4.70,
        imageUrl:
            "https://cdn.pixabay.com/photo/2017/01/09/16/37/cup-cakes-1966958_1280.jpg",
      ),
    ];

    print(cakes.length);
    super.initState();
  }

  void deleteCake({required int index}) {
    setState(() {
      cakes.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      endDrawer: Container(
        color: Colors.white,
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage:
                  Image.asset(
                    "assets/images/camel.jpg",
                    fit: BoxFit.cover,
                  ).image,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Monica",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Edit my profile",
                  style: TextStyle(color: Colors.black, fontSize: 12),
                ),
              ],
            ),
            // const Spacer(),
            // Icon(Icons.menu, color: Colors.black),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 80,

        title: Row(
          children: [
            CircleAvatar(
              backgroundImage:
                  Image.asset(
                    "assets/images/camel.jpg",
                    fit: BoxFit.cover,
                  ).image,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Hi, Monica",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Find and Get Your Best Cake",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
            // const Spacer(),
            // Icon(Icons.menu, color: Colors.black),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: const Icon(Icons.search),
                      fillColor: Colors.grey[200],
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Icon(Icons.tune, color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 20),

            const Text(
              "Browse By Category",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 10),

            Row(
              children: [
                _buildCategoryChip("Cake", isSelected: true),
                _buildCategoryChip("Donuts"),
                _buildCategoryChip("Cookies"),
              ],
            ),
            const SizedBox(height: 20),
            TextButton(onPressed: () => fetchCakes(), child: Text('Refresh')),
            Expanded(
              child: GridView.builder(
                itemCount: cakes.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                      MediaQuery.of(context).size.width > 500 ? 4 : 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemBuilder:
                    (context, index) => GestureDetector(
                      onTap: () => print('index: $index'),
                      onDoubleTap: () => deleteCake(index: index),
                      child: CakeCard(
                        name: cakes[index].name,
                        price: cakes[index].price,
                        imageUrl: cakes[index].imageUrl,
                      ),
                    ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.store), label: "Shop"),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Person",
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryChip(String label, {bool isSelected = false}) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.orange : Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          if (isSelected) const Icon(Icons.cake, color: Colors.white, size: 16),
          if (isSelected) const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(color: isSelected ? Colors.white : Colors.black),
          ),
        ],
      ),
    );
  }
}

class CakeCard extends StatelessWidget {
  final String name;
  final double price;
  final String imageUrl;
  final int? tva;

  const CakeCard({
    super.key,
    this.tva,
    required this.name,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: Image.network(
              imageUrl,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.bold),
              maxLines: 2,
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "\$${price.toStringAsFixed(2)}",
                  style: const TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.add, color: Colors.white, size: 16),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
