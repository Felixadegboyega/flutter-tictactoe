import 'package:tic_tac_toe/constants.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:tic_tac_toe/models/players.dart';

import 'functions.dart';

class NewPlayers extends StatefulWidget {
  const NewPlayers({Key? key}) : super(key: key);

  @override
  State<NewPlayers> createState() => _NewPlayersState();
}

class _NewPlayersState extends State<NewPlayers> {
  TextEditingController player1 = TextEditingController();
  TextEditingController player2 = TextEditingController();
  FocusNode player1Focus = FocusNode();
  FocusNode player2Focus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8f8f8),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 22),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(alignment: AlignmentDirectional.topCenter, children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 40, top: 200),
                        child: blurShadow(Colors.blue),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40, top: 200),
                        child: blurShadow(const Color(0xeee88347)),
                      ),
                    ],
                  ),
                  const Text(
                    "Enter your names",
                    style: TextStyle(fontSize: 20),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(
                              right: 40, top: 65, bottom: 65),
                          child: gradientText("X", Colors.blue)),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 40, top: 65, bottom: 65),
                          child: gradientText("O", const Color(0xeee88347))),
                    ],
                  ),
                ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(right: 15, bottom: 65),
                        child: neumorphicInput("Player 1")),
                    Padding(
                        padding: const EdgeInsets.only(left: 15, bottom: 65),
                        child: neumorphicInput("Player 2")),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: TextButton(
                      onPressed: () {
                        if (player1.text != "" && player2.text != "") {
                          Navigator.pushNamed(context, '/playground',
                              arguments:
                                  PlayerArguments(player1.text, player2.text));
                        } else if (player1.text == "") {
                          FocusScope.of(context).requestFocus(player1Focus);
                        } else if (player2.text == "") {
                          FocusScope.of(context).requestFocus(player2Focus);
                        }
                      },
                      style: kButtonStyle(200, Colors.white),
                      child: const Text("Continue",
                          style: TextStyle(
                            fontFamily: 'Tfont',
                          ))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Neumorphic neumorphicInput(label) {
    return Neumorphic(
      style: const NeumorphicStyle(
        depth: -5,
        color: Colors.white,
        intensity: 0.5,
      ),
      child: SizedBox(
        width: 140,
        child: TextField(
          focusNode: label == 'Player 1' ? player1Focus : player2Focus,
          controller: label == 'Player 1' ? player1 : player2,
          textAlign: TextAlign.center,
          decoration: kInputDecoration(label),
        ),
      ),
    );
  }
}
