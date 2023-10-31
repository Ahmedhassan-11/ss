import 'package:calculator/Clc%20btn.dart';
import 'package:flutter/material.dart';

class CalcScreen extends StatefulWidget {
  @override
  State<CalcScreen> createState() => _CalcScreenState();
}

class _CalcScreenState extends State<CalcScreen> {
  String resultScreen = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Center(child: Text("Calculator Screen")),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                resultScreen,
                style: TextStyle(fontWeight: FontWeight.w200, fontSize: 35),
              ),
            )),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClcBtn("7", OnclickBtn),
                  ClcBtn("8", OnclickBtn),
                  ClcBtn("9", OnclickBtn),
                  ClcBtn("/", OnoperatorClick),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClcBtn("4", OnclickBtn),
                  ClcBtn("5", OnclickBtn),
                  ClcBtn("6", OnclickBtn),
                  ClcBtn("*", OnoperatorClick),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClcBtn("1", OnclickBtn),
                  ClcBtn("2", OnclickBtn),
                  ClcBtn("3", OnclickBtn),
                  ClcBtn("+", OnoperatorClick),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClcBtn(".", OnclickBtn),
                  ClcBtn("0", OnclickBtn),
                  ClcBtn("=", OnEqualClick),
                  ClcBtn("-", OnoperatorClick),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String lhs = "";
  String op = "";

  OnEqualClick(value) {
    String finalres = Calculate(lhs, op, resultScreen);
    resultScreen = finalres;
    setState(() {});
    op = value;
  }

  OnoperatorClick(value) {
    if (op.isEmpty) {
      lhs = resultScreen;
      op = value;
    } else {
      lhs = Calculate(lhs, op, resultScreen);
      op = value;
    }
    resultScreen = "";
    setState(() {});
  }

  String Calculate(String lhs, String op, String Rhs) {
    double LHS = double.parse(lhs);
    double RHS = double.parse(Rhs);
    if (op == "+") {
      double res = LHS + RHS;
      return res.toString();
    } else if (op == "-") {
      double res = LHS - RHS;
      return res.toString();
    } else if (op == "*") {
      double res = LHS * RHS;
      return res.toString();
    } else if (op == "/") {
      double res = LHS / RHS;
      return res.toString();
    }
    return "";
  }

  OnclickBtn(value) {
    if (op == "=") {
      resultScreen = "";
      op = "";
      lhs = "";
    }
    resultScreen += value;
    setState(() {});
  }
}
