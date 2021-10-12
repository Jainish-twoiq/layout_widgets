import 'package:flutter/material.dart';
import 'package:layout_widgets/tabbar.dart';

class ExpansionTemp extends StatefulWidget {
  const ExpansionTemp({Key? key}) : super(key: key);

  @override
  _ExpansionTempState createState() => _ExpansionTempState();
}

class MyItem {
  bool isExpanded;
  final String header;
  final Widget body;

  MyItem(this.isExpanded, this.header, this.body);
}

class _ExpansionTempState extends State<ExpansionTemp> {
  List<MyItem> _items = <MyItem>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 0; i <= 5; i++) {
      _items.add(MyItem(
          false,
          'Item ${i}',
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('Hello World'),
          )));
    }
  }

  ExpansionPanel _createitem(MyItem item) {
    return ExpansionPanel(
      headerBuilder: (BuildContext context, bool isExpanded) {
        return Container(
          padding: EdgeInsets.all(5.0),
          child: Text('Header ${item.header}'),
        );
      },
      body: item.body,
      isExpanded: item.isExpanded,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: ListView(
          children: <Widget>[
            ExpansionPanelList(
              expansionCallback: (int index, bool isExpanded) {
                setState(() {
                  _items[index].isExpanded = !_items[index].isExpanded;
                });
              },
              children: _items.map(_createitem).toList(),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ElevatedButton(
                        onPressed: () => Navigator.push(context,
                            MaterialPageRoute(builder: (_) => TabBarTemp())),
                        child: Text('Next'))
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
