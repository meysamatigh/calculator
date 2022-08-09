import 'package:math_expressions/math_expressions.dart';

import '../constants/constants.dart';
import 'package:flutter/material.dart';
import '../widgets/box_neu.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // const HomeScreen({Key? key}) : super(key: key);
  bool darkMode = true;
  String equation = '0';
  String result = '0';
  String expression = '';
  double equationFontSize = 40;
  double resultFontSize = 50;

  btnPressed(String btnText) {
    setState(() {
      if (btnText == 'C') {
        equationFontSize = 40;
        resultFontSize = 50;
        equation = '0';
        result = '0';
      } else if (btnText == '◄') {
        equationFontSize = 50;
        resultFontSize = 40;
        equation = equation.substring(0, equation.length - 1);
        if (equation.isEmpty) {
          equation = '0';
        }
      } else if (btnText == '=') {
        equationFontSize = 40;
        resultFontSize = 50;
        expression = equation;
        // expression = expression.replaceAll('/', '/');
        // expression = expression.replaceAll('*', '*');
        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);
          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = 'What the hell???!!!';
        }
      } else {
        equationFontSize = 50;
        resultFontSize = 40;
        if (equation == '0') {
          equation = btnText;
        } else {
          equation = equation + btnText;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var wi = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: darkMode ? colorDark : colorLight,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            darkMode ? darkMode = false : darkMode = true;
                          });
                        },
                        child: SizedBox(
                          width: 110,
                          height: 55,
                          child: BoxNeu(
                            darkMode: darkMode,
                            borderRadius: BorderRadius.circular(40),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            child: SizedBox(
                              width: 70,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.wb_sunny,
                                    color: darkMode ? Colors.grey : Colors.red,
                                  ),
                                  Icon(
                                    Icons.nightlight_round,
                                    color:
                                        darkMode ? Colors.green : Colors.grey,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          result,
                          style: TextStyle(
                            fontSize: resultFontSize,
                            fontWeight: FontWeight.bold,
                            color: darkMode ? Colors.white : Colors.red,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '=',
                            style: TextStyle(
                              fontSize: equationFontSize,
                              color: darkMode ? Colors.green : Colors.grey,
                            ),
                          ),
                          Text(
                            equation,
                            style: TextStyle(
                                fontSize: 35,
                                color: darkMode ? Colors.green : Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ButtonNeu(
                          title: 'C',
                          darkMode: darkMode,
                          textColor: darkMode ? Colors.green : Colors.redAccent,
                        ),
                        ButtonNeu(
                          title: '(',
                          darkMode: darkMode,
                        ),
                        ButtonNeu(
                          title: ')',
                          darkMode: darkMode,
                        ),
                        ButtonNeu(
                          title: '/',
                          darkMode: darkMode,
                          textColor: darkMode ? Colors.green : Colors.redAccent,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ButtonNeu(
                          title: '7',
                          darkMode: darkMode,
                        ),
                        ButtonNeu(
                          title: '8',
                          darkMode: darkMode,
                        ),
                        ButtonNeu(
                          title: '9',
                          darkMode: darkMode,
                        ),
                        ButtonNeu(
                          title: '*',
                          darkMode: darkMode,
                          textColor: darkMode ? Colors.green : Colors.redAccent,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ButtonNeu(
                          title: '4',
                          darkMode: darkMode,
                        ),
                        ButtonNeu(
                          title: '5',
                          darkMode: darkMode,
                        ),
                        ButtonNeu(
                          title: '6',
                          darkMode: darkMode,
                        ),
                        ButtonNeu(
                          title: '-',
                          darkMode: darkMode,
                          textColor: darkMode ? Colors.green : Colors.redAccent,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ButtonNeu(
                          title: '1',
                          darkMode: darkMode,
                        ),
                        ButtonNeu(
                          title: '2',
                          darkMode: darkMode,
                        ),
                        ButtonNeu(
                          title: '3',
                          darkMode: darkMode,
                        ),
                        ButtonNeu(
                          title: '+',
                          darkMode: darkMode,
                          textColor: darkMode ? Colors.green : Colors.redAccent,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ButtonNeu(
                          title: '0',
                          darkMode: darkMode,
                        ),
                        ButtonNeu(
                          title: '.',
                          darkMode: darkMode,
                        ),
                        ButtonNeu(
                          title: '◄',
                          darkMode: darkMode,
                          textColor: darkMode ? Colors.green : Colors.redAccent,
                        ),
                        ButtonNeu(
                          title: '=',
                          darkMode: darkMode,
                          textColor: darkMode ? Colors.green : Colors.redAccent,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget ButtonNeu(
      {String? title, double padding = 17, Color? textColor, bool? darkMode}) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: BoxNeu(
        darkMode: darkMode!,
        borderRadius: BorderRadius.circular(40),
        padding: const EdgeInsets.all(10),
        child: InkWell(
          onTap: () => btnPressed(title!),
          child: SizedBox(
            width: padding * 2,
            height: padding * 2,
            child: Center(
              child: Text(
                title!,
                style: TextStyle(
                    color:
                        textColor ?? (darkMode ? Colors.white : Colors.black),
                    fontWeight: FontWeight.bold,
                    fontSize: 40),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
