import 'dart:convert';

import 'package:endlesslist/networking.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Widget mainWidget() {
  return materialCard();
}

Widget gridView() {
  return GridView.extent(
    maxCrossAxisExtent: 150,
    padding: const EdgeInsets.all(4),
    mainAxisSpacing: 4,
    crossAxisSpacing: 4,
    children: _buildGridList(25),
  );
}

Widget materialCard() {
  return SizedBox(
    height: 240,
    child: Card(
      child: Column(
        children: [
          ListTile(
            title: Text(
              "Danke fürs zusehen",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle: FutureBuilder<http.Response>(
              future: fetchBitcoinPrice(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  int statusCode = snapshot.data!.statusCode;
                  if(statusCode == 200) {
                    BitcoinPrice price = BitcoinPrice.fromJson(jsonDecode(snapshot.data!.body));
                    return Text("${price.EUR} ${price.USD}");
                  }
                  return Text('$statusCode');
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }

                return CircularProgressIndicator();
              },
            ),
            leading: Icon(Icons.star_rate, color: Colors.blue),
          ),
          Divider()
        ],
      ),
    ),
  );
}

List<Widget> _buildGridList(int i) => List.generate(
    i,
    (index) => Stack(alignment: Alignment(0, 0.8), children: [
          CircleAvatar(
            backgroundImage: NetworkImage('https://picsum.photos/150/'),
            radius: 150,
          ),
          Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.black38,
              ),
              child: Text("text",
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)))
        ]));

Widget container() {
  return Expanded(
      child: Container(
    decoration: BoxDecoration(
      color: const Color(0xCDBF6B6B),
      border: Border.all(
        color: const Color(0xFF000000),
        width: 3,
      ),
      borderRadius: BorderRadius.circular(4),
    ),
    child: Image.network('https://picsum.photos/100'),
    margin: const EdgeInsets.all(4),
  ));
}
