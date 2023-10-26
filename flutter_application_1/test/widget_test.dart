import 'package:flutter/material.dart';

void main() {
  runApp(TicTacToeApp());
}

class TicTacToeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TicTacToeScreen(),
    );
  }
}

class TicTacToeScreen extends StatefulWidget {
  @override
  _TicTacToeScreenState createState() => _TicTacToeScreenState();
}

class _TicTacToeScreenState extends State<TicTacToeScreen> {
  List<List<String>> board =
      List.generate(3, (_) => List.generate(3, (_) => ""));
  String currentPlayer = 'X';
  String winner = '';

  void checkForWinner() {
    for (int i = 0; i < 3; i++) {
      if (board[i][0] == board[i][1] &&
          board[i][1] == board[i][2] &&
          board[i][0] != "") {
        winner = board[i][0];
        break;
      }
      if (board[0][i] == board[1][i] &&
          board[1][i] == board[2][i] &&
          board[0][i] != "") {
        winner = board[0][i];
        break;
      }
    }
    if ((board[0][0] == board[1][1] &&
            board[1][1] == board[2][2] &&
            board[0][0] != "") ||
        (board[0][2] == board[1][1] &&
            board[1][1] == board[2][0] &&
            board[0][2] != "")) {
      winner = board[1][1];
    }
  }

  void resetBoard() {
    setState(() {
      board = List.generate(3, (_) => List.generate(3, (_) => ""));
      currentPlayer = 'X';
      winner = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic Tac Toe'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Turno del giocatore: $currentPlayer',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: 9,
              itemBuilder: (context, index) {
                int row = index ~/ 3;
                int col = index % 3;
                return GestureDetector(
                  onTap: () {
                    if (board[row][col] == "" && winner == "") {
                      setState(() {
                        board[row][col] = currentPlayer;
                        checkForWinner();
                        currentPlayer = (currentPlayer == 'X') ? 'O' : 'X';
                      });
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: Center(
                      child: Text(
                        board[row][col],
                        style: TextStyle(fontSize: 32),
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            Text(
              (winner != '') ? 'Vincitore: $winner' : '',
              style: TextStyle(fontSize: 24),
            ),
            if (winner != '')
              ElevatedButton(
                onPressed: resetBoard,
                child: Text('Ricomincia'),
              ),
          ],
        ),
      ),
    );
  }
}
