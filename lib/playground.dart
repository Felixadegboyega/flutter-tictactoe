import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/models/players.dart';

class PlayGround extends StatefulWidget {
  const PlayGround({Key? key}) : super(key: key);

  @override
  State<PlayGround> createState() => _PlayGroundState();
}

class _PlayGroundState extends State<PlayGround> {
  int player1Count = 0;
  int player2Count = 0;
  bool disabled = false;
  late PlayerArguments args;
  Map<String, dynamic> active = {"text": "X", "color": Colors.blue};
  Map<String, dynamic> a1 = {"val": "a1", "text": ""};
  Map<String, dynamic> a2 = {"val": "a2", "text": ""};
  Map<String, dynamic> a3 = {"val": "a3", "text": ""};
  Map<String, dynamic> b1 = {"val": "b1", "text": ""};
  Map<String, dynamic> b2 = {"val": "b2", "text": ""};
  Map<String, dynamic> b3 = {"val": "b3", "text": ""};
  Map<String, dynamic> c1 = {"val": "c1", "text": ""};
  Map<String, dynamic> c2 = {"val": "c2", "text": ""};
  Map<String, dynamic> c3 = {"val": "c3", "text": ""};
  String message = "";
  List<String> winBoxes = [];
  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments as PlayerArguments;
    // message = "${args.player1}'s turn";
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 40),
                child: Text(
                  message,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey[600],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100,
                    child: Text(
                      args.player1,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey[700],
                          overflow: TextOverflow.ellipsis),
                      textAlign: TextAlign.right,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 23),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "$player1Count - $player2Count",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[700]),
                    ),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2,
                              offset: const Offset(0.0, 2.0),
                              color: Colors.grey.shade200,
                              blurRadius: 3)
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  SizedBox(
                    width: 100,
                    child: Text(
                      args.player2,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey[700],
                          overflow: TextOverflow.ellipsis),
                    ),
                  ),
                ],
              ),
              Container(
                child: Row(
                  children: [
                    Column(
                      children: [
                        Container(
                            width: 104,
                            child: playText(a1),
                            height: 100,
                            decoration: BoxDecoration(
                                color: winBoxes.contains("a1")
                                    ? Colors.grey.shade200
                                    : null)),
                        Container(
                            width: 104,
                            child: playText(b1),
                            height: 100,
                            decoration: BoxDecoration(
                                color: winBoxes.contains("b1")
                                    ? Colors.grey.shade200
                                    : null,
                                border:
                                    Border(top: cBorder(), bottom: cBorder()))),
                        Container(
                            width: 104,
                            child: playText(c1),
                            height: 100,
                            decoration: BoxDecoration(
                                color: winBoxes.contains("c1")
                                    ? Colors.grey.shade200
                                    : null)),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                            width: 104,
                            child: playText(a2),
                            height: 100,
                            decoration: BoxDecoration(
                                color: winBoxes.contains("a2")
                                    ? Colors.grey.shade200
                                    : null,
                                border:
                                    Border(left: cBorder(), right: cBorder()))),
                        Container(
                            width: 104,
                            child: playText(b2),
                            height: 100,
                            decoration: BoxDecoration(
                                color: winBoxes.contains("b2")
                                    ? Colors.grey.shade200
                                    : null,
                                border:
                                    Border.all(color: Colors.grey.shade200))),
                        Container(
                            width: 104,
                            child: playText(c2),
                            height: 100,
                            decoration: BoxDecoration(
                                color: winBoxes.contains("c2")
                                    ? Colors.grey.shade200
                                    : null,
                                border:
                                    Border(left: cBorder(), right: cBorder()))),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                            width: 104,
                            child: playText(a3),
                            height: 100,
                            decoration: BoxDecoration(
                                color: winBoxes.contains("a3")
                                    ? Colors.grey.shade200
                                    : null,
                                border: Border(bottom: cBorder()))),
                        Container(
                            width: 104,
                            child: playText(b3),
                            height: 100,
                            decoration: BoxDecoration(
                                color: winBoxes.contains("b3")
                                    ? Colors.grey.shade200
                                    : null,
                                border: Border(bottom: cBorder()))),
                        Container(
                            width: 104,
                            child: playText(c3),
                            height: 100,
                            decoration: BoxDecoration(
                                color: winBoxes.contains("c3")
                                    ? Colors.grey.shade200
                                    : null)),
                      ],
                    ),
                  ],
                ),
                height: 320,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 9),
                margin: const EdgeInsets.only(
                    right: 20, left: 20, top: 20, bottom: 40),
                width: 330,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(0.0, 2.0),
                          color: Colors.grey.shade200,
                          blurRadius: 3)
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: TextButton(
                        onPressed: () {
                          _showMyDialog();
                        },
                        style: kButtonStyle(120, Colors.blue),
                        child: const Text("Quit",
                            style: TextStyle(
                                fontFamily: 'Tfont', color: Colors.white))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: TextButton(
                        onPressed: () {
                          reset();
                        },
                        style: kButtonStyle(120, Colors.white),
                        child: const Text("Restart",
                            style: TextStyle(
                              fontFamily: 'Tfont',
                            ))),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Quit?'),
          content: const SingleChildScrollView(
            child: Text('Are you sure you want to quit ?.'),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text(
                'Yes',
                style: TextStyle(color: Colors.redAccent),
              ),
              onPressed: () {
                int c = 0; // count
                Navigator.popUntil(context, (_) => c++ >= 2);
              },
            ),
          ],
        );
      },
    );
  }

  playText(val) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(
          colors: [val["color"] ?? Colors.blue, Colors.white],
        ).createShader(
          const Rect.fromLTWH(35.0, 0.0, 100.0, 0.0),
          // Offset.zero & bounds.size
        );
      },
      child: TextButton(
        style: ButtonStyle(
            splashFactory: NoSplash.splashFactory,
            padding:
                MaterialStateProperty.resolveWith((states) => EdgeInsets.zero)),
        onPressed: disabled
            ? null
            : () {
                handleClick(val);
              },
        child: Text(
          val["text"] ?? "",
          textAlign: TextAlign.center,
          style: TextStyle(shadows: [
            Shadow(
              offset: const Offset(0, 5),
              blurRadius: 15,
              color: val["color"] ?? Colors.blue,
            )
          ], fontSize: 80, fontWeight: FontWeight.w900, color: Colors.white),
        ),
      ),
    );
  }

  BorderSide cBorder() {
    return BorderSide(width: 1.0, color: Colors.grey.shade200);
  }

  void handleClick(val) {
    setState(() {
      if (val["text"] != "") return;
      if (val["val"] == a1["val"]) {
        a1 = active;
      } else if (val["val"] == a2["val"]) {
        a2 = active;
      } else if (val["val"] == a3["val"]) {
        a3 = active;
      } else if (val["val"] == b1["val"]) {
        b1 = active;
      } else if (val["val"] == b2["val"]) {
        b2 = active;
      } else if (val["val"] == b3["val"]) {
        b3 = active;
      } else if (val["val"] == c1["val"]) {
        c1 = active;
      } else if (val["val"] == c2["val"]) {
        c2 = active;
      } else if (val["val"] == c3["val"]) {
        c3 = active;
      }

      if (((a1["text"] == a2["text"]) &&
              (a1["text"] == a3["text"]) &&
              a1["text"] != "") ||
          ((b1["text"] == b2["text"]) &&
              (b1["text"] == b3["text"]) &&
              b1["text"] != "") ||
          ((c1["text"] == c2["text"]) &&
              (c1["text"] == c3["text"]) &&
              c1["text"] != "") ||
          ((a1["text"] == b1["text"]) &&
              (a1["text"] == c1["text"]) &&
              a1["text"] != "") ||
          ((a2["text"] == b2["text"]) &&
              (a2["text"] == c2["text"]) &&
              a2["text"] != "") ||
          ((a3["text"] == b3["text"]) &&
              (a3["text"] == c3["text"]) &&
              a3["text"] != "") ||
          ((a1["text"] == b2["text"]) &&
              (a1["text"] == c3["text"]) &&
              a1["text"] != "") ||
          ((a3["text"] == b2["text"]) &&
              (a3["text"] == c1["text"]) &&
              a3["text"] != "")) {
        disabled = true;
        Timer.periodic(const Duration(seconds: 2), (timer) {
          reset();
          timer.cancel();
        });
        if (active["text"] == "X") {
          player1Count++;
        } else {
          player2Count++;
        }
      } else if ((a1["text"] != "") &&
          (a2["text"] != "") &&
          (a3["text"] != "") &&
          (b1["text"] != "") &&
          (b2["text"] != "") &&
          (b3["text"] != "") &&
          (c1["text"] != "") &&
          (c2["text"] != "") &&
          (c3["text"] != "")) {
        Timer.periodic(const Duration(seconds: 1), (timer) {
          reset();
          timer.cancel();
        });
      }

      if (((a1["text"] == a2["text"]) &&
          (a1["text"] == a3["text"]) &&
          a1["text"] != "")) {
        winBoxes = ["a1", "a2", "a3"];
      } else if (((b1["text"] == b2["text"]) &&
          (b1["text"] == b3["text"]) &&
          b1["text"] != "")) {
        winBoxes = ["b1", "b2", "b3"];
      } else if (((c1["text"] == c2["text"]) &&
          (c1["text"] == c3["text"]) &&
          c1["text"] != "")) {
        winBoxes = ["c1", "c2", "c3"];
      } else if (((a1["text"] == b1["text"]) &&
          (a1["text"] == c1["text"]) &&
          a1["text"] != "")) {
        winBoxes = ["a1", "b1", "c1"];
      } else if (((a2["text"] == b2["text"]) &&
          (a2["text"] == c2["text"]) &&
          a2["text"] != "")) {
        winBoxes = ["a2", "b2", "c2"];
      } else if (((a3["text"] == b3["text"]) &&
          (a3["text"] == c3["text"]) &&
          a3["text"] != "")) {
        winBoxes = ["a3", "b3", "c3"];
      } else if (((a1["text"] == b2["text"]) &&
          (a1["text"] == c3["text"]) &&
          a1["text"] != "")) {
        winBoxes = ["a1", "b2", "c3"];
      } else if (((a3["text"] == b2["text"]) &&
          (a3["text"] == c1["text"]) &&
          a3["text"] != "")) {
        winBoxes = ["a3", "b2", "c1"];
      }

      active['text'] == "O"
          ? message = "${args.player1}'s turn"
          : message = "${args.player2}'s turn";
      active = {
        "text": active['text'] == "X" ? "O" : "X",
        "color": active['color'] == const Color(0xeee88347)
            ? Colors.blue
            : const Color(0xeee88347)
      };
    });
  }

  reset() {
    setState(() {
      a1 = {"val": "a1", "text": ""};
      a2 = {"val": "a2", "text": ""};
      a3 = {"val": "a3", "text": ""};
      b1 = {"val": "b1", "text": ""};
      b2 = {"val": "b2", "text": ""};
      b3 = {"val": "b3", "text": ""};
      c1 = {"val": "c1", "text": ""};
      c2 = {"val": "c2", "text": ""};
      c3 = {"val": "c3", "text": ""};
      disabled = false;
      winBoxes = [];
    });
  }
}
