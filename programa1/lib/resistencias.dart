import 'dart:html';

import 'package:flutter/material.dart';

class Resistencia extends StatefulWidget {
  Resistencia({Key? key}) : super(key: key);

  @override
  _ResistenciaState createState() => _ResistenciaState();
}

class _ResistenciaState extends State<Resistencia> {
  var _lista = [
    "Negro",
    "Cafe",
    "Rojo",
    "Naranja",
    "Amarillo",
    "Verde",
    "Azul",
    "Violeta",
    "Gris",
    "Blanco"
  ];
  String _value = "";
  String _valueMax = "";
  String _valueMin = "";
  String _color1 = "Seleccione un color";
  String _color2 = "Seleccione un color";
  String _color3 = "Seleccione un color";
  int _tolerancia = 0;
  double _toleranciaTotal = 0;
  int selectColor(String _color) {
    switch (_color) {
      case "Negro":
        return 0;
      case "Cafe":
        return 1;
      case "Rojo":
        return 2;
      case "Naranja":
        return 3;
      case "Amarillo":
        return 4;
      case "Verde":
        return 5;
      case "Azul":
        return 6;
      case "Violeta":
        return 7;
      case "Gris":
        return 8;
      case "Blanco":
        return 9;
      default:
        return 0;
    }
  }

  double selectMultiplicador(String _color) {
    switch (_color) {
      case "Negro":
        return 1;
      case "Cafe":
        return 10;
      case "Rojo":
        return 100;
      case "Naranja":
        return 1000;
      case "Amarillo":
        return 10000;
      case "Verde":
        return 100000;
      case "Azul":
        return 1000000;
      case "Violeta":
        return 10000000;
      case "Gris":
        return 100000000;
      case "Blanco":
        return 1000000000;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    String rutaImagen = "img/resistenciaValores.jpg";
    final card = Container(
        height: 200,
        width: 200,
        margin: EdgeInsets.only(
          top: 80,
          left: 20,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.scaleDown, image: AssetImage(rutaImagen)),
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
    final band1 = DropdownButton(
      items: _lista.map((String dropDownStringItem) {
        return DropdownMenuItem<String>(
          value: dropDownStringItem,
          child: Text(dropDownStringItem),
        );
      }).toList(),
      onChanged: (_value) {
        setState(() {
          _color1 = _value.toString();
        });
      },
      hint: Text(_color1),
    );
    final band2 = DropdownButton(
      items: _lista.map((String dropDownStringItem) {
        return DropdownMenuItem<String>(
          value: dropDownStringItem,
          child: Text(dropDownStringItem),
        );
      }).toList(),
      onChanged: (_value) {
        setState(() {
          _color2 = _value.toString();
        });
      },
      hint: Text(_color2),
    );
    final band3 = DropdownButton(
      items: _lista.map((String dropDownStringItem) {
        return DropdownMenuItem<String>(
          value: dropDownStringItem,
          child: Text(dropDownStringItem),
        );
      }).toList(),
      onChanged: (_value) {
        setState(() {
          _color3 = _value.toString();
        });
      },
      hint: Text(_color3),
    );

    void calcular() {
      setState(() {
        String val1 = _color1;
        String val2 = _color2;
        String val3 = _color3;
        int valor1 = selectColor(val1) * 10;
        int valor2 = selectColor(val2) + valor1;
        _value = (selectMultiplicador(val3) * valor2).toString();
        switch (_tolerancia) {
          case 1:
            _toleranciaTotal += 0.05;
            break;
          case 2:
            _toleranciaTotal += 0.1;
            break;
        }
        _valueMax = (double.parse(_value) * (1 + _toleranciaTotal)).toString();
        _valueMin = (double.parse(_value) * (1 - _toleranciaTotal)).toString();
        print(
            val1 + " " + val2 + " " + val3 + " " + _toleranciaTotal.toString());

        print("Valor ohm :" + _value);
        print("Valor maximo ohm :" + _valueMax);
        print("Valor minimo ohm :" + _valueMin);
        _toleranciaTotal = 0;
      });
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('Resistencia'),
        ),
        body: ListView(children: [
          Container(
            padding: EdgeInsets.all(15),
            child: card,
          ),
          band1,
          band2,
          band3,
          Text(
            'Tolerancia:',
            style: TextStyle(fontSize: 20),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ListTile(
                title: Text("Oro"),
                leading: Radio(
                  value: 1,
                  groupValue: _tolerancia,
                  onChanged: (value) {
                    setState(() {
                      _tolerancia = int.parse(value.toString());
                    });
                  },
                  activeColor: Colors.yellow,
                ),
              ),
              ListTile(
                title: Text("Plata"),
                leading: Radio(
                  value: 2,
                  groupValue: _tolerancia,
                  onChanged: (value) {
                    setState(() {
                      _tolerancia = int.parse(value.toString());
                    });
                  },
                  activeColor: Colors.grey,
                ),
              ),
            ],
          ),
          Container(
              padding: EdgeInsets.all(15),
              child: ElevatedButton(
                  child: Text('Calcular'),
                  onPressed: () {
                    calcular();
                  })),
          Text(
            'Valor ohm $_value',
            style: TextStyle(fontSize: 20),
          ),
          Text(
            'Valor maximo ohm $_valueMax',
            style: TextStyle(fontSize: 20),
          ),
          Text(
            'Valor minimo ohm $_valueMin',
            style: TextStyle(fontSize: 20),
          ),
        ]));
  }
}
