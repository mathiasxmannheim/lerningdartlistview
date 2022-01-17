import 'package:flutter/material.dart';
import 'package:super_hero/super_hero.dart';

import 'detailedSuperheroName.dart';

// add to additional run tags  "--no-sound-null-safety" cause the superhero lib is unsafe.

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Superhero picker",
      home: SuperHeroNameGenerator(),
    );
  }
}

class SuperHeroNameGenerator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SuperheroName();
}
