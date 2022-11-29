import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../util/Controller.dart';
import '../util/Util.dart';
class AbaInterior extends StatefulWidget {
  const AbaInterior({Key? key}) : super(key: key);

  @override
  State<AbaInterior> createState() => _AbaInteriorState();
}

class _AbaInteriorState extends State<AbaInterior> {
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
                          "8 - Interior do Veículo",
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
                            labelText: "Limpeza Interior",
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
                                            color: (controller_mobx.interior_limpeza == "OK") ? cores.cor_app_bar : Colors.transparent,
                                            borderRadius: BorderRadius.only(topLeft: Radius.circular(13), bottomLeft: Radius.circular(13)),
                                            child: InkWell(
                                              splashColor: cores.laranja_teccel.withOpacity(0.25),
                                              hoverColor: Colors.transparent,
                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                                              onTap: (){
                                                controller_mobx.interior_altera_limpeza("OK");
                                              },
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "OK",
                                                  style: TextStyle(
                                                    color: (controller_mobx.interior_limpeza == "OK") ? Colors.white : Colors.black,
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
                                            color: (controller_mobx.interior_limpeza == "RUIM") ? cores.cor_app_bar : Colors.transparent,
                                            borderRadius: BorderRadius.only(topRight: Radius.circular(13), bottomRight: Radius.circular(13)),
                                            child: InkWell(
                                              splashColor: cores.laranja_teccel.withOpacity(0.25),
                                              hoverColor: Colors.transparent,
                                              borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
                                              onTap: (){
                                                controller_mobx.interior_altera_limpeza("RUIM");
                                              },
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "RUIM",
                                                  style: TextStyle(
                                                    color: (controller_mobx.interior_limpeza == "RUIM") ? Colors.white : Colors.black,
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
                            labelText: "Cinto de Segurança",
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
                                            color: (controller_mobx.interior_cinto == "OK") ? cores.cor_app_bar : Colors.transparent,
                                            borderRadius: BorderRadius.only(topLeft: Radius.circular(13), bottomLeft: Radius.circular(13)),
                                            child: InkWell(
                                              splashColor: cores.laranja_teccel.withOpacity(0.25),
                                              hoverColor: Colors.transparent,
                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                                              onTap: (){
                                                controller_mobx.interior_altera_cinto("OK");
                                              },
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "OK",
                                                  style: TextStyle(
                                                    color: (controller_mobx.interior_cinto == "OK") ? Colors.white : Colors.black,
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
                                            color: (controller_mobx.interior_cinto == "RUIM") ? cores.cor_app_bar : Colors.transparent,
                                            borderRadius: BorderRadius.only(topRight: Radius.circular(13), bottomRight: Radius.circular(13)),
                                            child: InkWell(
                                              splashColor: cores.laranja_teccel.withOpacity(0.25),
                                              hoverColor: Colors.transparent,
                                              borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
                                              onTap: (){
                                                controller_mobx.interior_altera_cinto("RUIM");
                                              },
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "RUIM",
                                                  style: TextStyle(
                                                    color: (controller_mobx.interior_cinto == "RUIM") ? Colors.white : Colors.black,
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
                            labelText: "Painel",
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
                                            color: (controller_mobx.interior_painel == "OK") ? cores.cor_app_bar : Colors.transparent,
                                            borderRadius: BorderRadius.only(topLeft: Radius.circular(13), bottomLeft: Radius.circular(13)),
                                            child: InkWell(
                                              splashColor: cores.laranja_teccel.withOpacity(0.25),
                                              hoverColor: Colors.transparent,
                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                                              onTap: (){
                                                controller_mobx.interior_altera_painel("OK");
                                              },
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "OK",
                                                  style: TextStyle(
                                                    color: (controller_mobx.interior_painel == "OK") ? Colors.white : Colors.black,
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
                                            color: (controller_mobx.interior_painel == "RUIM") ? cores.cor_app_bar : Colors.transparent,
                                            borderRadius: BorderRadius.only(topRight: Radius.circular(13), bottomRight: Radius.circular(13)),
                                            child: InkWell(
                                              splashColor: cores.laranja_teccel.withOpacity(0.25),
                                              hoverColor: Colors.transparent,
                                              borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
                                              onTap: (){
                                                controller_mobx.interior_altera_painel("RUIM");
                                              },
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "RUIM",
                                                  style: TextStyle(
                                                    color: (controller_mobx.interior_painel == "RUIM") ? Colors.white : Colors.black,
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
                            labelText: "Tapetes",
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
                                            color: (controller_mobx.interior_tapetes == "OK") ? cores.cor_app_bar : Colors.transparent,
                                            borderRadius: BorderRadius.only(topLeft: Radius.circular(13), bottomLeft: Radius.circular(13)),
                                            child: InkWell(
                                              splashColor: cores.laranja_teccel.withOpacity(0.25),
                                              hoverColor: Colors.transparent,
                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                                              onTap: (){
                                                controller_mobx.interior_altera_tapetes("OK");
                                              },
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "OK",
                                                  style: TextStyle(
                                                    color: (controller_mobx.interior_tapetes == "OK") ? Colors.white : Colors.black,
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
                                            color: (controller_mobx.interior_tapetes == "RUIM") ? cores.cor_app_bar : Colors.transparent,
                                            borderRadius: BorderRadius.only(topRight: Radius.circular(13), bottomRight: Radius.circular(13)),
                                            child: InkWell(
                                              splashColor: cores.laranja_teccel.withOpacity(0.25),
                                              hoverColor: Colors.transparent,
                                              borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
                                              onTap: (){
                                                controller_mobx.interior_altera_tapetes("RUIM");
                                              },
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "RUIM",
                                                  style: TextStyle(
                                                    color: (controller_mobx.interior_tapetes == "RUIM") ? Colors.white : Colors.black,
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
                            labelText: "Bancos",
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
                                            color: (controller_mobx.interior_bancos == "OK") ? cores.cor_app_bar : Colors.transparent,
                                            borderRadius: BorderRadius.only(topLeft: Radius.circular(13), bottomLeft: Radius.circular(13)),
                                            child: InkWell(
                                              splashColor: cores.laranja_teccel.withOpacity(0.25),
                                              hoverColor: Colors.transparent,
                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                                              onTap: (){
                                                controller_mobx.interior_altera_bancos("OK");
                                              },
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "OK",
                                                  style: TextStyle(
                                                    color: (controller_mobx.interior_bancos == "OK") ? Colors.white : Colors.black,
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
                                            color: (controller_mobx.interior_bancos == "RUIM") ? cores.cor_app_bar : Colors.transparent,
                                            borderRadius: BorderRadius.only(topRight: Radius.circular(13), bottomRight: Radius.circular(13)),
                                            child: InkWell(
                                              splashColor: cores.laranja_teccel.withOpacity(0.25),
                                              hoverColor: Colors.transparent,
                                              borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
                                              onTap: (){
                                                controller_mobx.interior_altera_bancos("RUIM");
                                              },
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "RUIM",
                                                  style: TextStyle(
                                                    color: (controller_mobx.interior_bancos == "RUIM") ? Colors.white : Colors.black,
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
                            labelText: "Macaco",
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
                                            color: (controller_mobx.interior_macaco == "OK") ? cores.cor_app_bar : Colors.transparent,
                                            borderRadius: BorderRadius.only(topLeft: Radius.circular(13), bottomLeft: Radius.circular(13)),
                                            child: InkWell(
                                              splashColor: cores.laranja_teccel.withOpacity(0.25),
                                              hoverColor: Colors.transparent,
                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                                              onTap: (){
                                                controller_mobx.interior_altera_macaco("OK");
                                              },
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "OK",
                                                  style: TextStyle(
                                                    color: (controller_mobx.interior_macaco == "OK") ? Colors.white : Colors.black,
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
                                            color: (controller_mobx.interior_macaco == "RUIM") ? cores.cor_app_bar : Colors.transparent,
                                            borderRadius: BorderRadius.only(topRight: Radius.circular(13), bottomRight: Radius.circular(13)),
                                            child: InkWell(
                                              splashColor: cores.laranja_teccel.withOpacity(0.25),
                                              hoverColor: Colors.transparent,
                                              borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
                                              onTap: (){
                                                controller_mobx.interior_altera_macaco("RUIM");
                                              },
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "RUIM",
                                                  style: TextStyle(
                                                    color: (controller_mobx.interior_macaco == "RUIM") ? Colors.white : Colors.black,
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
    if(controller_mobx.interior_limpeza.isEmpty ||
        controller_mobx.interior_cinto.isEmpty ||
        controller_mobx.interior_painel.isEmpty ||
        controller_mobx.interior_tapetes.isEmpty ||
        controller_mobx.interior_bancos.isEmpty ||
        controller_mobx.interior_macaco.isEmpty){
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
