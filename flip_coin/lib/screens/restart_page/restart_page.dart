import 'package:flutter/material.dart';

class RestartPage extends StatefulWidget {
  const RestartPage({ Key? key }) : super(key: key);

  @override
  _RestartPageState createState() => _RestartPageState();
}

class _RestartPageState extends State<RestartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          Text('Tela 2')
        ],
      )
    );
  }
}