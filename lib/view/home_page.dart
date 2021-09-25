import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.themeChanged}) : super(key: key);

  final void Function(String themeName) themeChanged;

  @override
  // ignore: no_logic_in_create_state
  _HomePageState createState() => _HomePageState(themeChanged);
}

class _HomePageState extends State<HomePage> {
  _HomePageState(this.themeChanged);

  var themeName = 'Yaru-light';
  final void Function(String themeName) themeChanged;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('I Am Ubuntu'),
        centerTitle: true,
        leading: TextButton(
          child: Icon(themeName.contains('-light')
              ? Icons.dark_mode
              : Icons.light_mode),
          onPressed: () => {
            setState(() {
              if (themeName.contains('-light')) {
                themeName = 'Yaru-dark';
              } else if (themeName.contains('-dark')) {
                themeName = 'Yaru-light';
              }
              themeChanged(themeName);
            })
          },
        ),
      ),
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 1.5,
          width: MediaQuery.of(context).size.width / 1.5,
          child: const Image(image: AssetImage('images/logo_ubuntu.png')),
        ),
      ),
    );
  }
}
