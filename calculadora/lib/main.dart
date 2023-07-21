import 'package:flutter/material.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String n1 = '0';

  double n2 = 0.0;

  String op = '';
  void calcula(String tecla) {
    switch (tecla) {
      case '1':
      case '2':
      case '3':
      case '4':
      case '5':
      case '6':
      case '7':
      case '8':
      case '9':
      case '0':
      case ',': //concatena a virgula
        setState(() {
          n1 = n1 + tecla; //concatena
          n1 = n1.replaceAll(',', '.');
          //mostra virgula mas troca por ponto para futuro calculo

          if (n1.contains('.')) {
            //faz nada
          } else {
            //coverte para int
            int numeroInt = int.parse(n1);
            n1 = numeroInt.toString();
          }
          n1 = n1.replaceAll(',', '.');
        });
        break;
      case '-':
      case '/':
      case 'x':
      case '+':
       
        n1 = n1.replaceAll(',', '.');
        n2 = double.parse(n1); //guarda segundo numero da tecla digitada
        n1 = n1.replaceAll('.', ',');
        n1 = '0'; //so guarda na memoria, nao muda por causa do set state
        op = tecla; //guarda operaçao
        break;
      case '=':
        double res = 0.0;
        if (op == '/') {
          if (n1 == '0') {
            print('divisão por zero não é possével');
            return;
          }
          res = n2 / double.parse(n1);
        }
        if (op == '+') {
          res = n2 + double.parse(n1);
        } else if (op == '-') {
          res = n2 - double.parse(n1);
        } else if (op == 'x') {
          res = n2 * double.parse(n1);
        } else if (op == '/') {
          res = n2 / double.parse(n1);
        }
        String r = res.toStringAsFixed(2); //guarda res como string
        List<String> resPartes = r.split('.');
        //divide primeiro num e segundo num em uma lista
        if (int.parse(resPartes[1]) * 1 == 0) {
          //ve se a segunda parte conv em numero int é zero
          //nao sera necessario mostrala
          //mostra o result int
          setState(() {
            n1 = int.parse(resPartes[0]).toString();
            n1 = n1.replaceAll(',', '.');
          });
        } else {
          //se o res for double mesmo, sem o zero, mostra normal
          setState(() {
            n1 = res.toStringAsFixed(2);
            n1 = n1.replaceAll(',', '.');
          });
        }
        break;
      case 'AC':
        n1 = '0';
        break;

      case 'back':
        if (n1.length > 0) {
          //so apaga se tiver numero na string
          String ult = n1.replaceRange(n1.length - 1, n1.length, '');
          //start = indice que indica onde começa a substituiçao mas nao remove
          //end = onde termina a substituiçao, remove
          //replace = pwlo que sera substituido
          n1 = ult;
        }
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Digital7',
      ),
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          // toolbarHeight: 30,
          backgroundColor: Color.fromARGB(161, 0, 0, 0),
          title: Center(child: Text('')),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(n1, style: TextStyle(fontSize: 70, color: Colors.white)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  child: Transform.translate(
                    //move o texto
                    offset: Offset(-3, 7), //move 8px pra baixo verticalmente
                    //move -3px pro lado horizontalmente
                    child: Text(
                      'AC',
                      style: TextStyle(
                        fontSize: 55,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  onTap: () => setState(() {
                    calcula('AC');
                  }),
                ),
                Text(''),
                Text(''),
                GestureDetector(
                  child: Image.asset('assets/imagens/backspace.png',
                      //mudar so o widget e nao o height para ficar proporcional
                      width: 55),
                  onTap: () => setState(() {
                    calcula('back');
                  }),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  child: Container(
                    //mesma alt e larg para fazer um botao redondo + border radius
                    width: 80,
                    height: 80,
                    child: Center(
                      child: Text(
                        '7',
                        style: TextStyle(fontSize: 50, color: Colors.white),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(162, 60, 94, 228),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  onTap: () => calcula('7'),
                ),
                GestureDetector(
                  child: Container(
                    width: 80,
                    height: 80,
                    child: Center(
                      child: Text(
                        '8',
                        style: TextStyle(fontSize: 50, color: Colors.white),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(162, 60, 94, 228),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  onTap: () => calcula('8'),
                ),
                GestureDetector(
                  child: Container(
                    width: 80,
                    height: 80,
                    child: Center(
                      child: Text(
                        '9',
                        style: TextStyle(fontSize: 50, color: Colors.white),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(162, 60, 94, 228),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  onTap: () => calcula('9'),
                ),
                GestureDetector(
                  child: Container(
                    width: 80,
                    height: 80,
                    child: Center(
                      child: Text(
                        '÷',
                        style: TextStyle(fontSize: 50, color: Colors.white),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(209, 105, 132, 241),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  onTap: () => calcula('/'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  child: Container(
                    width: 80,
                    height: 80,
                    child: Center(
                      child: Text(
                        '4',
                        style: TextStyle(fontSize: 50, color: Colors.white),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(162, 60, 94, 228),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  onTap: () => calcula('4'),
                ),
                GestureDetector(
                  child: Container(
                    width: 80,
                    height: 80,
                    child: Center(
                      child: Text(
                        '5',
                        style: TextStyle(fontSize: 50, color: Colors.white),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(162, 60, 94, 228),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  onTap: () => calcula('5'),
                ),
                GestureDetector(
                  child: Container(
                    width: 80,
                    height: 80,
                    child: Center(
                      child: Text(
                        '6',
                        style: TextStyle(fontSize: 50, color: Colors.white),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(162, 60, 94, 228),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  onTap: () => calcula('6'),
                ),
                GestureDetector(
                  child: Container(
                    width: 80,
                    height: 80,
                    child: Center(
                      child: Text(
                        'x',
                        style: TextStyle(fontSize: 50, color: Colors.white),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(209, 105, 132, 241),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  onTap: () => calcula('x'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  child: Container(
                    width: 80,
                    height: 80,
                    child: Center(
                      child: Text(
                        '1',
                        style: TextStyle(fontSize: 50, color: Colors.white),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(162, 60, 94, 228),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  onTap: () => calcula('1'),
                ),
                GestureDetector(
                  child: Container(
                    width: 80,
                    height: 80,
                    child: Center(
                      child: Text(
                        '2',
                        style: TextStyle(fontSize: 50, color: Colors.white),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(162, 60, 94, 228),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  onTap: () => calcula('2'),
                ),
                GestureDetector(
                  child: Container(
                    width: 80,
                    height: 80,
                    child: Center(
                      child: Text(
                        '3',
                        style: TextStyle(fontSize: 50, color: Colors.white),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(162, 60, 94, 228),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  onTap: () => calcula('3'),
                ),
                GestureDetector(
                  child: Container(
                    width: 80,
                    height: 80,
                    child: Center(
                      child: Text(
                        '-',
                        style: TextStyle(fontSize: 50, color: Colors.white),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(209, 105, 132, 241),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  onTap: () => calcula('-'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  child: Container(
                    width: 80,
                    height: 80,
                    child: Center(
                      child: Text(
                        '0',
                        style: TextStyle(fontSize: 50, color: Colors.white),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(162, 60, 94, 228),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  onTap: () => calcula('0'),
                ),
                GestureDetector(
                    child: Container(
                      width: 80,
                      height: 80,
                      child: Center(
                        child: Text(
                          ',',
                          style: TextStyle(fontSize: 50, color: Colors.white),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(209, 105, 132, 241),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    onTap: () => calcula(',')),
                GestureDetector(
                  child: Container(
                    width: 80,
                    height: 80,
                    child: Center(
                      child: Text(
                        '=',
                        style: TextStyle(fontSize: 50, color: Colors.white),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(209, 105, 132, 241),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  onTap: () => calcula('='),
                ),
                GestureDetector(
                  child: Container(
                    width: 80,
                    height: 80,
                    child: Center(
                      child: Text(
                        '+',
                        style: TextStyle(fontSize: 50, color: Colors.white),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(209, 105, 132, 241),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  onTap: () => calcula('+'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
