import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/final.dart';

class Jogar extends StatefulWidget {
  List<String> cards;
  String apelido;
  Jogar({Key? key, required this.cards, required this.apelido})
      : super(key: key);

  @override
  State<Jogar> createState() => _JogarState(cards: cards, apelido: apelido);
}

class _JogarState extends State<Jogar> {
  _JogarState({required this.cards, required this.apelido});

  List<String> cards;
  List<String> viradas = List.generate(20, (index) => 'images/cardVirado.gif');
  String apelido;
  double tam = 146;
  double altura = 10;
  String ant = "null";
  String modo = "1";
  int tentativas = 0;
  int acertos = 0;
  int cartaAnteriorIndex = -1; // Declaração da variável
  bool isVerificando = false; // Variável de controle

  void reiniciarJogo() {
    setState(() {
      cards.shuffle(); // Embaralhe as cartas novamente
      viradas = List.generate(20, (index) => 'images/cardVirado.gif');
      ant = "null";
      cartaAnteriorIndex = -1;
      isVerificando = false;
      tentativas = 0;
    });
  }

  void virar(int i) {
    if (isVerificando || i == cartaAnteriorIndex) {
      return; // Evite que a mesma carta seja clicada duas vezes seguidas.
    }

    if (ant == "null") {
      setState(() {
        ant = cards[i];
        viradas[i] = cards[i];
        cartaAnteriorIndex = i;
      });
    } else {
      if (ant == cards[i]) {
        setState(() {
          ant = "null";
          viradas[i] = cards[i];
          acertos += 1;
        });
        if (acertos == 10) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  Final(nome: apelido, tentativas: tentativas),
            ),
          );
        }
      } else {
        isVerificando = true;

        setState(() {
          viradas[i] = cards[i];
          viradas[cartaAnteriorIndex] = cards[cartaAnteriorIndex];
        });

        Future.delayed(Duration(seconds: 1), () {
          setState(() {
            viradas[i] = 'images/cardVirado.gif';
            viradas[cartaAnteriorIndex] = 'images/cardVirado.gif';
            ant = "null";
            isVerificando = false;
            tentativas += 1;
          });
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Partida do $apelido"),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Container(
            child: Column(
          children: [
            Text(
              "Tentativas: $tentativas",
              style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.none,
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: altura),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              GestureDetector(
                  onTap: () => virar(0),
                  child: Image.asset(
                    viradas[0],
                    height: tam,
                  )),
              GestureDetector(
                  onTap: () => virar(1),
                  child: Image.asset(
                    viradas[1],
                    height: tam,
                  )),
              GestureDetector(
                  onTap: () => virar(2),
                  child: Image.asset(
                    viradas[2],
                    height: tam,
                  )),
              GestureDetector(
                  onTap: () => virar(3),
                  child: Image.asset(
                    viradas[3],
                    height: tam,
                  )),
              GestureDetector(
                  onTap: () => virar(16),
                  child: Image.asset(
                    viradas[16],
                    height: tam,
                  )),
            ]),
            SizedBox(
              height: 20,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              GestureDetector(
                  onTap: () => virar(4),
                  child: Image.asset(
                    viradas[4],
                    height: tam,
                  )),
              GestureDetector(
                  onTap: () => virar(5),
                  child: Image.asset(
                    viradas[5],
                    height: tam,
                  )),
              GestureDetector(
                  onTap: () => virar(6),
                  child: Image.asset(
                    viradas[6],
                    height: tam,
                  )),
              GestureDetector(
                  onTap: () => virar(7),
                  child: Image.asset(
                    viradas[7],
                    height: tam,
                  )),
              GestureDetector(
                  onTap: () => virar(17),
                  child: Image.asset(
                    viradas[17],
                    height: tam,
                  ))
            ]),
            SizedBox(
              height: 20,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              GestureDetector(
                  onTap: () => virar(8),
                  child: Image.asset(
                    viradas[8],
                    height: tam,
                  )),
              GestureDetector(
                  onTap: () => virar(9),
                  child: Image.asset(
                    viradas[9],
                    height: tam,
                  )),
              GestureDetector(
                  onTap: () => virar(10),
                  child: Image.asset(
                    viradas[10],
                    height: tam,
                  )),
              GestureDetector(
                  onTap: () => virar(11),
                  child: Image.asset(
                    viradas[11],
                    height: tam,
                  )),
              GestureDetector(
                  onTap: () => virar(18),
                  child: Image.asset(
                    viradas[18],
                    height: tam,
                  )),
            ]),
            SizedBox(
              height: 20,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              GestureDetector(
                  onTap: () => virar(12),
                  child: Image.asset(
                    viradas[12],
                    height: tam,
                  )),
              GestureDetector(
                  onTap: () => virar(13),
                  child: Image.asset(
                    viradas[13],
                    height: tam,
                  )),
              GestureDetector(
                  onTap: () => virar(14),
                  child: Image.asset(
                    viradas[14],
                    height: tam,
                  )),
              GestureDetector(
                  onTap: () => virar(15),
                  child: Image.asset(
                    viradas[15],
                    height: tam,
                  )),
              GestureDetector(
                  onTap: () => virar(19),
                  child: Image.asset(
                    viradas[19],
                    height: tam,
                  ))
            ]),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: reiniciarJogo,
              child: Text('Reiniciar Jogo'),
            )
          ],
        )),
      ),
    );
  }
}
