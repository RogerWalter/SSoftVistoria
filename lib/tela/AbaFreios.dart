import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../util/Controller.dart';
import '../util/Util.dart';
class AbaFreios extends StatefulWidget {
  const AbaFreios({Key? key}) : super(key: key);

  @override
  State<AbaFreios> createState() => _AbaFreiosState();
}

class _AbaFreiosState extends State<AbaFreios> {
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
                          "5 - Freios",
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
                      child: InputDecorator(
                          decoration: InputDecoration(
                            isDense: true,
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            counterText: "",
                            labelText: "Freio de Mão",
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
                          child: Observer(
                            builder: (_){
                              return Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(
                                          height: 50,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                                            border: Border.all(
                                                color: cores.laranja_teccel,
                                                width: 2
                                            ),
                                          ),
                                          child: Material(
                                            color: (controller_mobx.freios_de_mao == "OK") ? cores.cor_app_bar : Colors.transparent,
                                            borderRadius: BorderRadius.only(topLeft: Radius.circular(13), bottomLeft: Radius.circular(13)),
                                            child: InkWell(
                                              splashColor: cores.laranja_teccel.withOpacity(0.25),
                                              hoverColor: Colors.transparent,
                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                                              onTap: (){
                                                controller_mobx.freios_altera_de_mao("OK");
                                              },
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "OK",
                                                  style: TextStyle(
                                                    color: (controller_mobx.freios_de_mao == "OK") ? Colors.white : Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                          height: 50,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
                                            border: Border.all(
                                                color: cores.laranja_teccel,
                                                width: 2
                                            ),
                                          ),
                                          child: Material(
                                            color: (controller_mobx.freios_de_mao == "DEFEITO") ? cores.cor_app_bar : Colors.transparent,
                                            borderRadius: BorderRadius.only(topRight: Radius.circular(13), bottomRight: Radius.circular(13)),
                                            child: InkWell(
                                              splashColor: cores.laranja_teccel.withOpacity(0.25),
                                              hoverColor: Colors.transparent,
                                              borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
                                              onTap: (){
                                                controller_mobx.freios_altera_de_mao("DEFEITO");
                                              },
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "DEFEITO",
                                                  style: TextStyle(
                                                    color: (controller_mobx.freios_de_mao == "DEFEITO") ? Colors.white : Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                      ),
                                    ),
                                  ]
                              );
                            },
                          )
                      ),
                    ),

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
                      child: InputDecorator(
                          decoration: InputDecoration(
                            isDense: true,
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            counterText: "",
                            labelText: "Pedal",
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
                          child: Observer(
                            builder: (_){
                              return Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(
                                          height: 50,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                                            border: Border.all(
                                                color: cores.laranja_teccel,
                                                width: 2
                                            ),
                                          ),
                                          child: Material(
                                            color: (controller_mobx.freios_pedal == "OK") ? cores.cor_app_bar : Colors.transparent,
                                            borderRadius: BorderRadius.only(topLeft: Radius.circular(13), bottomLeft: Radius.circular(13)),
                                            child: InkWell(
                                              splashColor: cores.laranja_teccel.withOpacity(0.25),
                                              hoverColor: Colors.transparent,
                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                                              onTap: (){
                                                controller_mobx.freios_altera_pedal("OK");
                                              },
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "OK",
                                                  style: TextStyle(
                                                    color: (controller_mobx.freios_pedal == "OK") ? Colors.white : Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                          height: 50,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
                                            border: Border.all(
                                                color: cores.laranja_teccel,
                                                width: 2
                                            ),
                                          ),
                                          child: Material(
                                            color: (controller_mobx.freios_pedal == "DEFEITO") ? cores.cor_app_bar : Colors.transparent,
                                            borderRadius: BorderRadius.only(topRight: Radius.circular(13), bottomRight: Radius.circular(13)),
                                            child: InkWell(
                                              splashColor: cores.laranja_teccel.withOpacity(0.25),
                                              hoverColor: Colors.transparent,
                                              borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
                                              onTap: (){
                                                controller_mobx.freios_altera_pedal("DEFEITO");
                                              },
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "DEFEITO",
                                                  style: TextStyle(
                                                    color: (controller_mobx.freios_pedal == "DEFEITO") ? Colors.white : Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                      ),
                                    ),
                                  ]
                              );
                            },
                          )
                      ),
                    ),

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
                                controller_mobx.mudar_tela(-1);
                              },
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Voltar",
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
                    ),
                    Padding(padding: EdgeInsets.only(right: 8)),
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
    if(controller_mobx.freios_de_mao.isEmpty ||
        controller_mobx.freios_pedal.isEmpty){
      final snackBar = SnackBar(
        content: const Text('Existem campos obrigatórios não preenchidos. Verifique e tente novamente'),
        backgroundColor: cores.cor_accent,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    else{
      controller_mobx.mudar_tela(1);
    }
  }
}
