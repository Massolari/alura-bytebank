import 'package:flutter/material.dart';

import 'formulario.dart';
import 'package:bytebank/models/transferencia.dart';

const _appBarTitle = "Transferencnia";

class ListaTransferencia extends StatefulWidget {
  final List<Transferencia> _transferencias = List();
  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciaState();
  }
}

class ListaTransferenciaState extends State<ListaTransferencia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitle),
      ),
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (BuildContext context, int index) =>
            ItemTransferencia(widget._transferencias[index], this._deletar),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => FormularioTransferencia()),
            ).then((transferencia) => this._atualizar(transferencia));
          }),
    );
  }

  void _atualizar(Transferencia transferencia) {
    if (transferencia == null) {
      return;
    }
    setState(() {
      widget._transferencias.add(transferencia);
    });
  }

  void _deletar(Transferencia transferencia) {
    final int index = widget._transferencias.indexOf(transferencia);
    setState(() {
      widget._transferencias.removeAt(index);
    });
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;
  final Function deletar;

  ItemTransferencia(this._transferencia, this.deletar);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text('R\$ ' + _transferencia.valor.toString()),
        subtitle: Text(_transferencia.numeroConta.toString()),
        trailing: FlatButton(
          child: Icon(Icons.delete),
          textColor: Colors.red,
          onPressed: () => this.deletar(this._transferencia),
        ),
      ),
    );
  }
}
