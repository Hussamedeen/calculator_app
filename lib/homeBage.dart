//import 'package:calculatorapp/buttonClalc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String text = '0';
  double numOne = 0;
  double numTwo = 0;
  String result = '';
  String finalResult = '0';
  String opr='';
  String preOpr = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      backgroundColor: Colors.black,
      body: Container(
        margin: EdgeInsets.only(bottom: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    text,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 60,
                    ),
                    maxLines: 1,
                    textAlign: TextAlign.right,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buttonCalc("C", Color(0xffa5a5a5),0),
                buttonCalc("+/-", Color(0xffa5a5a5),0),
                buttonCalc("%", Color(0xffa5a5a5),0),
                buttonCalc("/", Color(0xffff9800),0),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buttonCalc("7", Color(0xff323232),0),
                buttonCalc("8", Color(0xff323232),0),
                buttonCalc("9", Color(0xff323232),0),
                buttonCalc("X", Color(0xffff9800),0),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buttonCalc("4", Color(0xff323232),0),
                buttonCalc("5", Color(0xff323232),0),
                buttonCalc("6", Color(0xff323232),0),
                buttonCalc("-", Color(0xffff9800),0),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buttonCalc("1", Color(0xff323232),0),
                buttonCalc("2", Color(0xff323232),0),
                buttonCalc("3", Color(0xff323232),0),
                buttonCalc("+", Color(0xffff9800),0),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buttonCalc("0", Color(0xff323232),1),
                buttonCalc(".", Color(0xff323232),0),
                buttonCalc("=", Color(0xffff9800),0),
              ],
            ),

          ],
        ),
      ),
    );
  }
  Widget buttonCalc(String btnTxt, Color color, int num) {
    Container container;

    if(num == 1) {
      container = Container(
          padding: EdgeInsets.only(bottom: 10),
          child: RaisedButton(
            onPressed: () {
              calculate(btnTxt);
            },
            child: Text(btnTxt,
                style: TextStyle(
                    fontSize: 30
                )
            ),
            color: color,
            padding: EdgeInsets.only(left:81, top:20, right: 81, bottom: 20),
            shape: StadiumBorder(),
          )
      );
    } else {
      container = Container(
          padding: EdgeInsets.only(bottom: 10),
          child: RaisedButton(
            onPressed: () {
              calculate(btnTxt);
            },
            child: Text(btnTxt,
                style: TextStyle(
                    fontSize: 30
                )
            ),
            color: color,
            padding: EdgeInsets.all(20),
            shape: CircleBorder(),
          )
      );
    }
    return container;
  }

  void calculate(txtBtn) {

    if(txtBtn == 'C') {
      text = '0';
      numOne = 0;
      numTwo = 0;
      result = '';
      finalResult = '0';
      opr = '';
      preOpr = '';
    } else if (opr == '=' && txtBtn == '=' ){
      switch(preOpr) {
        case '+':
          finalResult =  add();
          break;
        case '-':
          finalResult = sub();
          break;
        case 'X':
          finalResult = mul();
          break;
        case '/':
          finalResult = div();
          break;
      }
    } else if(txtBtn == '+' || txtBtn == '-' || txtBtn == 'X' || txtBtn == '/' || txtBtn == '=') {

      if (numOne == 0) {
        numOne = double.parse(finalResult);
      } else {
        numTwo = double.parse(finalResult);
      }

      switch(opr){
        case '+':
          finalResult = add();
          break;
        case '-':
          finalResult = sub();
          break;
        case 'X':
          finalResult = mul();
          break;
        case '/':
          finalResult = div();
          break;
      }
      preOpr =  opr;
      opr = txtBtn;
      result = '';
    } else if (txtBtn  == '%') {
      result = (numOne / 100).toString();
      finalResult = result;
    } else if (txtBtn == '.') {
      if(!result.contains('.'))
        result += '.';
      finalResult = result;
    } else if (txtBtn == '+/-') {

               result.startsWith('-')  ? result = result.substring(1): result = '-' + finalResult;
             finalResult = result;


    } else {
      if (result == '0')
        result = txtBtn;
      else
        result = result + txtBtn;
      finalResult = result;
    }

    setState(() {
      text = finalResult;
    });
  }

  String add() {
    result = (numOne + numTwo).toString();
    numOne = double.parse(result);
    return decimalRemove(result);
  }

  String sub() {
    result = (numOne - numTwo).toString();
    numOne = double.parse(result);
    return decimalRemove(result);
  }

  String mul() {
    result = (numOne * numTwo).toString();
    numOne = double.parse(result);
    return decimalRemove(result);
  }

  String div() {
    result = (numOne / numTwo).toString();
    numOne = double.parse(result);
    return decimalRemove(result);
  }

  String decimalRemove(String _result) {

    if (_result.contains('.')) {
      List<String> split = _result.split('.');
      //[11, 0]
      if(!(int.parse(split[1]) > 0))
        return split[0];
    }
    return _result;
  }
}
//class ButtonCalc extends StatelessWidget {
//  final String nameButton;
//  final Color colorButton;
//  final int num;
//
//  ButtonCalc(this.nameButton, this.colorButton,this.num);
//  @override
//  Widget build(BuildContext context) {
//    if( num ==0){
//      return Container(
//        padding: EdgeInsets.only(bottom: 10.0),
//        child: RaisedButton(
//          onPressed: (){},
//          child: Text(
//            nameButton,
//            style: TextStyle(
//              fontSize: 30,
//            ),
//          ),
//          color: colorButton,
//          padding: EdgeInsets.all(20.0),
//          shape: CircleBorder(),
//        ),
//      );
//    }
//    else {
//      return  Container(
//        padding: EdgeInsets.only(bottom: 10.0),
//        child: RaisedButton(
//          onPressed: (){},
//          child: Text(
//            nameButton,
//            style: TextStyle(
//              fontSize: 30,
//            ),
//          ),
//          color: colorButton,
//          padding: EdgeInsets.only(left:81.0,top: 20.0,right: 81.0,bottom: 20.0),
//          shape: StadiumBorder(),
//        ),
//      );
//    }
//  }
//}