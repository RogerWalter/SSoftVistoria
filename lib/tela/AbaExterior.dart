import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../util/Controller.dart';
import '../util/Util.dart';
class AbaExterior extends StatefulWidget {
  const AbaExterior({Key? key}) : super(key: key);

  @override
  State<AbaExterior> createState() => _AbaExteriorState();
}

class _AbaExteriorState extends State<AbaExterior> {
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
                            "9 - Exterior do Veículo",
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
                              labelText: "Limpeza Exterior",
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
                                              color: (controller_mobx.exterior_limpeza == "OK") ? cores.cor_app_bar : Colors.transparent,
                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(13), bottomLeft: Radius.circular(13)),
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                                                onTap: (){
                                                  controller_mobx.exterior_altera_limpeza("OK");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "OK",
                                                    style: TextStyle(
                                                      color: (controller_mobx.exterior_limpeza == "OK") ? Colors.white : Colors.black,
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
                                              color: (controller_mobx.exterior_limpeza == "RUIM") ? cores.cor_app_bar : Colors.transparent,
                                              borderRadius: BorderRadius.only(topRight: Radius.circular(13), bottomRight: Radius.circular(13)),
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
                                                onTap: (){
                                                  controller_mobx.exterior_altera_limpeza("RUIM");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "RUIM",
                                                    style: TextStyle(
                                                      color: (controller_mobx.exterior_limpeza == "RUIM") ? Colors.white : Colors.black,
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
                              labelText: "Imã com a Logo",
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
                                              color: (controller_mobx.exterior_ima == "OK") ? cores.cor_app_bar : Colors.transparent,
                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(13), bottomLeft: Radius.circular(13)),
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                                                onTap: (){
                                                  controller_mobx.exterior_altera_ima("OK");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "OK",
                                                    style: TextStyle(
                                                      color: (controller_mobx.exterior_ima == "OK") ? Colors.white : Colors.black,
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
                                              color: (controller_mobx.exterior_ima == "RUIM") ? cores.cor_app_bar : Colors.transparent,
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                onTap: (){
                                                  controller_mobx.exterior_altera_ima("RUIM");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "RUIM",
                                                    style: TextStyle(
                                                      color: (controller_mobx.exterior_ima == "RUIM") ? Colors.white : Colors.black,
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
                                              color: (controller_mobx.exterior_ima == "NÃO POSSUI") ? cores.cor_app_bar : Colors.transparent,
                                              borderRadius: BorderRadius.only(topRight: Radius.circular(13), bottomRight: Radius.circular(13)),
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
                                                onTap: (){
                                                  controller_mobx.exterior_altera_ima("NÃO POSSUI");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "NÃO POSSUI",
                                                    style: TextStyle(
                                                      color: (controller_mobx.exterior_ima == "NÃO POSSUI") ? Colors.white : Colors.black,
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
                              labelText: "Suspensão",
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
                                              color: (controller_mobx.exterior_suspensao == "OK") ? cores.cor_app_bar : Colors.transparent,
                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(13), bottomLeft: Radius.circular(13)),
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                                                onTap: (){
                                                  controller_mobx.exterior_altera_suspensao("OK");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "OK",
                                                    style: TextStyle(
                                                      color: (controller_mobx.exterior_suspensao == "OK") ? Colors.white : Colors.black,
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
                                              color: (controller_mobx.exterior_suspensao == "RUIM") ? cores.cor_app_bar : Colors.transparent,
                                              borderRadius: BorderRadius.only(topRight: Radius.circular(13), bottomRight: Radius.circular(13)),
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
                                                onTap: (){
                                                  controller_mobx.exterior_altera_suspensao("RUIM");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "RUIM",
                                                    style: TextStyle(
                                                      color: (controller_mobx.exterior_suspensao == "RUIM") ? Colors.white : Colors.black,
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
                              labelText: "Escapamento",
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
                                              color: (controller_mobx.exterior_escapamento == "OK") ? cores.cor_app_bar : Colors.transparent,
                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(13), bottomLeft: Radius.circular(13)),
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                                                onTap: (){
                                                  controller_mobx.exterior_altera_escapamento("OK");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "OK",
                                                    style: TextStyle(
                                                      color: (controller_mobx.exterior_escapamento == "OK") ? Colors.white : Colors.black,
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
                                              color: (controller_mobx.exterior_escapamento == "RUIM") ? cores.cor_app_bar : Colors.transparent,
                                              borderRadius: BorderRadius.only(topRight: Radius.circular(13), bottomRight: Radius.circular(13)),
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
                                                onTap: (){
                                                  controller_mobx.exterior_altera_escapamento("RUIM");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "RUIM",
                                                    style: TextStyle(
                                                      color: (controller_mobx.exterior_escapamento == "RUIM") ? Colors.white : Colors.black,
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
                              labelText: "Travas de Segurança",
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
                                              color: (controller_mobx.exterior_trava == "OK") ? cores.cor_app_bar : Colors.transparent,
                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(13), bottomLeft: Radius.circular(13)),
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                                                onTap: (){
                                                  controller_mobx.exterior_altera_trava("OK");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "OK",
                                                    style: TextStyle(
                                                      color: (controller_mobx.exterior_trava == "OK") ? Colors.white : Colors.black,
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
                                              color: (controller_mobx.exterior_trava == "RUIM") ? cores.cor_app_bar : Colors.transparent,
                                              borderRadius: BorderRadius.only(topRight: Radius.circular(13), bottomRight: Radius.circular(13)),
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
                                                onTap: (){
                                                  controller_mobx.exterior_altera_trava("RUIM");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "RUIM",
                                                    style: TextStyle(
                                                      color: (controller_mobx.exterior_trava == "RUIM") ? Colors.white : Colors.black,
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
                              labelText: "Fechaduras",
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
                                              color: (controller_mobx.exterior_fechaduras == "OK") ? cores.cor_app_bar : Colors.transparent,
                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(13), bottomLeft: Radius.circular(13)),
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                                                onTap: (){
                                                  controller_mobx.exterior_altera_fechaduras("OK");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "OK",
                                                    style: TextStyle(
                                                      color: (controller_mobx.exterior_fechaduras == "OK") ? Colors.white : Colors.black,
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
                                              color: (controller_mobx.exterior_fechaduras == "RUIM") ? cores.cor_app_bar : Colors.transparent,
                                              borderRadius: BorderRadius.only(topRight: Radius.circular(13), bottomRight: Radius.circular(13)),
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
                                                onTap: (){
                                                  controller_mobx.exterior_altera_fechaduras("RUIM");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "RUIM",
                                                    style: TextStyle(
                                                      color: (controller_mobx.exterior_fechaduras == "RUIM") ? Colors.white : Colors.black,
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
                              labelText: "Fechadura do Tanque",
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
                                              color: (controller_mobx.exterior_fechadura_tanque == "OK") ? cores.cor_app_bar : Colors.transparent,
                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(13), bottomLeft: Radius.circular(13)),
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                                                onTap: (){
                                                  controller_mobx.exterior_altera_fechadura_tanque("OK");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "OK",
                                                    style: TextStyle(
                                                      color: (controller_mobx.exterior_fechadura_tanque == "OK") ? Colors.white : Colors.black,
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
                                              color: (controller_mobx.exterior_fechadura_tanque == "RUIM") ? cores.cor_app_bar : Colors.transparent,
                                              borderRadius: BorderRadius.only(topRight: Radius.circular(13), bottomRight: Radius.circular(13)),
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
                                                onTap: (){
                                                  controller_mobx.exterior_altera_fechadura_tanque("RUIM");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "RUIM",
                                                    style: TextStyle(
                                                      color: (controller_mobx.exterior_fechadura_tanque == "RUIM") ? Colors.white : Colors.black,
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
                              labelText: "Limpador Dianteiro",
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
                                              color: (controller_mobx.exterior_limpador_dianteiro == "OK") ? cores.cor_app_bar : Colors.transparent,
                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(13), bottomLeft: Radius.circular(13)),
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                                                onTap: (){
                                                  controller_mobx.exterior_altera_limpador_dianteiro("OK");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "OK",
                                                    style: TextStyle(
                                                      color: (controller_mobx.exterior_limpador_dianteiro == "OK") ? Colors.white : Colors.black,
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
                                              color: (controller_mobx.exterior_limpador_dianteiro == "RUIM") ? cores.cor_app_bar : Colors.transparent,
                                              borderRadius: BorderRadius.only(topRight: Radius.circular(13), bottomRight: Radius.circular(13)),
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
                                                onTap: (){
                                                  controller_mobx.exterior_altera_limpador_dianteiro("RUIM");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "RUIM",
                                                    style: TextStyle(
                                                      color: (controller_mobx.exterior_limpador_dianteiro == "RUIM") ? Colors.white : Colors.black,
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
                              labelText: "Limpador Traseiro",
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
                                              color: (controller_mobx.exterior_limpador_traseiro == "OK") ? cores.cor_app_bar : Colors.transparent,
                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(13), bottomLeft: Radius.circular(13)),
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                                                onTap: (){
                                                  controller_mobx.exterior_altera_limpador_traseiro("OK");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "OK",
                                                    style: TextStyle(
                                                      color: (controller_mobx.exterior_limpador_traseiro == "OK") ? Colors.white : Colors.black,
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
                                              color: (controller_mobx.exterior_limpador_traseiro == "RUIM") ? cores.cor_app_bar : Colors.transparent,
                                              borderRadius: BorderRadius.only(topRight: Radius.circular(13), bottomRight: Radius.circular(13)),
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
                                                onTap: (){
                                                  controller_mobx.exterior_altera_limpador_traseiro("RUIM");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "RUIM",
                                                    style: TextStyle(
                                                      color: (controller_mobx.exterior_limpador_traseiro == "RUIM") ? Colors.white : Colors.black,
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
                              labelText: "Para-brisa",
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
                                              color: (controller_mobx.exterior_parabrisa == "OK") ? cores.cor_app_bar : Colors.transparent,
                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(13), bottomLeft: Radius.circular(13)),
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                                                onTap: (){
                                                  controller_mobx.exterior_altera_parabrisa("OK");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "OK",
                                                    style: TextStyle(
                                                      color: (controller_mobx.exterior_parabrisa == "OK") ? Colors.white : Colors.black,
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
                                              color: (controller_mobx.exterior_parabrisa == "RUIM") ? cores.cor_app_bar : Colors.transparent,
                                              borderRadius: BorderRadius.only(topRight: Radius.circular(13), bottomRight: Radius.circular(13)),
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
                                                onTap: (){
                                                  controller_mobx.exterior_altera_parabrisa("RUIM");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "RUIM",
                                                    style: TextStyle(
                                                      color: (controller_mobx.exterior_parabrisa == "RUIM") ? Colors.white : Colors.black,
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
                              labelText: "Rack de Escadas",
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
                                              color: (controller_mobx.exterior_rack == "OK") ? cores.cor_app_bar : Colors.transparent,
                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(13), bottomLeft: Radius.circular(13)),
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                                                onTap: (){
                                                  controller_mobx.exterior_altera_rack("OK");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "OK",
                                                    style: TextStyle(
                                                      color: (controller_mobx.exterior_rack == "OK") ? Colors.white : Colors.black,
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
                                              color: (controller_mobx.exterior_rack == "RUIM") ? cores.cor_app_bar : Colors.transparent,
                                              borderRadius: BorderRadius.only(topRight: Radius.circular(13), bottomRight: Radius.circular(13)),
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
                                                onTap: (){
                                                  controller_mobx.exterior_altera_rack("RUIM");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "RUIM",
                                                    style: TextStyle(
                                                      color: (controller_mobx.exterior_rack == "RUIM") ? Colors.white : Colors.black,
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
          ),
        );
      },
    );
  }
  salvar_dados(){
    if(controller_mobx.exterior_limpeza.isEmpty ||
        controller_mobx.exterior_ima.isEmpty ||
        controller_mobx.exterior_suspensao.isEmpty ||
        controller_mobx.exterior_escapamento.isEmpty ||
        controller_mobx.exterior_trava.isEmpty ||
        controller_mobx.exterior_fechaduras.isEmpty ||
        controller_mobx.exterior_fechadura_tanque.isEmpty ||
        controller_mobx.exterior_limpador_dianteiro.isEmpty ||
        controller_mobx.exterior_limpador_traseiro.isEmpty ||
        controller_mobx.exterior_parabrisa.isEmpty ||
        controller_mobx.exterior_rack.isEmpty){
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
