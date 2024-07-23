import 'package:flutter/material.dart';

class ReusableWidget {
  static Widget animationLayout(Animation gradientPosition, double width) {
    return Card(
      margin:
          const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 16, right: 16),
      child: Column(
        children: <Widget>[
          Container(
            width: width,
            height: 150,
            margin: const EdgeInsets.only(top: 20),
            child: Column(
              children: <Widget>[
                Align(
                  alignment: FractionalOffset.topLeft,
                  child: Container(
                    width: 50,
                    height: 50,
                    margin: const EdgeInsets.only(left: 10, right: 10, top: 5),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment(gradientPosition.value, 0),
                            end: const Alignment(-1, 0),
                            colors: const [
                          Colors.black12,
                          Colors.black26,
                          Colors.black12
                        ])),
                    child: const Text(''),
                  ),
                ),
                Align(
                  alignment: FractionalOffset.topLeft,
                  child: Container(
                    width: 150,
                    height: 20,
                    margin: const EdgeInsets.only(left: 10, right: 10, top: 5),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment(gradientPosition.value, 0),
                            end: const Alignment(-1, 0),
                            colors: const [
                          Colors.black12,
                          Colors.black26,
                          Colors.black12
                        ])),
                    child: const Text(''),
                  ),
                ),
                Align(
                  alignment: FractionalOffset.topLeft,
                  child: Container(
                    width: 200,
                    height: 20,
                    margin: const EdgeInsets.only(left: 10, right: 10, top: 5),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment(gradientPosition.value, 0),
                            end: const Alignment(-1, 0),
                            colors: const [
                          Colors.black12,
                          Colors.black26,
                          Colors.black12
                        ])),
                    child: const Text(''),
                  ),
                ),
                Align(
                  alignment: FractionalOffset.topLeft,
                  child: Container(
                    width: 250,
                    height: 20,
                    margin: const EdgeInsets.only(left: 10, right: 10, top: 5),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment(gradientPosition.value, 0),
                            end: const Alignment(-1, 0),
                            colors: const [
                          Colors.black12,
                          Colors.black26,
                          Colors.black12
                        ])),
                    child: const Text(''),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: width,
            height: 150,
            margin: const EdgeInsets.only(top: 20),
            child: Column(
              children: <Widget>[
                Align(
                  alignment: FractionalOffset.topLeft,
                  child: Container(
                    width: 50,
                    height: 50,
                    margin: const EdgeInsets.only(left: 10, right: 10, top: 5),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment(gradientPosition.value, 0),
                            end: const Alignment(-1, 0),
                            colors: const [
                          Colors.black12,
                          Colors.black26,
                          Colors.black12
                        ])),
                    child: const Text(''),
                  ),
                ),
                Align(
                  alignment: FractionalOffset.topLeft,
                  child: Container(
                    width: 150,
                    height: 20,
                    margin: const EdgeInsets.only(left: 10, right: 10, top: 5),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment(gradientPosition.value, 0),
                            end: const Alignment(-1, 0),
                            colors: const [
                          Colors.black12,
                          Colors.black26,
                          Colors.black12
                        ])),
                    child: const Text(''),
                  ),
                ),
                Align(
                  alignment: FractionalOffset.topLeft,
                  child: Container(
                    width: 200,
                    height: 20,
                    margin: const EdgeInsets.only(left: 10, right: 10, top: 5),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment(gradientPosition.value, 0),
                            end: const Alignment(-1, 0),
                            colors: const [
                          Colors.black12,
                          Colors.black26,
                          Colors.black12
                        ])),
                    child: const Text(''),
                  ),
                ),
                Align(
                  alignment: FractionalOffset.topLeft,
                  child: Container(
                    width: 250,
                    height: 20,
                    margin: const EdgeInsets.only(left: 10, right: 10, top: 5),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment(gradientPosition.value, 0),
                            end: const Alignment(-1, 0),
                            colors: const [
                          Colors.black12,
                          Colors.black26,
                          Colors.black12
                        ])),
                    child: const Text(''),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
