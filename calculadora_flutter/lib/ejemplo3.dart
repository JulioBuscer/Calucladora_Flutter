import 'package:flutter/material.dart';

class Botones extends StatefulWidget {
  @override
  _BotonesState createState() => _BotonesState();
}

class _BotonesState extends State<Botones> {
  @override
  Widget build(BuildContext context) {
    final styleBotones = ElevatedButton.styleFrom(
      primary: Colors.purple,
      onPrimary: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Caja de Texto'),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20.0),
            child: TextButton(
              child: Text('Ingresar'),
              onPressed: () {},
            ),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: ElevatedButton(
              child: Text('Ingresar'),
              onPressed: () {},
            ),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: OutlinedButton(
              child: Text('Ingresar'),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
