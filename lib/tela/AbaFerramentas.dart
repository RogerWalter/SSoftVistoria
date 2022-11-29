import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../util/Controller.dart';
import '../util/Util.dart';
class AbaFerramentas extends StatefulWidget {
  const AbaFerramentas({Key? key}) : super(key: key);

  @override
  State<AbaFerramentas> createState() => _AbaFerramentasState();
}

class _AbaFerramentasState extends State<AbaFerramentas> {
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
        return SingleChildScrollView(
          child: Column(
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
                            "3 - Ferramentas de Trabalho",
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
                              labelText: "Furadeira",
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
                                              color: (controller_mobx.ferramentas_furadeira == "NOVA") ? cores.cor_app_bar : Colors.transparent,
                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(13), bottomLeft: Radius.circular(13)),
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                                                onTap: (){
                                                  controller_mobx.ferramentas_altera_furadeira("NOVA");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "NOVA",
                                                    style: TextStyle(
                                                      color: (controller_mobx.ferramentas_furadeira == "NOVA") ? Colors.white : Colors.black,
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
                                              border: Border.all(
                                                  color: cores.laranja_teccel,
                                                  width: 2
                                              ),
                                            ),
                                            child: Material(
                                              color: (controller_mobx.ferramentas_furadeira == "OK") ? cores.cor_app_bar : Colors.transparent,
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                onTap: (){
                                                  controller_mobx.ferramentas_altera_furadeira("OK");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "OK",
                                                    style: TextStyle(
                                                      color: (controller_mobx.ferramentas_furadeira == "OK") ? Colors.white : Colors.black,
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
                                              border: Border.all(
                                                  color: cores.laranja_teccel,
                                                  width: 2
                                              ),
                                            ),
                                            child: Material(
                                              color: (controller_mobx.ferramentas_furadeira == "RUIM") ? cores.cor_app_bar : Colors.transparent,
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                onTap: (){
                                                  controller_mobx.ferramentas_altera_furadeira("RUIM");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "RUIM",
                                                    style: TextStyle(
                                                      color: (controller_mobx.ferramentas_furadeira == "RUIM") ? Colors.white : Colors.black,
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
                                              color: (controller_mobx.ferramentas_furadeira == "NÃO TEM") ? cores.cor_app_bar : Colors.transparent,
                                              borderRadius: BorderRadius.only(topRight: Radius.circular(13), bottomRight: Radius.circular(13)),
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
                                                onTap: (){
                                                  controller_mobx.ferramentas_altera_furadeira("NÃO TEM");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "NÃO TEM",
                                                    style: TextStyle(
                                                      color: (controller_mobx.ferramentas_furadeira == "NÃO TEM") ? Colors.white : Colors.black,
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
                              labelText: "Parafusadeira",
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
                                              color: (controller_mobx.ferramentas_parafusadeira == "NOVA") ? cores.cor_app_bar : Colors.transparent,
                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(13), bottomLeft: Radius.circular(13)),
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                                                onTap: (){
                                                  controller_mobx.ferramentas_altera_parafusadeira("NOVA");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "NOVA",
                                                    style: TextStyle(
                                                      color: (controller_mobx.ferramentas_parafusadeira == "NOVA") ? Colors.white : Colors.black,
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
                                              border: Border.all(
                                                  color: cores.laranja_teccel,
                                                  width: 2
                                              ),
                                            ),
                                            child: Material(
                                              color: (controller_mobx.ferramentas_parafusadeira == "OK") ? cores.cor_app_bar : Colors.transparent,
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                onTap: (){
                                                  controller_mobx.ferramentas_altera_parafusadeira("OK");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "OK",
                                                    style: TextStyle(
                                                      color: (controller_mobx.ferramentas_parafusadeira == "OK") ? Colors.white : Colors.black,
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
                                              border: Border.all(
                                                  color: cores.laranja_teccel,
                                                  width: 2
                                              ),
                                            ),
                                            child: Material(
                                              color: (controller_mobx.ferramentas_parafusadeira == "RUIM") ? cores.cor_app_bar : Colors.transparent,
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                onTap: (){
                                                  controller_mobx.ferramentas_altera_parafusadeira("RUIM");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "RUIM",
                                                    style: TextStyle(
                                                      color: (controller_mobx.ferramentas_parafusadeira == "RUIM") ? Colors.white : Colors.black,
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
                                              color: (controller_mobx.ferramentas_parafusadeira == "NÃO TEM") ? cores.cor_app_bar : Colors.transparent,
                                              borderRadius: BorderRadius.only(topRight: Radius.circular(13), bottomRight: Radius.circular(13)),
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
                                                onTap: (){
                                                  controller_mobx.ferramentas_altera_parafusadeira("NÃO TEM");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "NÃO TEM",
                                                    style: TextStyle(
                                                      color: (controller_mobx.ferramentas_parafusadeira == "NÃO TEM") ? Colors.white : Colors.black,
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
                              labelText: "Escada de Fibra",
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
                                              color: (controller_mobx.ferramentas_escada_fibra == "NOVA") ? cores.cor_app_bar : Colors.transparent,
                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(13), bottomLeft: Radius.circular(13)),
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                                                onTap: (){
                                                  controller_mobx.ferramentas_altera_escada_fibra("NOVA");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "NOVA",
                                                    style: TextStyle(
                                                      color: (controller_mobx.ferramentas_escada_fibra == "NOVA") ? Colors.white : Colors.black,
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
                                              border: Border.all(
                                                  color: cores.laranja_teccel,
                                                  width: 2
                                              ),
                                            ),
                                            child: Material(
                                              color: (controller_mobx.ferramentas_escada_fibra == "OK") ? cores.cor_app_bar : Colors.transparent,
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                onTap: (){
                                                  controller_mobx.ferramentas_altera_escada_fibra("OK");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "OK",
                                                    style: TextStyle(
                                                      color: (controller_mobx.ferramentas_escada_fibra == "OK") ? Colors.white : Colors.black,
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
                                              border: Border.all(
                                                  color: cores.laranja_teccel,
                                                  width: 2
                                              ),
                                            ),
                                            child: Material(
                                              color: (controller_mobx.ferramentas_escada_fibra == "RUIM") ? cores.cor_app_bar : Colors.transparent,
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                onTap: (){
                                                  controller_mobx.ferramentas_altera_escada_fibra("RUIM");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "RUIM",
                                                    style: TextStyle(
                                                      color: (controller_mobx.ferramentas_escada_fibra == "RUIM") ? Colors.white : Colors.black,
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
                                              color: (controller_mobx.ferramentas_escada_fibra == "NÃO TEM") ? cores.cor_app_bar : Colors.transparent,
                                              borderRadius: BorderRadius.only(topRight: Radius.circular(13), bottomRight: Radius.circular(13)),
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
                                                onTap: (){
                                                  controller_mobx.ferramentas_altera_escada_fibra("NÃO TEM");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "NÃO TEM",
                                                    style: TextStyle(
                                                      color: (controller_mobx.ferramentas_escada_fibra == "NÃO TEM") ? Colors.white : Colors.black,
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
                              labelText: "Escada de Madeira",
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
                                              color: (controller_mobx.ferramentas_escada_madeira == "NOVA") ? cores.cor_app_bar : Colors.transparent,
                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(13), bottomLeft: Radius.circular(13)),
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                                                onTap: (){
                                                  controller_mobx.ferramentas_altera_escada_madeira("NOVA");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "NOVA",
                                                    style: TextStyle(
                                                      color: (controller_mobx.ferramentas_escada_madeira == "NOVA") ? Colors.white : Colors.black,
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
                                              border: Border.all(
                                                  color: cores.laranja_teccel,
                                                  width: 2
                                              ),
                                            ),
                                            child: Material(
                                              color: (controller_mobx.ferramentas_escada_madeira == "OK") ? cores.cor_app_bar : Colors.transparent,
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                onTap: (){
                                                  controller_mobx.ferramentas_altera_escada_madeira("OK");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "OK",
                                                    style: TextStyle(
                                                      color: (controller_mobx.ferramentas_escada_madeira == "OK") ? Colors.white : Colors.black,
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
                                              border: Border.all(
                                                  color: cores.laranja_teccel,
                                                  width: 2
                                              ),
                                            ),
                                            child: Material(
                                              color: (controller_mobx.ferramentas_escada_madeira == "RUIM") ? cores.cor_app_bar : Colors.transparent,
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                onTap: (){
                                                  controller_mobx.ferramentas_altera_escada_madeira("RUIM");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "RUIM",
                                                    style: TextStyle(
                                                      color: (controller_mobx.ferramentas_escada_madeira == "RUIM") ? Colors.white : Colors.black,
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
                                              color: (controller_mobx.ferramentas_escada_madeira == "NÃO TEM") ? cores.cor_app_bar : Colors.transparent,
                                              borderRadius: BorderRadius.only(topRight: Radius.circular(13), bottomRight: Radius.circular(13)),
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
                                                onTap: (){
                                                  controller_mobx.ferramentas_altera_escada_madeira("NÃO TEM");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "NÃO TEM",
                                                    style: TextStyle(
                                                      color: (controller_mobx.ferramentas_escada_madeira == "NÃO TEM") ? Colors.white : Colors.black,
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
                              labelText: "Cones",
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
                                              color: (controller_mobx.ferramentas_cones == "NOVOS") ? cores.cor_app_bar : Colors.transparent,
                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(13), bottomLeft: Radius.circular(13)),
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                                                onTap: (){
                                                  controller_mobx.ferramentas_altera_cones("NOVOS");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "NOVOS",
                                                    style: TextStyle(
                                                      color: (controller_mobx.ferramentas_cones == "NOVOS") ? Colors.white : Colors.black,
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
                                              border: Border.all(
                                                  color: cores.laranja_teccel,
                                                  width: 2
                                              ),
                                            ),
                                            child: Material(
                                              color: (controller_mobx.ferramentas_cones == "OK") ? cores.cor_app_bar : Colors.transparent,
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                onTap: (){
                                                  controller_mobx.ferramentas_altera_cones("OK");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "OK",
                                                    style: TextStyle(
                                                      color: (controller_mobx.ferramentas_cones == "OK") ? Colors.white : Colors.black,
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
                                              border: Border.all(
                                                  color: cores.laranja_teccel,
                                                  width: 2
                                              ),
                                            ),
                                            child: Material(
                                              color: (controller_mobx.ferramentas_cones == "RUINS") ? cores.cor_app_bar : Colors.transparent,
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                onTap: (){
                                                  controller_mobx.ferramentas_altera_cones("RUINS");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "RUINS",
                                                    style: TextStyle(
                                                      color: (controller_mobx.ferramentas_cones == "RUINS") ? Colors.white : Colors.black,
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
                                              color: (controller_mobx.ferramentas_cones == "NÃO TEM") ? cores.cor_app_bar : Colors.transparent,
                                              borderRadius: BorderRadius.only(topRight: Radius.circular(13), bottomRight: Radius.circular(13)),
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
                                                onTap: (){
                                                  controller_mobx.ferramentas_altera_cones("NÃO TEM");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "NÃO TEM",
                                                    style: TextStyle(
                                                      color: (controller_mobx.ferramentas_cones == "NÃO TEM") ? Colors.white : Colors.black,
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
                              labelText: "Alicates",
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
                                              color: (controller_mobx.ferramentas_alicates == "NOVOS") ? cores.cor_app_bar : Colors.transparent,
                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(13), bottomLeft: Radius.circular(13)),
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                                                onTap: (){
                                                  controller_mobx.ferramentas_altera_alicates("NOVOS");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "NOVOS",
                                                    style: TextStyle(
                                                      color: (controller_mobx.ferramentas_alicates == "NOVOS") ? Colors.white : Colors.black,
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
                                              border: Border.all(
                                                  color: cores.laranja_teccel,
                                                  width: 2
                                              ),
                                            ),
                                            child: Material(
                                              color: (controller_mobx.ferramentas_alicates == "OK") ? cores.cor_app_bar : Colors.transparent,
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                onTap: (){
                                                  controller_mobx.ferramentas_altera_alicates("OK");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "OK",
                                                    style: TextStyle(
                                                      color: (controller_mobx.ferramentas_alicates == "OK") ? Colors.white : Colors.black,
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
                                              border: Border.all(
                                                  color: cores.laranja_teccel,
                                                  width: 2
                                              ),
                                            ),
                                            child: Material(
                                              color: (controller_mobx.ferramentas_alicates == "RUINS") ? cores.cor_app_bar : Colors.transparent,
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                onTap: (){
                                                  controller_mobx.ferramentas_altera_alicates("RUINS");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "RUINS",
                                                    style: TextStyle(
                                                      color: (controller_mobx.ferramentas_alicates == "RUINS") ? Colors.white : Colors.black,
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
                                              color: (controller_mobx.ferramentas_alicates == "NÃO TEM") ? cores.cor_app_bar : Colors.transparent,
                                              borderRadius: BorderRadius.only(topRight: Radius.circular(13), bottomRight: Radius.circular(13)),
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
                                                onTap: (){
                                                  controller_mobx.ferramentas_altera_alicates("NÃO TEM");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "NÃO TEM",
                                                    style: TextStyle(
                                                      color: (controller_mobx.ferramentas_alicates == "NÃO TEM") ? Colors.white : Colors.black,
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
                              labelText: "Kit Conectorização",
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
                                              color: (controller_mobx.ferramentas_kit_conector == "NOVO") ? cores.cor_app_bar : Colors.transparent,
                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(13), bottomLeft: Radius.circular(13)),
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                                                onTap: (){
                                                  controller_mobx.ferramentas_altera_kit_conector("NOVO");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "NOVO",
                                                    style: TextStyle(
                                                      color: (controller_mobx.ferramentas_kit_conector == "NOVO") ? Colors.white : Colors.black,
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
                                              border: Border.all(
                                                  color: cores.laranja_teccel,
                                                  width: 2
                                              ),
                                            ),
                                            child: Material(
                                              color: (controller_mobx.ferramentas_kit_conector == "OK") ? cores.cor_app_bar : Colors.transparent,
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                onTap: (){
                                                  controller_mobx.ferramentas_altera_kit_conector("OK");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "OK",
                                                    style: TextStyle(
                                                      color: (controller_mobx.ferramentas_kit_conector == "OK") ? Colors.white : Colors.black,
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
                                              border: Border.all(
                                                  color: cores.laranja_teccel,
                                                  width: 2
                                              ),
                                            ),
                                            child: Material(
                                              color: (controller_mobx.ferramentas_kit_conector == "RUIM") ? cores.cor_app_bar : Colors.transparent,
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                onTap: (){
                                                  controller_mobx.ferramentas_altera_kit_conector("RUIM");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "RUIM",
                                                    style: TextStyle(
                                                      color: (controller_mobx.ferramentas_kit_conector == "RUIM") ? Colors.white : Colors.black,
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
                                              color: (controller_mobx.ferramentas_kit_conector == "NÃO TEM") ? cores.cor_app_bar : Colors.transparent,
                                              borderRadius: BorderRadius.only(topRight: Radius.circular(13), bottomRight: Radius.circular(13)),
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
                                                onTap: (){
                                                  controller_mobx.ferramentas_altera_kit_conector("NÃO TEM");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "NÃO TEM",
                                                    style: TextStyle(
                                                      color: (controller_mobx.ferramentas_kit_conector == "NÃO TEM") ? Colors.white : Colors.black,
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
                              labelText: "Furadeira",
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
                                              color: (controller_mobx.ferramentas_fusimec == "NOVA") ? cores.cor_app_bar : Colors.transparent,
                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(13), bottomLeft: Radius.circular(13)),
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                                                onTap: (){
                                                  controller_mobx.ferramentas_altera_fusimec("NOVA");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "NOVA",
                                                    style: TextStyle(
                                                      color: (controller_mobx.ferramentas_fusimec == "NOVA") ? Colors.white : Colors.black,
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
                                              border: Border.all(
                                                  color: cores.laranja_teccel,
                                                  width: 2
                                              ),
                                            ),
                                            child: Material(
                                              color: (controller_mobx.ferramentas_fusimec == "OK") ? cores.cor_app_bar : Colors.transparent,
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                onTap: (){
                                                  controller_mobx.ferramentas_altera_fusimec("OK");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "OK",
                                                    style: TextStyle(
                                                      color: (controller_mobx.ferramentas_fusimec == "OK") ? Colors.white : Colors.black,
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
                                              border: Border.all(
                                                  color: cores.laranja_teccel,
                                                  width: 2
                                              ),
                                            ),
                                            child: Material(
                                              color: (controller_mobx.ferramentas_fusimec == "RUIM") ? cores.cor_app_bar : Colors.transparent,
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                onTap: (){
                                                  controller_mobx.ferramentas_altera_fusimec("RUIM");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "RUIM",
                                                    style: TextStyle(
                                                      color: (controller_mobx.ferramentas_fusimec == "RUIM") ? Colors.white : Colors.black,
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
                                              color: (controller_mobx.ferramentas_fusimec == "NÃO TEM") ? cores.cor_app_bar : Colors.transparent,
                                              borderRadius: BorderRadius.only(topRight: Radius.circular(13), bottomRight: Radius.circular(13)),
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
                                                onTap: (){
                                                  controller_mobx.ferramentas_altera_fusimec("NÃO TEM");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "NÃO TEM",
                                                    style: TextStyle(
                                                      color: (controller_mobx.ferramentas_fusimec == "NÃO TEM") ? Colors.white : Colors.black,
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
                              labelText: "Extensão Elétrica",
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
                                              color: (controller_mobx.ferramentas_extensao == "NOVA") ? cores.cor_app_bar : Colors.transparent,
                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(13), bottomLeft: Radius.circular(13)),
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                                                onTap: (){
                                                  controller_mobx.ferramentas_altera_extensao("NOVA");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "NOVA",
                                                    style: TextStyle(
                                                      color: (controller_mobx.ferramentas_extensao == "NOVA") ? Colors.white : Colors.black,
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
                                              border: Border.all(
                                                  color: cores.laranja_teccel,
                                                  width: 2
                                              ),
                                            ),
                                            child: Material(
                                              color: (controller_mobx.ferramentas_extensao == "OK") ? cores.cor_app_bar : Colors.transparent,
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                onTap: (){
                                                  controller_mobx.ferramentas_altera_extensao("OK");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "OK",
                                                    style: TextStyle(
                                                      color: (controller_mobx.ferramentas_extensao == "OK") ? Colors.white : Colors.black,
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
                                              border: Border.all(
                                                  color: cores.laranja_teccel,
                                                  width: 2
                                              ),
                                            ),
                                            child: Material(
                                              color: (controller_mobx.ferramentas_extensao == "RUIM") ? cores.cor_app_bar : Colors.transparent,
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                onTap: (){
                                                  controller_mobx.ferramentas_altera_extensao("RUIM");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "RUIM",
                                                    style: TextStyle(
                                                      color: (controller_mobx.ferramentas_extensao == "RUIM") ? Colors.white : Colors.black,
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
                                              color: (controller_mobx.ferramentas_extensao == "NÃO TEM") ? cores.cor_app_bar : Colors.transparent,
                                              borderRadius: BorderRadius.only(topRight: Radius.circular(13), bottomRight: Radius.circular(13)),
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
                                                onTap: (){
                                                  controller_mobx.ferramentas_altera_extensao("NÃO TEM");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "NÃO TEM",
                                                    style: TextStyle(
                                                      color: (controller_mobx.ferramentas_extensao == "NÃO TEM") ? Colors.white : Colors.black,
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
                              labelText: "Cinto",
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
                                              color: (controller_mobx.ferramentas_cinto == "NOVO") ? cores.cor_app_bar : Colors.transparent,
                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(13), bottomLeft: Radius.circular(13)),
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                                                onTap: (){
                                                  controller_mobx.ferramentas_altera_cinto("NOVO");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "NOVO",
                                                    style: TextStyle(
                                                      color: (controller_mobx.ferramentas_cinto == "NOVO") ? Colors.white : Colors.black,
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
                                              border: Border.all(
                                                  color: cores.laranja_teccel,
                                                  width: 2
                                              ),
                                            ),
                                            child: Material(
                                              color: (controller_mobx.ferramentas_cinto == "OK") ? cores.cor_app_bar : Colors.transparent,
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                onTap: (){
                                                  controller_mobx.ferramentas_altera_cinto("OK");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "OK",
                                                    style: TextStyle(
                                                      color: (controller_mobx.ferramentas_cinto == "OK") ? Colors.white : Colors.black,
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
                                              border: Border.all(
                                                  color: cores.laranja_teccel,
                                                  width: 2
                                              ),
                                            ),
                                            child: Material(
                                              color: (controller_mobx.ferramentas_cinto == "RUIM") ? cores.cor_app_bar : Colors.transparent,
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                onTap: (){
                                                  controller_mobx.ferramentas_altera_cinto("RUIM");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "RUIM",
                                                    style: TextStyle(
                                                      color: (controller_mobx.ferramentas_cinto == "RUIM") ? Colors.white : Colors.black,
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
                                              color: (controller_mobx.ferramentas_cinto == "NÃO TEM") ? cores.cor_app_bar : Colors.transparent,
                                              borderRadius: BorderRadius.only(topRight: Radius.circular(13), bottomRight: Radius.circular(13)),
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
                                                onTap: (){
                                                  controller_mobx.ferramentas_altera_cinto("NÃO TEM");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "NÃO TEM",
                                                    style: TextStyle(
                                                      color: (controller_mobx.ferramentas_cinto == "NÃO TEM") ? Colors.white : Colors.black,
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
                              labelText: "Luva de BT",
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
                                              color: (controller_mobx.ferramentas_luva_bt == "NOVA") ? cores.cor_app_bar : Colors.transparent,
                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(13), bottomLeft: Radius.circular(13)),
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                                                onTap: (){
                                                  controller_mobx.ferramentas_altera_luva_bt("NOVA");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "NOVA",
                                                    style: TextStyle(
                                                      color: (controller_mobx.ferramentas_luva_bt == "NOVA") ? Colors.white : Colors.black,
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
                                              border: Border.all(
                                                  color: cores.laranja_teccel,
                                                  width: 2
                                              ),
                                            ),
                                            child: Material(
                                              color: (controller_mobx.ferramentas_luva_bt == "OK") ? cores.cor_app_bar : Colors.transparent,
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                onTap: (){
                                                  controller_mobx.ferramentas_altera_luva_bt("OK");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "OK",
                                                    style: TextStyle(
                                                      color: (controller_mobx.ferramentas_luva_bt == "OK") ? Colors.white : Colors.black,
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
                                              border: Border.all(
                                                  color: cores.laranja_teccel,
                                                  width: 2
                                              ),
                                            ),
                                            child: Material(
                                              color: (controller_mobx.ferramentas_luva_bt == "RUIM") ? cores.cor_app_bar : Colors.transparent,
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                onTap: (){
                                                  controller_mobx.ferramentas_altera_luva_bt("RUIM");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "RUIM",
                                                    style: TextStyle(
                                                      color: (controller_mobx.ferramentas_luva_bt == "RUIM") ? Colors.white : Colors.black,
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
                                              color: (controller_mobx.ferramentas_luva_bt == "NÃO TEM") ? cores.cor_app_bar : Colors.transparent,
                                              borderRadius: BorderRadius.only(topRight: Radius.circular(13), bottomRight: Radius.circular(13)),
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
                                                onTap: (){
                                                  controller_mobx.ferramentas_altera_luva_bt("NÃO TEM");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "NÃO TEM",
                                                    style: TextStyle(
                                                      color: (controller_mobx.ferramentas_luva_bt == "NÃO TEM") ? Colors.white : Colors.black,
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
                              labelText: "Linha de Vida",
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
                                              color: (controller_mobx.ferramentas_linha_vida == "NOVA") ? cores.cor_app_bar : Colors.transparent,
                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(13), bottomLeft: Radius.circular(13)),
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                                                onTap: (){
                                                  controller_mobx.ferramentas_altera_linha_vida("NOVA");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "NOVA",
                                                    style: TextStyle(
                                                      color: (controller_mobx.ferramentas_linha_vida == "NOVA") ? Colors.white : Colors.black,
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
                                              border: Border.all(
                                                  color: cores.laranja_teccel,
                                                  width: 2
                                              ),
                                            ),
                                            child: Material(
                                              color: (controller_mobx.ferramentas_linha_vida == "OK") ? cores.cor_app_bar : Colors.transparent,
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                onTap: (){
                                                  controller_mobx.ferramentas_altera_linha_vida("OK");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "OK",
                                                    style: TextStyle(
                                                      color: (controller_mobx.ferramentas_linha_vida == "OK") ? Colors.white : Colors.black,
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
                                              border: Border.all(
                                                  color: cores.laranja_teccel,
                                                  width: 2
                                              ),
                                            ),
                                            child: Material(
                                              color: (controller_mobx.ferramentas_linha_vida == "RUIM") ? cores.cor_app_bar : Colors.transparent,
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                onTap: (){
                                                  controller_mobx.ferramentas_altera_linha_vida("RUIM");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "RUIM",
                                                    style: TextStyle(
                                                      color: (controller_mobx.ferramentas_linha_vida == "RUIM") ? Colors.white : Colors.black,
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
                                              color: (controller_mobx.ferramentas_linha_vida == "NÃO TEM") ? cores.cor_app_bar : Colors.transparent,
                                              borderRadius: BorderRadius.only(topRight: Radius.circular(13), bottomRight: Radius.circular(13)),
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
                                                onTap: (){
                                                  controller_mobx.ferramentas_altera_linha_vida("NÃO TEM");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "NÃO TEM",
                                                    style: TextStyle(
                                                      color: (controller_mobx.ferramentas_linha_vida == "NÃO TEM") ? Colors.white : Colors.black,
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
                                  controller_mobx.mudar_tela(1);
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
          ),
        );
      },
    );
  }
}
