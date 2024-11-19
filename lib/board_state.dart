import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BoardState extends StatelessWidget {
  String btnText;
  Function OnClickedScreen;
  int index;

  BoardState({super.key, required this.btnText, required this.OnClickedScreen, required this.index});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(1),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            backgroundColor: Colors.yellow, // Background color of the button
          ),
          onPressed: () {
            OnClickedScreen(index);
          },
          child: Text(
            btnText,
            style: TextStyle(
              fontSize: btnText == 'X' ? 60 : 60,  // Larger font size for "X" and "O"
              color: btnText == 'X' ? Colors.red : Colors.blue,  // Different colors for "X" and "O"
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
