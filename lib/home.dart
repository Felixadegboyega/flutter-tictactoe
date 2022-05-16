import 'package:flutter/material.dart';

import 'constants.dart';
import 'functions.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xfff8f8f8),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 140),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        blurShadow(Colors.blue),
                        blurShadow(const Color(0xeee88347)),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // gradientText("X", const Color(0x555C9EED)),
                      gradientText("X", Colors.blue),
                      gradientText("O", const Color(0xeee88347)),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/new-players');
                    },
                    style: kButtonStyle(200, Colors.white),
                    child: const Text("Play",
                        style: TextStyle(
                          fontFamily: 'Tfont',
                        ))),
              ),
            ],
          ),
        ));
  }
}
