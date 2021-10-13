import 'package:flutter/material.dart';
import 'dart:math';

class GridTemp extends StatefulWidget {
  const GridTemp({Key? key}) : super(key: key);

  @override
  _GridTempState createState() => _GridTempState();
}

class Area {
  late int index;
  late String name;
  late Color color;

  Area({this.index = -1, this.name = 'AREA', this.color = Colors.blueAccent});
}

class _GridTempState extends State<GridTemp> {
  late int _location;
  late List<Area> _areas;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _areas = <Area>[];
    for (int i = 0; i < 16; i++) {
      _areas.add(Area(index: i, name: 'Area $i'));
    }

    var rng = Random();
    _location = rng.nextInt(_areas.length);
  }

  Widget _generate(int index) {
    return GridTile(
      child: Container(
        padding: const EdgeInsets.all(5.0),
        child: RaisedButton(
          onPressed: () => _onPressed(index),
          color: _areas[index].color,
          child: Text(
            _areas[index].name,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  void _onPressed(int index) {
    setState(() {
      if (index == _location) {
        _areas[index].color = Colors.green;
      } else {
        _areas[index].color = Colors.red;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GRIDVIEW'),
        centerTitle: true,
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 4,
          children: List.generate(16, (_generate)),
        ),
      ),
    );
  }
}
