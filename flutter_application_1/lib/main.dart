import 'package:flutter/material.dart';

void main() {
  runApp(TicTacToeApp());
}

class TicTacToeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TicTacToeGame(),
    );
  }
}

class TicTacToeGame extends StatefulWidget {
  @override
  _TicTacToeGameState createState() => _TicTacToeGameState();
}

class _TicTacToeGameState extends State<TicTacToeGame> {
  List<List<String>> board = List.generate(3, (_) => List.filled(3, ""));

  bool xTurn = true; // Player X starts

  void _makeMove(int row, int col) {
    if (board[row][col].isEmpty) {
      setState(() {
        if (xTurn) {
          board[row][col] = "X";
        } else {
          board[row][col] = "O";
        }
        xTurn = !xTurn;
      });
    }
  }

  String _checkWinner() {
    for (int i = 0; i < 3; i++) {
      if (board[i][0] == board[i][1] &&
          board[i][1] == board[i][2] &&
          board[i][0].isNotEmpty) {
        return board[i][0];
      }
      if (board[0][i] == board[1][i] &&
          board[1][i] == board[2][i] &&
          board[0][i].isNotEmpty) {
        return board[0][i];
      }
    }

    if (board[0][0] == board[1][1] &&
        board[1][1] == board[2][2] &&
        board[0][0].isNotEmpty) {
      return board[0][0];
    }

    if (board[0][2] == board[1][1] &&
        board[1][1] == board[2][0] &&
        board[0][2].isNotEmpty) {
      return board[0][2];
    }

    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (board[i][j].isEmpty) {
          return ""; // The game is not over yet
        }
      }
    }

    return "Draw"; // The game is a draw
  }

  void _resetGame() {
    setState(() {
      board = List.generate(3, (_) => List.filled(3, ""));
      xTurn = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    String winner = _checkWinner();
    String statusText = winner.isEmpty
        ? (xTurn ? "Turno di X" : "Turno di O")
        : (winner == "Draw" ? "Pareggio" : "Vincitore: $winner");

    return Scaffold(
      appBar: AppBar(
        title: Text("Tic Tac Toe"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              statusText,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Column(
              children: List.generate(3, (i) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (j) {
                    return GestureDetector(
                      onTap: () {
                        if (winner.isEmpty) {
                          _makeMove(i, j);
                        }
                      },
                      child: Container(
                        width: 60,
                        height: 60,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                        ),
                        child: Text(
                          board[i][j],
                          style: TextStyle(fontSize: 36),
                        ),
                      ),
                    );
                  }),
                );
              }),
            ),
            SizedBox(height: 20),
            if (winner.isNotEmpty)
              ElevatedButton(
                onPressed: _resetGame,
                child: Text("Ricomincia il gioco"),
              ),
          ],
        ),
      ),
    );
  }
}
