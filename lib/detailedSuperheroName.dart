
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:super_hero/super_hero.dart';

import 'detailedSuperheroInfo.dart';
import 'layouts.dart';
import 'main.dart';

class SuperheroName extends State<SuperHeroNameGenerator> {
  final _superHeroNAmes = <String>[];
  final _hearted = <String>{};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome to Superhero Picker"),
      ),
      body: mainWidget() // _buildBody(),
    );
  }

  Widget _buildBody() {
    // Listview behavior is like it calls its item-builder every time the list scrolls.
    // "i" is the index of the current item
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemBuilder: (context, i) {
        // that every 2. element has a ------ line added to the listview.
        if (i.isOdd) {
          return Divider();
        }

        // ~/ does divide and round only integer.
        int zahl = i ~/ 2;
        int currentLenght = _superHeroNAmes.length;

        // in first un index is 0 and length is 0 => this leads to adding more values.
        if (zahl >= currentLenght) {
          _superHeroNAmes.addAll(_generateSuperhHeroNames());
        }

        // returns the current item
        return _buildRow(_superHeroNAmes[zahl]);
      },
    );
  }

  Widget _buildRow(String superHerName) {
    final _markedFav = _hearted.contains(superHerName);
    return ListTile(
      title: Text(superHerName),
      trailing: Icon(
        _markedFav ? Icons.favorite : Icons.favorite_border,
        color: _markedFav ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          _markedFav
              ? _hearted.remove(superHerName)
              : _hearted.add(superHerName);
        });
      },
      onLongPress: () {
        _pushExample(superHerName);
      },
    );
  }

  Iterable<String> _generateSuperhHeroNames() {
    //fills a list with size of "10" , each position is filled with a new value which comes from a function.
    List<String> myNames = List.generate(10, (_) => SuperHero.random());

    // very simple way:
    // List<String> myNames = [
    //   SuperHero.random(),
    //   SuperHero.random(),
    //   SuperHero.random(),
    //   SuperHero.random(),
    //   SuperHero.random(),
    //   SuperHero.random(),
    //   SuperHero.random(),
    //   SuperHero.random(),
    //   SuperHero.random(),
    //   SuperHero.random(),
    // ];
    return myNames;
  }

  void _pushExample(String superHerName) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (BuildContext context) {
        final _superHeroName = superHerName;
        return superHeroDetails(_superHeroName);
      }),
    );
  }
}