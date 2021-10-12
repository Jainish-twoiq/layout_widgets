import 'package:flutter/material.dart';

class TabBarTemp extends StatefulWidget {
  const TabBarTemp({Key? key}) : super(key: key);

  @override
  _TabBarTempState createState() => _TabBarTempState();
}

class Choice {
  final String title;
  final IconData icon;

  Choice({ required this.title,  required this.icon});
}

class _TabBarTempState extends State<TabBarTemp>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  final List<Choice> _items = <Choice>[
    Choice(title: 'CAR', icon: Icons.directions_car),
    Choice(title: 'BICYCLE', icon: Icons.directions_bike),
    Choice(title: 'BOAT', icon: Icons.directions_boat),
    Choice(title: 'BUS', icon: Icons.directions_bus),
    Choice(title: 'TRAIN', icon: Icons.directions_train),
    Choice(title: 'WALK', icon: Icons.directions_walk),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: _items.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Tab Bar View'),
          centerTitle: true,
          bottom: PreferredSize(
            child: Theme(
              data: Theme.of(context).copyWith(colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white)),
              child: Container(
                height: 48.0,
                alignment: Alignment.center,
                child: TabPageSelector(
                  controller: _controller,
                ),
              ),
            ),
            preferredSize: const Size.fromHeight(48.0),
          ),
        ),
        body: TabBarView(
          controller: _controller,
          children: _items.map((Choice item) {
            return Container(
              padding: EdgeInsets.all(25.0),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Text(item.title),
                    Icon( item.icon,size: 120.0,)
                  ],
                ),
              ),
            );
          }).toList(),
        ));
  }
}
