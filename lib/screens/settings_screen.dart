import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_meals/widgets/drawer_screen.dart';

class SettingsScreen extends StatefulWidget {
  final Function saveFilter;
  final Map<String,bool> currentFilter;
  static const routeName = 'SettingsScreen';
  SettingsScreen(this.currentFilter,this.saveFilter);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool glutenFree = false;
  bool vegetarian = false;
  bool vegan = false;
  bool lactoseFree = false;

  @override
  void initState() {
    glutenFree = widget.currentFilter['gluten'];
    vegetarian = widget.currentFilter['lactose'];
    vegan = widget.currentFilter['vegan'];
    lactoseFree = widget.currentFilter['vegetarian'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.done),
            onPressed: () {

              final selectedFilters = {
                'gluten': glutenFree,
                'lactose': vegetarian,
                'vegan': vegan,
                'vegetarian': lactoseFree,
              };

              widget.saveFilter(selectedFilters);
            },
          )
        ],
      ),
      drawer: DraweScreen(),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 50,
            child: Center(
              child: Text(
                'Adjust your Meals selection',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
          ),
          SwitchWidget(
            swithValue: glutenFree,
            subtitle: 'Only include Gluten-free Meals',
            onChan: (bool value) {
              setState(() {
                glutenFree = value;
              });
            },
            title: 'Gluten-free',
          ),
          SwitchWidget(
            swithValue: vegetarian,
            subtitle: 'Only include Vegetarian Meals',
            onChan: (bool value) {
              setState(() {
                vegetarian = value;
              });
            },
            title: 'Vegetarian',
          ),
          SwitchWidget(
            swithValue: vegan,
            subtitle: 'Only include Vegan Meals',
            onChan: (bool value) {
              setState(() {
                vegan = value;
              });
            },
            title: 'Vegan',
          ),
          SwitchWidget(
            swithValue: lactoseFree,
            subtitle: 'Only include Lactose-free Meals',
            onChan: (bool value) {
              setState(() {
                lactoseFree = value;
              });
            },
            title: 'Lactose-free',
          ),
        ],
      ),
    );
  }
}

class SwitchWidget extends StatelessWidget {
  final bool swithValue;
  final Function onChan;
  final String title, subtitle;

  SwitchWidget(
      {@required this.title,
      @required this.subtitle,
      @required this.swithValue,
      @required this.onChan});

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      onChanged: onChan,
      value: swithValue,
    );
  }
}
