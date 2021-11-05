import 'dart:html';

import 'package:flutter/material.dart';

final _nombre = TextEditingController();
final _apellido1 = TextEditingController();
final _apellido2 = TextEditingController();
final _diaNacimiento = TextEditingController();
final _mesNacimiento = TextEditingController();
final _anioNacimiento = TextEditingController();
String _nombreCompleto = "";
int _sexo = 0;
String _tuSigno = '';
int _edad = 0;
List<String> _zodiacosChinos = [
  "Mono",
  "Gallo",
  "Perro",
  "Cerdo",
  "Raton",
  "Buey",
  "Tigre",
  "Conejo",
  "Dragon",
  "Serpiente",
  "Caballo",
  "Oveja"
];
void zodiaco() {
  _nombreCompleto =
      _nombre.text + " " + _apellido1.text + " " + _apellido2.text;
  int dia = int.parse(_diaNacimiento.text);
  int mes = int.parse(_mesNacimiento.text);
  int anio = int.parse(_anioNacimiento.text);
  _edad = 2021 - anio;
  if (mes >= 11) {
    if (dia > 4) {
      _edad -= 1;
    }
  }

  int zodiaco = anio % 12;
  _tuSigno = _zodiacosChinos[zodiaco];
  print(_tuSigno);
}

class ZoodiacoChinoFormulario extends StatefulWidget {
  ZoodiacoChinoFormulario({Key? key}) : super(key: key);

  @override
  _ZoodiacoChinoFormularioState createState() =>
      _ZoodiacoChinoFormularioState();
}

class _ZoodiacoChinoFormularioState extends State<ZoodiacoChinoFormulario> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Zoodiaco Chino",
              style: TextStyle(fontSize: 30),
            ),
          ),
          Center(
            child: ListView(shrinkWrap: true, children: [
              TextFormField(
                controller: _nombre,
                decoration: InputDecoration(
                  labelText: "Nombre",
                  labelStyle: TextStyle(fontSize: 20),
                ),
              ),
              TextFormField(
                controller: _apellido1,
                decoration: InputDecoration(
                  labelText: "Apellido 1",
                  labelStyle: TextStyle(fontSize: 20),
                ),
              ),
              TextFormField(
                controller: _apellido2,
                decoration: InputDecoration(
                  labelText: "Apellido 2",
                  labelStyle: TextStyle(fontSize: 20),
                ),
              ),
              Text(
                "Fecha de Nacimiento",
                style: TextStyle(fontSize: 20),
              ),
              TextFormField(
                controller: _diaNacimiento,
                decoration: InputDecoration(
                  labelText: "Dia",
                  labelStyle: TextStyle(fontSize: 20),
                ),
              ),
              TextFormField(
                controller: _mesNacimiento,
                decoration: InputDecoration(
                  labelText: "Mes",
                  labelStyle: TextStyle(fontSize: 20),
                ),
              ),
              TextFormField(
                controller: _anioNacimiento,
                decoration: InputDecoration(
                  labelText: "Año",
                  labelStyle: TextStyle(fontSize: 20),
                ),
              ),
            ]),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ListTile(
                title: Text("Masculino"),
                leading: Radio(
                  value: 1,
                  groupValue: _sexo,
                  onChanged: (value) {
                    setState(() {
                      _sexo = int.parse(value.toString());
                    });
                  },
                  activeColor: Colors.yellow,
                ),
              ),
              ListTile(
                title: Text("Femenino"),
                leading: Radio(
                  value: 2,
                  groupValue: _sexo,
                  onChanged: (value) {
                    setState(() {
                      _sexo = int.parse(value.toString());
                    });
                  },
                  activeColor: Colors.grey,
                ),
              ),
            ],
          ),
          Center(
              child: RaisedButton(
            child: Text('Resultado'),
            onPressed: () {
              zodiaco();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ZoodiacoChinoResult()),
              );
            },
          )),
        ],
      ),
    );
  }
}

class ZoodiacoChinoResult extends StatelessWidget {
  const ZoodiacoChinoResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              "Zoodiaco Chino",
              style: TextStyle(fontSize: 30),
            ),
          ),
          Text(
            "Hola $_nombreCompleto ",
            style: TextStyle(fontSize: 20),
          ),
          Text(
            "Tienes $_edad",
            style: TextStyle(fontSize: 20),
          ),
          Text(
            "Tu signo es $_tuSigno",
            style: TextStyle(fontSize: 20),
          ),
          Container(
              height: 200,
              width: 200,
              margin: EdgeInsets.only(
                top: 80,
                left: 20,
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.scaleDown,
                    image: AssetImage("img/$_tuSigno.jpg")),
                borderRadius: BorderRadius.all(Radius.circular(20)),
                shape: BoxShape.rectangle,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 15,
                    offset: Offset(0, 7),
                  ),
                ],
              )),
          Center(
              child: RaisedButton(
            child: Text('Regresar'),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
        ],
      ),
    );
  }
}
