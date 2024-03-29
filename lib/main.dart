import 'package:bytebank/screens/transferencia/lista.dart';
import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // initialRoute: '/',
        // routes: {
        //   '/': (context) => ListaTransferencia(),
        //   '/add': (context) => FormularioTransferencia()
        // },
       theme: ThemeData(
         primaryColor: Colors.green[900],
         accentColor: Colors.blueAccent[700],
         buttonTheme: ButtonThemeData(
           buttonColor: Colors.blueAccent[700],
           textTheme: ButtonTextTheme.primary,
         )
       ),
//        theme: ThemeData.dark(),
        home: ListaTransferencia()
    );
  }
}

