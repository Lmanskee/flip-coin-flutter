import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class FlipCoinPage extends StatefulWidget {
  const FlipCoinPage({ Key? key }) : super(key: key);

  @override
  _FlipCoinPageState createState() => _FlipCoinPageState();
}

class _FlipCoinPageState extends State<FlipCoinPage> { 
  late Artboard _artboard;
  late RiveAnimationController _controller;

  @override
  void initState() {
    _loadRiveFile();
    super.initState();
  }

  void _loadRiveFile() async {
    final bytes = await rootBundle.load('assets/coinflip.riv');
    final file = RiveFile.import(bytes);

    setState(() {
      _artboard = file.mainArtboard;
    });
  }

  void _coinFlipReturnS() async {
    _artboard.addController(
      _controller = SimpleAnimation('CoinFlipReturnS'),
    );
    setState(() => _controller.isActive = true);
  }

  void _coinFlipReturnC() async {
    _artboard.addController(
      _controller = SimpleAnimation('CoinFlipReturnC'),
    );
    setState(() => _controller.isActive = true);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 250,
            child: _artboard != null
                ? Rive(
                    artboard: _artboard,
                    fit: BoxFit.cover,
                  )
                : Container()),
        TextButton(onPressed: () => _coinFlipReturnS(), child: Text('Return C')),
        TextButton(onPressed: () => _coinFlipReturnC(), child: Text('Return S'))
      ],
    );
  }
}