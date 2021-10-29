import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Pastel extends StatefulWidget {
  @override
  _PastelState createState() => _PastelState();
}

class _PastelState extends State<Pastel> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Container(
          margin: EdgeInsets.only(left: 10, right: 10, top: 30),
          child: ListView(
            children: <Widget>[
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: GestureDetector(
                  child: ListView(
                    primary: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset("assets/img/pavola2.jpg")),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset("assets/img/pavola1.jpg")),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset("assets/img/pavola3.jpg")),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20, top: 20),
                alignment: Alignment.center,
                child: Text(
                  "Pavlova de Fresa",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  "La pavlova es un tipo de postre elaborado con merengue, denominado así en honor de Anna Pávlova. Es un pastel crujiente por fuera y muy cremoso y ligero por dentro",
                  style: TextStyle(fontSize: 15.0, color: Colors.grey),
                  textAlign: TextAlign.justify,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 50, right: 50, top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Icon(Icons.star, color: Colors.blue),
                          Icon(Icons.star, color: Colors.blue),
                          Icon(Icons.star, color: Colors.blue),
                          Icon(Icons.star),
                          Icon(Icons.star),
                        ],
                      ),
                    ),
                    Container(
                        child: Text(
                      "170 Reviews",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    )),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 40, left: 50, right: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 5),
                          child: Icon(
                            Icons.kitchen,
                            color: Colors.blue,
                          ),
                        ),
                        Text(
                          "PREP:",
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text(
                            "25 min",
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 5),
                          child: Icon(
                            Icons.timer,
                            color: Colors.blue,
                          ),
                        ),
                        Text(
                          "COOK:",
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text(
                            "1 hr",
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 5),
                          child: Icon(
                            Icons.restaurant,
                            color: Colors.blue,
                          ),
                        ),
                        Text(
                          "FEEDS:",
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text(
                            "4-6",
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
