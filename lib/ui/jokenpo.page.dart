import 'package:flutter/material.dart';
import 'dart:math';

class jokenpoScreen extends StatefulWidget {
  @override
  _jokenpoScreenState createState() => _jokenpoScreenState();
}

class _jokenpoScreenState extends State<jokenpoScreen> {
  double imc = 0;
  String image1 = "assets/images/branco.png";
  String image2 = "assets/images/branco.png";
  String texto = "";

  void calcularP1(int botao) {
    String image1 = "";

    if (botao == 0)
      image1 = "assets/images/pedra.png";
    else if (botao == 1)
      image1 = "assets/images/papel.png";
    else
      image1 = "assets/images/tesoura.png";

    setState(() {
      this.image1 = image1;
    });
    player2(botao);
  }

  void player2(int botao1) {
    String image2 = "";
    var r = Random();
    int numero = 0;
    numero = r.nextInt(3);
    print(numero);

    if (numero == 0)
      image2 = "assets/images/pedra.png";
    else if (numero == 1)
      image2 = "assets/images/papel.png";
    else if (numero == 2) image2 = "assets/images/tesoura.png";

    setState(() {
      this.image2 = image2;
    });

    verificarJogo(botao1, numero);
  }

  void verificarJogo(int botao1, valor2) {
    String texto = "";
    switch (botao1) {
      case 0:
        switch (valor2) {
          case 0:
            texto = "Empate!";
            break;
          case 1:
            texto = "Computador ganhou!";
            break;
          case 2:
            texto = "Jogador ganhou!";
            break;
        }
        break;
      case 1:
        switch (valor2) {
          case 0:
            texto = "Jogador ganhou!";
            break;
          case 1:
            texto = "Empate!";
            break;
          case 2:
            texto = "Computador ganhou!";
            break;
        }
        break;
      case 2:
        switch (valor2) {
          case 0:
            texto = "Computador ganhou!";
            break;
          case 1:
            texto = "Jogador ganhou!";
            break;
          case 2:
            texto = "Empate!";
            break;
        }
        break;
    }
    setState(() {
      this.texto = texto;
    });
  }

  //executei o setState() o build será executado novamente
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jokenpô'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
              flex: 1,
              child: Container(
                  margin: EdgeInsets.fromLTRB(100, 10, 0, 0),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: ElevatedButton(
                            child: Text("Pedra"),
                            onPressed: () {
                              calcularP1(0);
                            }),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: ElevatedButton(
                            child: Text("Papel"),
                            onPressed: () {
                              calcularP1(1);
                            }),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: ElevatedButton(
                            child: Text("Tesoura"),
                            onPressed: () {
                              calcularP1(2);
                            }),
                      ),
                      SizedBox(
                        height: 55,
                      )
                    ],
                  ))),
          SizedBox(
            height: 25,
          ),
          Text(
            "Jogador",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          Flexible(flex: 2, child: Image.asset(image1)),
          SizedBox(
            height: 50,
          ),
          Text("Computador",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          SizedBox(
            height: 25,
          ),
          Flexible(flex: 2, child: Image.asset(image2)),
          SizedBox(
            height: 55,
          ),
          Flexible(
            flex: 1,
            child: Text(
              texto.toString(),
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.red, fontSize: 30),
            ), //texto resultado
          ),
        ],
      ),
    );
  }
}
