
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountPage extends StatefulWidget {
  const CountPage({Key? key}) : super(key: key);

  @override
  State<CountPage> createState() => _CountPageState();
}

class _CountPageState extends State<CountPage> {
  @override
  Widget build(BuildContext context) {
    /*
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => Counter(),
        child: Column(
          children: const [
            Expanded(
              child: TopPanel(),
            ),
            Expanded(
              child: _BottomPanelState(),
            ),
          ],
        ),
      ),
    );
     */
  }
}

class TopPanel extends StatefulWidget {
  const TopPanel({Key? key}) : super(key: key);

  @override
  State<TopPanel> createState() => _TopPanelState();
}

class _TopPanelState extends State<TopPanel> {
  var _value = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink.withOpacity(0.3),
      child: Center(
          child: Text(
            _value.toString(),
            style: TextStyle(fontSize: 30.0),
          )),
    );
  }
}

class _BottomPanelState extends StatefulWidget {
  const _BottomPanelState({Key? key}) : super(key: key);

  @override
  State<_BottomPanelState> createState() => _BottomPanelStateState();
}

class _BottomPanelStateState extends State<_BottomPanelState> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.withOpacity(0.3),
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            setState(() {

            });
          },
          child: Text('COUNT UP'),
        ),
      ),
    );
  }
}
