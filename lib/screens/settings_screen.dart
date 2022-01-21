import 'package:flutter/material.dart';
import 'package:meals_flutter/components/main_drawer.dart';
import 'package:meals_flutter/models/settings.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen(this.settings, this.onSettingsChanged, {Key? key})
      : super(key: key);

  final Settings settings;
  final Function(Settings) onSettingsChanged;

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late Settings settings;

  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch(
      String title, String subTitle, bool value, Function(bool) onChanged) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subTitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged(settings);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Configurações',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _createSwitch(
                  "Sem Glúten",
                  'Só exibe refeições sem glúten.',
                  settings.isGlutenFree,
                  (newValue) =>
                      setState(() => settings.isGlutenFree = newValue),
                ),
                _createSwitch(
                  "Sem Lactose",
                  'Só exibe refeições sem lactose.',
                  settings.isLactoseFree,
                  (newValue) =>
                      setState(() => settings.isLactoseFree = newValue),
                ),
                _createSwitch(
                  "Vegana",
                  'Só exibe refeições veganas.',
                  settings.isVegan,
                  (newValue) => setState(() => settings.isVegan = newValue),
                ),
                _createSwitch(
                  "Vegetariana",
                  'Só exibe refeições vegetarianas.',
                  settings.isVegetarian,
                  (newValue) =>
                      setState(() => settings.isVegetarian = newValue),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
