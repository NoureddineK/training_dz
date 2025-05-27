import 'package:flutter/material.dart';


class cardTileWidget extends StatefulWidget {
  const cardTileWidget({super.key, required this.title, required this.image, required this.playerNum, required this.isFavorite, required this.isJoined});



  final String title;
  final String image;
  final int playerNum;
  final bool isFavorite;
  final bool isJoined;


  @override
  State<cardTileWidget> createState() => _cardTileWidgetState();
}

class _cardTileWidgetState extends State<cardTileWidget> {

  late bool isFavorite;
  late bool isJoined;
  late int playerNum;
  late String btnText;
  late int adder;
  late Color colorCard;

  @override
  void initState() {

    isFavorite = widget.isFavorite;
    isJoined = widget.isJoined;
    playerNum = widget.playerNum;
    btnText = "Join in";
    adder = 0;
    colorCard = Color.fromARGB(255, 175, 182, 241);

    super.initState();
  }

  void updateFavorite() =>setState(() {
    isFavorite = !isFavorite;
  }); 

  void updateJoined() =>setState(() {
    isJoined = !isJoined;
    isJoined ? btnText = "Nice" : btnText = "Join in";
    isJoined ? ++adder : --adder;
    isJoined ? colorCard = Color.fromARGB(255, 144, 223, 71) : colorCard = Color.fromARGB(255, 175, 182, 241);
  }); 
  
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(24))),
      color: colorCard,
      shadowColor: const Color.fromARGB(255, 87, 98, 204),
      child: Stack(
        children: [
          Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
              child: Expanded(
                child: Image.network(
                  widget.image,
                  width: double.infinity,
                  height: 130,
                  fit: BoxFit.cover,
                   ),
              ),
            ),
            // Stack(
            //   children: [
            //     IconButton(iconSize: 24,
            //       onPressed: updateFavorite, icon: isPressed(fav: isFavorite), color: Colors.red,)
            //   ],
            // ),
            ListTile(
              contentPadding: EdgeInsets.fromLTRB(8, 0, 8, 0),
              // style: ListTileStyle.drawer,
              trailing: ElevatedButton.icon(
                style: ButtonStyle(
                  padding: WidgetStatePropertyAll(EdgeInsets.fromLTRB(8, 0, 8, 0)),
                  fixedSize: WidgetStatePropertyAll(Size.fromHeight(14))),
              autofocus: true,
              iconAlignment: IconAlignment.end,
              label: Text(btnText),
              onPressed: updateJoined, 
              icon: isPressed2(fav: isJoined),),
              dense: true,
              title: Text(widget.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            subtitle: Text("Players: ${widget.playerNum + adder} VS. ${widget.playerNum}"),
              ),
            ],
          ),
          Positioned(
            right: 10,
            top: 8,
            child: IconButton(
              style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.white)),
              constraints: BoxConstraints.tight(Size.fromRadius(14)),
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              hoverColor: Colors.white,
              iconSize: 24,
              onPressed: updateFavorite, 
              icon: isPressed(fav: isFavorite), 
              color: const Color.fromARGB(255, 151, 14, 5), 
              ),
          ),
          ],
      ),
    );
  }

}

Widget isPressed({required bool fav}) {
  return  Icon (fav ? Icons.favorite : Icons.favorite_border_outlined);
}

Widget isPressed2({required bool fav}) {
  return  Icon (fav ? Icons.check_circle_sharp : Icons.sports_soccer);
}



// https://cdn.pixabay.com/photo/2019/01/24/09/37/football-stadium-3952062_960_720.jpg
// https://cdn.pixabay.com/photo/2020/01/12/16/57/stadium-4760441_1280.jpg
// https://cdn.pixabay.com/photo/2016/11/29/02/05/audience-1866738_1280.jpg
// https://cdn.pixabay.com/photo/2016/11/29/07/06/bleachers-1867992_1280.jpg
// https://cdn.pixabay.com/photo/2014/10/14/20/24/soccer-488700_1280.jpg(),