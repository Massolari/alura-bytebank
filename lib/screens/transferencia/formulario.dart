import 'package:bytebank/models/transferencia.dart';
import 'package:bytebank/components/input.dart';
import 'package:flutter/material.dart';

const _appBarTitle = "Criando transferência";
const _contaLabel = "Número da conta";
const _contaHint = "0000";
const _valorLabel = "Valor";
const _valorHint = "0.00";
const _textButton = "Confirmar";

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _ctrlNumeroConta = TextEditingController();
  final TextEditingController _ctrlValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(_appBarTitle)),
        body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Input(
                    controller: _ctrlNumeroConta,
                    label: _contaLabel,
                    hint: _contaHint),
                Input(
                    controller: _ctrlValor,
                    label: _valorLabel,
                    hint: _valorHint,
                    icon: Icons.monetization_on),
                RaisedButton(
                  child: Text(
                    _textButton,
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.blue,
                  onPressed: () => criar(context),
                )
              ],
            )));
  }

  criar(BuildContext context) {
    final int numeroConta = int.tryParse(_ctrlNumeroConta.text);
    final double valor = double.tryParse(_ctrlValor.text);
    List<String> errors = <String>[];
    if (numeroConta == null) {
      errors.add('Campo número da conta inválido');
    }
    if (valor == null) {
      errors.add('Campo valor inválido');
    }
    if (errors.length > 0) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(errors.join("\n")),
        backgroundColor: Colors.red,
      ));
      return;
    }
    final Transferencia transferencia = Transferencia(valor, numeroConta);
    Navigator.pop(context, transferencia);
  }
}

