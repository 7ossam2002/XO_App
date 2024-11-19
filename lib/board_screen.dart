import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:calculator/startgamescreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'board_state.dart';

class BoardScreen extends StatefulWidget {
  static const String routeName = '/board';

  const BoardScreen({super.key});

  @override
  State<BoardScreen> createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  List<String> state = [
    '', '', '',
    '', '', '',
    '', '', '',
  ];
  int Player1Score = 0;
  int Player2Score = 0;
  int counter = 0;

  // Declare a state variable to store the StartGameArgs
  late StartGameArgs args;

  @override
  Widget build(BuildContext context) {
    if (ModalRoute.of(context)?.settings.arguments != null) {
      args = ModalRoute.of(context)!.settings.arguments as StartGameArgs;
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35),
          ),
          backgroundColor: Colors.yellow,
          title: Text(
            "XO Game",
            style: TextStyle(
              fontSize: 25,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          args.player1Name,
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          "Score : $Player1Score",
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          args.player2Name,
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          "Score : $Player2Score",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  BoardState(btnText: state[0], OnClickedScreen: onboardbutton, index: 0),
                  BoardState(btnText: state[1], OnClickedScreen: onboardbutton, index: 1),
                  BoardState(btnText: state[2], OnClickedScreen: onboardbutton, index: 2),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  BoardState(btnText: state[3], OnClickedScreen: onboardbutton, index: 3),
                  BoardState(btnText: state[4], OnClickedScreen: onboardbutton, index: 4),
                  BoardState(btnText: state[5], OnClickedScreen: onboardbutton, index: 5),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  BoardState(btnText: state[6], OnClickedScreen: onboardbutton, index: 6),
                  BoardState(btnText: state[7], OnClickedScreen: onboardbutton, index: 7),
                  BoardState(btnText: state[8], OnClickedScreen: onboardbutton, index: 8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onboardbutton(int index) {
    if (state[index] != '') {
      return;
    }

    setState(() {
      if (counter.isEven) {
        state[index] = "X";
        if (checkwinner("X")) {
          Player1Score += 1;
          showWinnerDialog("X", args.player1Name, args.player2Name); // Use args stored in the state
        } else if (isDraw()) {
          showDrawDialog();
        }
      } else {
        state[index] = "O";
        if (checkwinner("O")) {
          Player2Score += 1;
          showWinnerDialog("O", args.player1Name, args.player2Name); // Use args stored in the state
        } else if (isDraw()) {
          showDrawDialog();
        }
      }
      counter++;
    });
  }

  bool checkwinner(String symbol) {
    // Check rows
    for (int i = 0; i < 9; i += 3) {
      if (state[i] == symbol && state[i + 1] == symbol && state[i + 2] == symbol) {
        return true;
      }
    }

    // Check columns
    for (int i = 0; i < 3; i++) {
      if (state[i] == symbol && state[i + 3] == symbol && state[i + 6] == symbol) {
        return true;
      }
    }

    // Check diagonals
    if (state[0] == symbol && state[4] == symbol && state[8] == symbol) {
      return true;
    }
    if (state[2] == symbol && state[4] == symbol && state[6] == symbol) {
      return true;
    }

    return false;
  }

  bool isDraw() {
    // Check if all the cells are filled and no winner
    return !state.contains('') && !checkwinner("X") && !checkwinner("O");
  }

  void showWinnerDialog(String winnerSymbol, String player1Name, String player2Name) {
    // Determine the winner's name based on the symbol
    String winner = winnerSymbol == "X" ? player1Name : player2Name;

    AwesomeDialog(
      context: context,
      dialogType: DialogType.noHeader,
      animType: AnimType.scale,
      customHeader: const Icon(
        Icons.check_circle,
        color: Colors.blue,
        size: 100,
      ),
      title: '🎉 Winner! 🎉',
      desc: '$winner has won the game!',  // Display the winner's name
      btnOkText: 'OK',
      btnOkColor: Colors.blue,
      btnOkOnPress: () {
        resetGame();  // Reset the game after the dialog is dismissed
      },
    ).show();
  }

  void showDrawDialog() {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.warning,
      animType: AnimType.scale,
      title: '🤝 Draw! 🤝',
      desc: 'No one has won this game!',
      btnOkText: 'OK',
      btnOkColor: Colors.orange,
      btnOkOnPress: () {
        resetGame(); // Reset the game without changing scores
      },
    ).show();
  }

  void resetGame() {
    setState(() {
      state = [
        '', '', '',
        '', '', '',
        '', '', '',
      ];
      counter = 0;
    });
  }
}
