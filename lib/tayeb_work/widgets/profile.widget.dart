import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      title: Text("Hello $name,", style: TextStyle(fontSize: 17)),
      subtitle: Text("boufarik city", style: TextStyle(fontSize: 14)),
      leading: CircleAvatar(radius: 24, backgroundImage: Image.asset("images/profile-pic.png").image),
    );
    // return Row(mainAxisAlignment: MainAxisAlignment.start, spacing: 25,
    //   children: [
    //   CircleAvatar (backgroundImage: Image.asset("assets/profile-pic.png"
    //   ).image),

    //   Column(crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       Text("tayeb otmane",
    //       style: Theme.of(context).textTheme.titleMedium),
    //       Text("boufarik city")
    //     ],
    //   )

    // ]);
  }
}
