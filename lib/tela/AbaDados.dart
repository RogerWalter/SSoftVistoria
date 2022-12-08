import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:ssoft_vistoria/util/Util.dart';
import 'package:ssoft_vistoria/tela/Principal.dart';

import '../util/Controller.dart';
class AbaDados extends StatefulWidget {
  const AbaDados({Key? key}) : super(key: key);

  @override
  State<AbaDados> createState() => _AbaDadosState();
}

class _AbaDadosState extends State<AbaDados> {
  TextEditingController _controller_data = TextEditingController();

  TextEditingController _controller_vistoriador = TextEditingController();
  FocusNode _foco_vistoriador = FocusNode();
  TextEditingController _controller_condutor = TextEditingController();
  FocusNode _foco_condutor = FocusNode();
  TextEditingController _controller_modelo = TextEditingController();
  FocusNode _foco_modelo = FocusNode();
  TextEditingController _controller_placa = TextEditingController();
  FocusNode _foco_placa = FocusNode();

  Util cores = Util();

  Controller controller_mobx = Controller();

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    controller_mobx = Provider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String data_relatorio = DateFormat('dd/MM/yyyy kk:mm:ss').format(now);
    if(controller_mobx.data.isEmpty)
      _controller_data.text = data_relatorio;
    else
      _controller_data.text = controller_mobx.data;
    _controller_vistoriador.text = controller_mobx.vistoriador;
    _controller_condutor.text = controller_mobx.condutor;
    _controller_modelo.text = controller_mobx.modelo_veiculo;
    _controller_placa.text = controller_mobx.placa;
    return Observer(
      builder: (_){
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                        child: Text(
                          "1 - Dados da Vistoria",
                          style: TextStyle(
                              color: cores.laranja_teccel,
                              fontSize: 24,
                              fontWeight: FontWeight.bold
                          ),
                        )
                    )
                  ]
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8, bottom: 8),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        height: 50,
                        child: TextField(
                          enabled: false,
                          controller: _controller_data,
                          keyboardType: TextInputType.name,
                          textCapitalization: TextCapitalization.characters,
                          textInputAction: TextInputAction.next,
                          cursorColor: cores.cor_app_bar,
                          style: TextStyle(
                              color: cores.cor_app_bar,
                              fontSize: 14,
                              fontWeight: FontWeight.bold
                          ),
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            counterText: "",
                            labelText: "Data da Vistoria",
                            labelStyle: TextStyle(color: cores.laranja_teccel, fontWeight: FontWeight.normal),
                            fillColor: Colors.transparent,
                            hoverColor: cores.cor_app_bar,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 2, color: cores.cor_app_bar),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 2, color: cores.cor_app_bar),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 2, color: cores.laranja_teccel),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          onSubmitted: (content){

                          },
                        ),
                      ),
                    )
                  ]
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8, bottom: 8),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        height: 50,
                        child: TextField(
                          controller: _controller_vistoriador,
                          focusNode: _foco_vistoriador,
                          keyboardType: TextInputType.name,
                          textCapitalization: TextCapitalization.characters,
                          textInputAction: TextInputAction.next,
                          cursorColor: cores.cor_app_bar,
                          style: TextStyle(
                              color: cores.cor_app_bar,
                              fontSize: 14,
                              fontWeight: FontWeight.bold
                          ),
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            counterText: "",
                            labelText: "Vistoriador",
                            labelStyle: TextStyle(color: cores.laranja_teccel, fontWeight: FontWeight.normal),
                            fillColor: Colors.transparent,
                            hoverColor: cores.cor_app_bar,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 2, color: cores.cor_app_bar),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 2, color: cores.laranja_teccel),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          onSubmitted: (content){

                          },
                        ),
                      ),
                    )
                  ]
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8, bottom: 8),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        height: 50,
                        child: TextField(
                          controller: _controller_condutor,
                          focusNode: _foco_condutor,
                          keyboardType: TextInputType.name,
                          textCapitalization: TextCapitalization.characters,
                          textInputAction: TextInputAction.next,
                          cursorColor: cores.cor_app_bar,
                          style: TextStyle(
                              color: cores.cor_app_bar,
                              fontSize: 14,
                              fontWeight: FontWeight.bold
                          ),
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            counterText: "",
                            labelText: "Condutor",
                            labelStyle: TextStyle(color: cores.laranja_teccel, fontWeight: FontWeight.normal),
                            fillColor: Colors.transparent,
                            hoverColor: cores.cor_app_bar,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 2, color: cores.cor_app_bar),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 2, color: cores.laranja_teccel),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          onSubmitted: (content){

                          },
                        ),
                      ),
                    )
                  ]
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8, bottom: 8),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        height: 50,
                        child: TextField(
                          controller: _controller_modelo,
                          focusNode: _foco_modelo,
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.characters,
                          textInputAction: TextInputAction.next,
                          cursorColor: cores.cor_app_bar,
                          style: TextStyle(
                              color: cores.cor_app_bar,
                              fontSize: 14,
                              fontWeight: FontWeight.bold
                          ),
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            counterText: "",
                            labelText: "Modelo do Veículo",
                            labelStyle: TextStyle(color: cores.laranja_teccel, fontWeight: FontWeight.normal),
                            fillColor: Colors.transparent,
                            hoverColor: cores.cor_app_bar,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 2, color: cores.cor_app_bar),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 2, color: cores.laranja_teccel),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          onSubmitted: (content){

                          },
                        ),
                      ),
                    )
                  ]
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8, bottom: 8),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        height: 50,
                        child: TextField(
                          controller: _controller_placa,
                          focusNode: _foco_placa,
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.characters,
                          textInputAction: TextInputAction.done,
                          cursorColor: cores.cor_app_bar,
                          style: TextStyle(
                              color: cores.cor_app_bar,
                              fontSize: 14,
                              fontWeight: FontWeight.bold
                          ),
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            counterText: "",
                            labelText: "Placa",
                            labelStyle: TextStyle(color: cores.laranja_teccel, fontWeight: FontWeight.normal),
                            fillColor: Colors.transparent,
                            hoverColor: cores.cor_app_bar,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 2, color: cores.cor_app_bar),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 2, color: cores.laranja_teccel),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ),
                    )
                  ]
              ),
            ),
            Expanded(child: Container()),
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            border: Border.all(
                                color: cores.laranja_teccel,
                                width: 2
                            ),
                          ),
                          child: Material(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            child: InkWell(
                              splashColor: cores.laranja_teccel.withOpacity(0.25),
                              hoverColor: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(12)),
                              onTap: (){
                                salvar_dados();
                              },
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Avançar",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          )
                      ),
                    )
                  ]
              ),
            ),
          ],
        );
      },
    );
  }
  salvar_dados(){
    if(_controller_vistoriador.text.isEmpty || _controller_condutor.text.isEmpty ||
        _controller_modelo.text.isEmpty || _controller_placa.text.isEmpty){
      final snackBar = SnackBar(
        content: const Text('Existem campos obrigatórios não preenchidos. Verifique e tente novamente'),
        backgroundColor: cores.cor_accent,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    else{
      controller_mobx.salvar_dados_iniciais(_controller_data.text, _controller_vistoriador.text, _controller_condutor.text, _controller_modelo.text, _controller_placa.text);
      controller_mobx.mudar_tela(1);
      /*Controller controller_novo = Controller();
      //controller_mobx = controller_novo;
      controller_mobx.alterar_vistoria_finalizada(true);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Main()
          )
      );*/
    }
  }
}
