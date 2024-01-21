import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/jogar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController apelido = TextEditingController();

  bool? _valCheck = false;
  bool? _valCheck2 = false;

  void _jogar() {
    String apelidoValue = apelido.text;
    if (apelidoValue.isNotEmpty && (_valCheck == true || _valCheck2 == true)) {
      List<String> personagens = [
        'images/carta0.gif',
        'images/carta1.gif',
        'images/carta2.gif',
        'images/carta3.gif',
        'images/carta4.gif',
        'images/carta5.gif',
        'images/carta6.gif',
        'images/carta7.gif',
        'images/carta8.gif',
        'images/carta9.gif',
      ];

      List<String> numcards = [
        'images/cartanum1.gif',
        'images/cartanum2.gif',
        'images/cartanum3.gif',
        'images/cartanum4.gif',
        'images/cartanum5.gif',
        'images/cartanum6.gif',
        'images/cartanum7.gif',
        'images/cartanum8.gif',
        'images/cartanum9.gif',
        'images/cartanum10.gif',
      ];

      List<String> cartas = [];

      if (_valCheck == true && _valCheck2 == true) {
        print("Jogará com PERSONAGENS e NUMEROS");
        cartas.addAll(personagens.sublist(0, 5));
        cartas.addAll(personagens.sublist(0, 5));
        cartas.addAll(numcards.sublist(0, 5));
        cartas.addAll(numcards.sublist(0, 5));
      } else if (_valCheck == true) {
        print("Jogará com PERSONAGENS");
        cartas.addAll(personagens);
        cartas.addAll(personagens);
      } else if (_valCheck2 == true) {
        print("Jogará com NUMEROS");
        cartas.addAll(numcards);
        cartas.addAll(numcards);
      } else {
        print("Escolha pelo menos um modo de Jogo");
      }

      cartas.shuffle();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Jogar(
            cards: cartas,
            apelido: apelidoValue,
          ),
        ), // Navega para a página Jogar
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Preencha todos os campos"),
            content: Text(
              "Por favor, verifique se todos os campos foram preenchidos para iniciar.",
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Center(
          child: Text(
            "Jogo da Memória",
            style: TextStyle(
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 30),
                Image.asset(
                  'images/logo.gif',
                  height: 200,
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.all(16),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    controller: apelido,
                    decoration: InputDecoration(
                      labelText: "Digite o apelido:",
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    maxLength: 10,
                    maxLengthEnforcement: MaxLengthEnforcement.none,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.green,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                CheckboxListTile(
                  value: _valCheck,
                  onChanged: (bool? val) {
                    setState(() {
                      _valCheck = val;
                    });
                  },
                  title: Text(
                    "Personagens",
                    style: TextStyle(
                      fontSize: 30,
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                    ),
                  ),
                  secondary: Icon(Icons.add_box),
                  activeColor: Colors.green,
                  checkColor: Colors.white,
                  tileColor: Colors.grey,
                ),
                CheckboxListTile(
                  value: _valCheck2,
                  onChanged: (bool? val) {
                    setState(() {
                      _valCheck2 = val;
                    });
                  },
                  title: Text(
                    "Números",
                    style: TextStyle(
                      fontSize: 30,
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                    ),
                  ),
                  secondary: Icon(Icons.add_box),
                  activeColor: Colors.green,
                  checkColor: Colors.white,
                  tileColor: Colors.grey,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _jogar,
                  child: Text(
                    "Jogar",
                    style: TextStyle(fontSize: 40, color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.purple),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
