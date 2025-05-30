import 'package:flutter/material.dart';
import "dart:math";
import 'package:rowbuilder/rowbuilder.dart';
import 'package:training_dz/tayeb_work/models/match.model.dart';
import 'package:training_dz/tayeb_work/widgets/cardtile.widget.dart';
import 'package:training_dz/tayeb_work/widgets/profile.widget.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key, required this.title, required this.name});

  final String title;
  final String name;

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late List<MatchModel> mylist = [];
  late List<String> titleList = [];
  late List<String> imageList = [];
  Random rand = Random();
  late int adder;
  bool isSelected = false;
  late List<String> availableTitles = [];
  int selectedPage = 0;

  @override
  void initState() {
    imageList = [
      "https://cdn.pixabay.com/photo/2019/01/24/09/37/football-stadium-3952062_960_720.jpg",
      "https://cdn.pixabay.com/photo/2020/01/12/16/57/stadium-4760441_1280.jpg",
      "https://cdn.pixabay.com/photo/2016/11/29/02/05/audience-1866738_1280.jpg",
      "https://cdn.pixabay.com/photo/2016/11/29/07/06/bleachers-1867992_1280.jpg",
      "https://cdn.pixabay.com/photo/2014/10/14/20/24/soccer-488700_1280.jpg",
    ];

    titleList = ["Boufarik", "Birtouta", "Khraicia", "Draria", "Cheraga", "Hydra", "Achour", "chebli"];

    adder = 0;

    mylist = [
      MatchModel(
        title: titleList[rand.nextInt(titleList.length)],
        image: imageList[rand.nextInt(imageList.length)],
        playerNum: rand.nextInt(7),
        isFavorite: false,
        isJoined: false,
      ),
      MatchModel(
        title: titleList[rand.nextInt(titleList.length)],
        image: imageList[rand.nextInt(imageList.length)],
        playerNum: rand.nextInt(7),
        isFavorite: false,
        isJoined: false,
      ),
      MatchModel(
        title: titleList[rand.nextInt(titleList.length)],
        image: imageList[rand.nextInt(imageList.length)],
        playerNum: rand.nextInt(7),
        isFavorite: false,
        isJoined: false,
      ),
      MatchModel(
        title: titleList[rand.nextInt(titleList.length)],
        image: imageList[rand.nextInt(imageList.length)],
        playerNum: rand.nextInt(7),
        isFavorite: false,
        isJoined: false,
      ),
      MatchModel(
        title: titleList[rand.nextInt(titleList.length)],
        image: imageList[rand.nextInt(imageList.length)],
        playerNum: rand.nextInt(7),
        isFavorite: false,
        isJoined: false,
      ),
      MatchModel(
        title: titleList[rand.nextInt(titleList.length)],
        image: imageList[rand.nextInt(imageList.length)],
        playerNum: rand.nextInt(7),
        isFavorite: false,
        isJoined: false,
      ),
      MatchModel(
        title: titleList[rand.nextInt(titleList.length)],
        image: imageList[rand.nextInt(imageList.length)],
        playerNum: rand.nextInt(7),
        isFavorite: false,
        isJoined: false,
      ),
      MatchModel(
        title: titleList[rand.nextInt(titleList.length)],
        image: imageList[rand.nextInt(imageList.length)],
        playerNum: rand.nextInt(7),
        isFavorite: false,
        isJoined: false,
      ),
    ];

    Future.delayed(Duration(seconds: 10));

    for (var i = 0; i < mylist.length; i++) {
      availableTitles.contains(mylist[i].title) ? availableTitles : availableTitles.add(mylist[i].title);
    }

    super.initState();
  }

  void updateIndex(int index) => setState(() {
    selectedPage = index;
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.stadium), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        currentIndex: selectedPage,
        onTap: updateIndex,
        selectedItemColor: Colors.blue,
      ),

      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
            child: IconButton(
              constraints: BoxConstraints.tight(Size.fromRadius(22)),
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              onPressed: () {},
              icon: Icon(Icons.menu),
            ),
          ),
        ],
        leadingWidth: 0,
        elevation: 4,
        title: ProfileWidget(name: widget.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: IconButton(onPressed: () {}, icon: Icon(Icons.logout)),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: SizedBox(
                    height: 42,
                    width: MediaQuery.of(context).size.width - 140,
                    child: SearchBar(
                      leading: Icon(Icons.search),
                      hintText: "Search",
                      padding: WidgetStatePropertyAll(EdgeInsets.fromLTRB(16, 0, 0, 0)),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(14, 10, 10, 10),
                  child: IconButton.filled(iconSize: 24, onPressed: () {}, icon: Icon(Icons.sort_sharp)),
                ),
              ],
            ),

            Positioned(
              right: 10,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 350, 10),
                child: Text(
                  "Browse By City",
                  style: TextStyle(color: Colors.black54, fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: RowBuilder(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                reversed: false,
                itemCount: availableTitles.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: FilterChip.elevated(
                      selectedColor: const Color.fromARGB(255, 105, 240, 109),
                      backgroundColor: const Color.fromARGB(181, 62, 164, 247),
                      label: Text(availableTitles[index]),
                      selected: isSelected,
                      onSelected: (bool value) {
                        setState(() {
                          isSelected = !isSelected;
                        });
                      },
                    ),
                  );
                },
              ),
            ),

            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.symmetric(vertical: 14, horizontal: 12),

                itemCount: mylist.length,

                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  mainAxisExtent: 200,
                  mainAxisSpacing: 24,
                ),

                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      IconButton(onPressed: () {}, icon: Icon(Icons.add)),

                      cardTileWidget(
                        title: mylist[index].title,
                        image: mylist[index].image,
                        playerNum: mylist[index].playerNum,
                        isFavorite: mylist[index].isFavorite,
                        isJoined: mylist[index].isJoined,
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
