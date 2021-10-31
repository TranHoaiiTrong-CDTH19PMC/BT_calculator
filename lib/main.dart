import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      home: MyHomePage(),
    );
  }
}

const Color colorDark = Color(0xFF374352);
const Color colorLight = Color(0xFFe6eeff);

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool darkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkMode ? colorDark : colorLight,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            darkMode ? darkMode = false : darkMode = true;
                          });
                        },
                        child: _switchMode()),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        '',
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: darkMode ? Colors.white : Colors.red),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
              Container(
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buttonRounded(title: "√x"),
                      _buttonRounded(
                          title: 'AC',
                          textColor:
                              darkMode ? Colors.green : Colors.redAccent),
                      _buttonRounded(title: '%'),
                      _buttonRounded(
                          title: '/',
                          textColor:
                              darkMode ? Colors.green : Colors.redAccent),
                      _buttonRounded(title: "1/x"),
                      _buttonRounded(title: 'π'),
                      _buttonRounded(title: "log"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buttonRounded(title: '7'),
                      _buttonRounded(title: '8'),
                      _buttonRounded(title: '9'),
                      _buttonRounded(
                          title: 'x',
                          textColor:
                              darkMode ? Colors.green : Colors.redAccent),
                      _buttonRounded(title: "x^2"),
                      _buttonRounded(title: "x^3"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buttonRounded(title: '4'),
                      _buttonRounded(title: '5'),
                      _buttonRounded(title: '6'),
                      _buttonRounded(
                          title: '-',
                          textColor:
                              darkMode ? Colors.green : Colors.redAccent),
                      _buttonRounded(title: '+/-'),
                      _buttonRounded(title: "cos"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buttonRounded(title: '1'),
                      _buttonRounded(title: '2'),
                      _buttonRounded(title: '3'),
                      _buttonRounded(
                          title: '+',
                          textColor:
                              darkMode ? Colors.green : Colors.redAccent),
                      _buttonRounded(title: "x^y"),
                      _buttonRounded(title: "sin"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buttonRounded(
                          title: 'C',
                          textColor:
                              darkMode ? Colors.green : Colors.redAccent),
                      _buttonRounded(title: '0'),
                      _buttonRounded(title: '.'),
                      _buttonRounded(
                          title: '=',
                          textColor:
                              darkMode ? Colors.green : Colors.redAccent),
                      _buttonRounded(title: "x!"),
                      _buttonRounded(title: "tan"),
                    ],
                  )
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buttonRounded(
      {required String title,
      double padding = 17,
      IconData? icon,
      Color? iconColor,
      Color? textColor}) {
    return new Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: NeuContainer(
          darkMode: darkMode,
          borderRadius: (BorderRadius.circular(40)),
          padding: EdgeInsets.all(padding),
          child: Container(
            width: padding * 2,
            height: padding * 2,
            child: new TextButton(
                style: TextButton.styleFrom(side: BorderSide(width: 0)),
                onPressed: () {},
                child: title != null
                    ? Text(
                        '$title',
                        style: TextStyle(
                            color: textColor != null
                                ? textColor
                                : darkMode
                                    ? Colors.white
                                    : Colors.black,
                            fontSize: 20),
                      )
                    : Icon(
                        icon,
                        color: iconColor,
                        size: 25,
                      )),
          ),
        ),
      ),
    );
  }

  Widget _switchMode() {
    return NeuContainer(
      darkMode: darkMode,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      borderRadius: BorderRadius.circular(40),
      child: Container(
        width: 70,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Icon(
            Icons.wb_sunny,
            color: darkMode ? Colors.grey : Colors.redAccent,
          ),
          Icon(
            Icons.nightlight_round,
            color: darkMode ? Colors.green : Colors.grey,
          ),
        ]),
      ),
    );
  }
}

class NeuContainer extends StatefulWidget {
  final bool darkMode;
  final Widget child;
  final BorderRadius borderRadius;
  final EdgeInsetsGeometry padding;

  NeuContainer(
      {this.darkMode = false,
      required this.child,
      required this.borderRadius,
      required this.padding});

  @override
  _NeuContainerState createState() => _NeuContainerState();
}

class _NeuContainerState extends State<NeuContainer> {
  bool _isPressed = false;

  void _onPointerDown(PointerDownEvent event) {
    setState(() {
      _isPressed = true;
    });
  }

  void _onPointerUp(PointerUpEvent event) {
    setState(() {
      _isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool darkMode = widget.darkMode;
    return Listener(
      onPointerDown: _onPointerDown,
      onPointerUp: _onPointerUp,
      child: Container(
        padding: widget.padding,
        decoration: BoxDecoration(
            color: darkMode ? colorDark : colorLight,
            borderRadius: widget.borderRadius,
            boxShadow: _isPressed
                ? null
                : [
                    BoxShadow(
                      color:
                          darkMode ? Colors.black54 : Colors.blueGrey.shade200,
                      offset: Offset(4.0, 4.0),
                      blurRadius: 15.0,
                      spreadRadius: 1.0,
                    ),
                    BoxShadow(
                        color:
                            darkMode ? Colors.blueGrey.shade700 : Colors.white,
                        offset: Offset(-4.0, -4.0),
                        blurRadius: 15.0,
                        spreadRadius: 1.0)
                  ]),
        child: widget.child,
      ),
    );
  }
}
