import 'package:flutter/material.dart';
import 'package:flutter_application_2/home.dart';

class Final extends StatefulWidget {
  String nome;
  int tentativas;

  Final({Key? key, required this.nome, required this.tentativas})
      : super(key: key);

  @override
  State<Final> createState() => _FinalState(nome: nome, tentativas: tentativas);
}

class _FinalState extends State<Final> {
  String nome;
  int tentativas;
  void _reiniciar() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => Home()),
      (Route<dynamic> route) =>
          false, // Essa função remove todos os outros destinos da pilha
    );
  }

  _FinalState({required this.nome, required this.tentativas});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
            child: Column(
          children: [
            SizedBox(
              height: 130,
            ),
            Text(
              "Parabéns $nome",
              style: TextStyle(
                fontSize: 30,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Image.asset(
              'images/trofeu.png',
              height: 200,
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              "Numero de tentativas : $tentativas",
              style: TextStyle(
                fontSize: 30,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 100,
            ),
            ElevatedButton(
              onPressed: _reiniciar,
              child: Text(
                "Reiniciar",
                style: TextStyle(fontSize: 40, color: Colors.white),
              ),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.purple),
              ),
            )
          ],
        )));
  }
}
