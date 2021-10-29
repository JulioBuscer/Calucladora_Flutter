import 'package:flutter/material.dart';

class Suma extends StatefulWidget {
  @override
  _SumaState createState() => _SumaState();
}

class _SumaState extends State<Suma> {
  final num1 = TextEditingController();
  final num2 = TextEditingController();
  double res = 0;
  String n1 = "";
  String n2 = "";
  int val = -1;
  String resultado = "";
  void operacion() {
    n1 = num1.text;
    n2 = num2.text;

    switch (val) {
      case 1:
        res = double.parse(n1) + double.parse(n2);
        setState(() {
          resultado = 'Suma: ' + res.toString();
        });
        break;
      case 2:
        res = double.parse(n1) - double.parse(n2);
        setState(() {
          resultado = 'Resta: ' + res.toString();
        });
        break;
      case 3:
        res = int.parse(n1) / int.parse(n2);
        setState(() {
          resultado = 'División: ' + res.toString();
        });
        break;
      case 4:
        res = double.parse(n1) * double.parse(n2);
        setState(() {
          resultado = 'Multiplicación: ' + res.toString();
        });
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    String rutaImagen = "assets/img/a.jpg";
    final card = Container(
        height: 160,
        width: 60,
        margin: EdgeInsets.only(
          top: 80,
          left: 20,
        ),
        decoration: BoxDecoration(
          image:
              DecorationImage(fit: BoxFit.cover, image: AssetImage(rutaImagen)),
          borderRadius: BorderRadius.all(Radius.circular(20)),
          shape: BoxShape.rectangle,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black,
              blurRadius: 15,
              offset: Offset(0, 7),
            ),
          ],
        ));

    return Scaffold(
        appBar: AppBar(
          title: Text('Suma'),
        ),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              child: card,
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: TextField(
                  controller: num1,
                  decoration: InputDecoration(
                    hintText: 'Ingrese el primer numero',
                  )),
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: TextField(
                  controller: num2,
                  decoration: InputDecoration(
                    hintText: 'Ingrese el segundo numero',
                  )),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ListTile(
                  title: Text("Sumar"),
                  leading: Radio(
                    value: 1,
                    groupValue: val,
                    onChanged: (value) {
                      setState(() {
                        val = int.parse(value.toString());
                      });
                    },
                    activeColor: Colors.brown[700],
                  ),
                ),
                ListTile(
                  title: Text("Restar"),
                  leading: Radio(
                    value: 2,
                    groupValue: val,
                    onChanged: (value) {
                      setState(() {
                        val = int.parse(value.toString());
                      });
                    },
                    activeColor: Colors.brown[700],
                  ),
                ),
                ListTile(
                  title: Text("Dividir"),
                  leading: Radio(
                    value: 3,
                    groupValue: val,
                    onChanged: (value) {
                      setState(() {
                        val = int.parse(value.toString());
                      });
                    },
                    activeColor: Colors.brown[700],
                  ),
                ),
                ListTile(
                  title: Text("Multiplicar"),
                  leading: Radio(
                    value: 4,
                    groupValue: val,
                    onChanged: (value) {
                      setState(() {
                        val = int.parse(value.toString());
                      });
                    },
                    activeColor: Colors.brown[700],
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: ElevatedButton(
                  child: Text(
                    'Calcular',
                    style: TextStyle(fontSize: 22),
                  ),
                  onPressed: () {
                    operacion();
                  }),
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: Text(
                'Resultado de la $resultado',
                style: TextStyle(fontSize: 22),
              ),
            )
          ],
        ));
  }
}
