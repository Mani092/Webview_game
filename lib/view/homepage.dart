import 'package:flutter/material.dart';


class Homepage extends StatelessWidget {
   Homepage({super.key});

  final List<String> dummyGames = [
    'Super Mario',
    'The Legend of Zelda',
    'Minecraft',
    'Call of Duty',
    'Fortnite',
    'Among Us',
    'League of Legends',
    'Dota 2',
    'Valorant',
    'Apex Legends',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dummy Game List',textAlign: TextAlign.center,),
      ),
      body: ListView.builder(
        itemCount: dummyGames.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(dummyGames[index],textAlign: TextAlign.center,),
          );
        },
      ),
    );
  }
}
