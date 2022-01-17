import 'package:flutter/material.dart';

Widget superHeroDetails(String _superHeroName) {
  return Scaffold(
      appBar: AppBar(
        title: Text(_superHeroName),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.network('https://picsum.photos/100'),
                  Image.network('https://picsum.photos/100'),
                  Image.network('https://picsum.photos/100'),
                ]),
      ]));
}
