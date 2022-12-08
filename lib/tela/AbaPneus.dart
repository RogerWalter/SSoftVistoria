import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../util/Controller.dart';
import '../util/Util.dart';
class AbaPneus extends StatefulWidget {
  const AbaPneus({Key? key}) : super(key: key);

  @override
  State<AbaPneus> createState() => _AbaPneusState();
}

class _AbaPneusState extends State<AbaPneus> {
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
                            "6 - Pneus",
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
                              labelText: "Balanceamento",
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
                                              color: (controller_mobx.pneus_balanceamento == "OK") ? cores.cor_app_bar : Colors.transparent,
                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(13), bottomLeft: Radius.circular(13)),
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                                                onTap: (){
                                                  controller_mobx.pneus_altera_balanceamento("OK");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "OK",
                                                    style: TextStyle(
                                                      color: (controller_mobx.pneus_balanceamento == "OK") ? Colors.white : Colors.black,
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
                                              color: (controller_mobx.pneus_balanceamento == "RUIM") ? cores.cor_app_bar : Colors.transparent,
                                              borderRadius: BorderRadius.only(topRight: Radius.circular(13), bottomRight: Radius.circular(13)),
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
                                                onTap: (){
                                                  controller_mobx.pneus_altera_balanceamento("RUIM");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "RUIM",
                                                    style: TextStyle(
                                                      color: (controller_mobx.pneus_balanceamento == "RUIM") ? Colors.white : Colors.black,
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
                              labelText: "Frontal Direito",
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
                                              color: (controller_mobx.pneus_frontal_direito == "OK") ? cores.cor_app_bar : Colors.transparent,
                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(13), bottomLeft: Radius.circular(13)),
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                                                onTap: (){
                                                  controller_mobx.pneus_altera_frontal_direito("OK");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "OK",
                                                    style: TextStyle(
                                                      color: (controller_mobx.pneus_frontal_direito == "OK") ? Colors.white : Colors.black,
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
                                              color: (controller_mobx.pneus_frontal_direito == "RUIM") ? cores.cor_app_bar : Colors.transparent,
                                              borderRadius: BorderRadius.only(topRight: Radius.circular(13), bottomRight: Radius.circular(13)),
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
                                                onTap: (){
                                                  controller_mobx.pneus_altera_frontal_direito("RUIM");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "RUIM",
                                                    style: TextStyle(
                                                      color: (controller_mobx.pneus_frontal_direito == "RUIM") ? Colors.white : Colors.black,
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
                              labelText: "Frontal Esquerdo",
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
                                              color: (controller_mobx.pneus_frontal_esquerdo == "OK") ? cores.cor_app_bar : Colors.transparent,
                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(13), bottomLeft: Radius.circular(13)),
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                                                onTap: (){
                                                  controller_mobx.pneus_altera_frontal_esquerdo("OK");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "OK",
                                                    style: TextStyle(
                                                      color: (controller_mobx.pneus_frontal_esquerdo == "OK") ? Colors.white : Colors.black,
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
                                              color: (controller_mobx.pneus_frontal_esquerdo == "RUIM") ? cores.cor_app_bar : Colors.transparent,
                                              borderRadius: BorderRadius.only(topRight: Radius.circular(13), bottomRight: Radius.circular(13)),
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
                                                onTap: (){
                                                  controller_mobx.pneus_altera_frontal_esquerdo("RUIM");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "RUIM",
                                                    style: TextStyle(
                                                      color: (controller_mobx.pneus_frontal_esquerdo == "RUIM") ? Colors.white : Colors.black,
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
                              labelText: "Traseiro Direito",
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
                                              color: (controller_mobx.pneus_traseiro_direito == "OK") ? cores.cor_app_bar : Colors.transparent,
                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(13), bottomLeft: Radius.circular(13)),
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                                                onTap: (){
                                                  controller_mobx.pneus_altera_traseiro_direito("OK");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "OK",
                                                    style: TextStyle(
                                                      color: (controller_mobx.pneus_traseiro_direito == "OK") ? Colors.white : Colors.black,
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
                                              color: (controller_mobx.pneus_traseiro_direito == "RUIM") ? cores.cor_app_bar : Colors.transparent,
                                              borderRadius: BorderRadius.only(topRight: Radius.circular(13), bottomRight: Radius.circular(13)),
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
                                                onTap: (){
                                                  controller_mobx.pneus_altera_traseiro_direito("RUIM");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "RUIM",
                                                    style: TextStyle(
                                                      color: (controller_mobx.pneus_traseiro_direito == "RUIM") ? Colors.white : Colors.black,
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
                              labelText: "Traseiro Esquerdo",
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
                                              color: (controller_mobx.pneus_traseiro_esquerdo == "OK") ? cores.cor_app_bar : Colors.transparent,
                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(13), bottomLeft: Radius.circular(13)),
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                                                onTap: (){
                                                  controller_mobx.pneus_altera_traseiro_esquerdo("OK");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "OK",
                                                    style: TextStyle(
                                                      color: (controller_mobx.pneus_traseiro_esquerdo == "OK") ? Colors.white : Colors.black,
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
                                              color: (controller_mobx.pneus_traseiro_esquerdo == "RUIM") ? cores.cor_app_bar : Colors.transparent,
                                              borderRadius: BorderRadius.only(topRight: Radius.circular(13), bottomRight: Radius.circular(13)),
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
                                                onTap: (){
                                                  controller_mobx.pneus_altera_traseiro_esquerdo("RUIM");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "RUIM",
                                                    style: TextStyle(
                                                      color: (controller_mobx.pneus_traseiro_esquerdo == "RUIM") ? Colors.white : Colors.black,
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
                              labelText: "Estepe",
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
                                              color: (controller_mobx.pneus_step == "OK") ? cores.cor_app_bar : Colors.transparent,
                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(13), bottomLeft: Radius.circular(13)),
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                                                onTap: (){
                                                  controller_mobx.pneus_altera_step("OK");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "OK",
                                                    style: TextStyle(
                                                      color: (controller_mobx.pneus_step == "OK") ? Colors.white : Colors.black,
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
                                              color: (controller_mobx.pneus_step == "RUIM") ? cores.cor_app_bar : Colors.transparent,
                                              borderRadius: BorderRadius.only(topRight: Radius.circular(13), bottomRight: Radius.circular(13)),
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
                                                onTap: (){
                                                  controller_mobx.pneus_altera_step("RUIM");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "RUIM",
                                                    style: TextStyle(
                                                      color: (controller_mobx.pneus_step == "RUIM") ? Colors.white : Colors.black,
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
                        child: Padding(
                          padding: EdgeInsets.only(right: 4),
                          child: InputDecorator(
                              decoration: InputDecoration(
                                isDense: true,
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                                counterText: "",
                                labelText: "Foto Frontal Direito",
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
                                  return Container(
                                      height: 150,
                                      child: Material(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.all(Radius.circular(13)),
                                        child: InkWell(
                                          splashColor: cores.laranja_teccel.withOpacity(0.25),
                                          hoverColor: Colors.transparent,
                                          borderRadius: BorderRadius.circular(15),
                                          onTap: (){
                                            tirar_foto(1);
                                          },
                                          child: Align(
                                              alignment: Alignment.center,
                                              child: (controller_mobx.pneus_foto_fro_dir == null) ? Icon(Icons.add, color: Colors.black26, size: 50,) : Image.file(controller_mobx.pneus_foto_fro_dir)
                                          ),
                                        ),
                                      )
                                  );
                                },
                              )
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 4),
                          child: InputDecorator(
                              decoration: InputDecoration(
                                isDense: true,
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                                counterText: "",
                                labelText: "Foto Frontal Esquerdo",
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
                                  return Container(
                                      height: 150,
                                      child: Material(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.all(Radius.circular(13)),
                                        child: InkWell(
                                          splashColor: cores.laranja_teccel.withOpacity(0.25),
                                          hoverColor: Colors.transparent,
                                          borderRadius: BorderRadius.circular(15),
                                          onTap: (){
                                            tirar_foto(2);
                                          },
                                          child: Align(
                                              alignment: Alignment.center,
                                              child: (controller_mobx.pneus_foto_fro_esq == null) ? Icon(Icons.add, color: Colors.black26, size: 50,) : Image.file(controller_mobx.pneus_foto_fro_esq)
                                          ),
                                        ),
                                      )
                                  );
                                },
                              )
                          ),
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
                        child: Padding(
                          padding: EdgeInsets.only(right: 4),
                          child: InputDecorator(
                              decoration: InputDecoration(
                                isDense: true,
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                                counterText: "",
                                labelText: "Foto Traseiro Direito",
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
                                  return Container(
                                      height: 150,
                                      child: Material(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.all(Radius.circular(13)),
                                        child: InkWell(
                                          splashColor: cores.laranja_teccel.withOpacity(0.25),
                                          hoverColor: Colors.transparent,
                                          borderRadius: BorderRadius.circular(15),
                                          onTap: (){
                                            tirar_foto(3);
                                          },
                                          child: Align(
                                              alignment: Alignment.center,
                                              child: (controller_mobx.pneus_foto_tra_dir == null) ? Icon(Icons.add, color: Colors.black26, size: 50,) : Image.file(controller_mobx.pneus_foto_tra_dir)
                                          ),
                                        ),
                                      )
                                  );
                                },
                              )
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 4),
                          child: InputDecorator(
                              decoration: InputDecoration(
                                isDense: true,
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                                counterText: "",
                                labelText: "Foto Traseiro Esquerdo",
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
                                  return Container(
                                      height: 150,
                                      child: Material(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.all(Radius.circular(13)),
                                        child: InkWell(
                                          splashColor: cores.laranja_teccel.withOpacity(0.25),
                                          hoverColor: Colors.transparent,
                                          borderRadius: BorderRadius.circular(15),
                                          onTap: (){
                                            tirar_foto(4);
                                          },
                                          child: Align(
                                              alignment: Alignment.center,
                                              child: (controller_mobx.pneus_foto_tra_esq == null) ? Icon(Icons.add, color: Colors.black26, size: 50,) : Image.file(controller_mobx.pneus_foto_tra_esq)
                                          ),
                                        ),
                                      )
                                  );
                                },
                              )
                          ),
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
                        child: Padding(
                          padding: EdgeInsets.only(right: 4),
                          child: InputDecorator(
                              decoration: InputDecoration(
                                isDense: true,
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                                counterText: "",
                                labelText: "Foto Estepe",
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
                                  return Container(
                                      height: 150,
                                      child: Material(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.all(Radius.circular(13)),
                                        child: InkWell(
                                          splashColor: cores.laranja_teccel.withOpacity(0.25),
                                          hoverColor: Colors.transparent,
                                          borderRadius: BorderRadius.circular(15),
                                          onTap: (){
                                            tirar_foto(5);
                                          },
                                          child: Align(
                                              alignment: Alignment.center,
                                              child: (controller_mobx.pneus_foto_step == null) ? Icon(Icons.add, color: Colors.black26, size: 50,) : Image.file(controller_mobx.pneus_foto_step)
                                          ),
                                        ),
                                      )
                                  );
                                },
                              )
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 4),
                          child: InputDecorator(
                              decoration: InputDecoration(
                                isDense: true,
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                                counterText: "",
                                labelText: "Foto Outro",
                                labelStyle: TextStyle(color:  Colors.transparent, fontWeight: FontWeight.normal),
                                fillColor: Colors.transparent,
                                hoverColor:  Colors.transparent,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 2, color: Colors.transparent,),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 2, color: Colors.transparent,),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              child: Observer(
                                builder: (_){
                                  return Container(
                                      height: 150,
                                      child: Material(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.all(Radius.circular(13)),
                                        child: InkWell(
                                          splashColor:  Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          borderRadius: BorderRadius.circular(15),
                                          onTap: (){

                                          },
                                          child: Align(
                                              alignment: Alignment.center,
                                              child: Icon(Icons.add, color:  Colors.transparent, size: 50,)
                                          ),
                                        ),
                                      )
                                  );
                                },
                              )
                          ),
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
  tirar_foto(int parametro) async{
    XFile? pickedFile = await ImagePicker().pickImage(
        source: ImageSource.camera,
        maxWidth: 1000,
        maxHeight: 1000,
        imageQuality: 25
    );
    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
      if(parametro == 1)
        controller_mobx.pneus_salvar_foto_frod(imageFile);
      if(parametro == 2)
        controller_mobx.pneus_salvar_foto_froe(imageFile);
      if(parametro == 3)
        controller_mobx.pneus_salvar_foto_trad(imageFile);
      if(parametro == 4)
        controller_mobx.pneus_salvar_foto_trae(imageFile);
      if(parametro == 5)
        controller_mobx.pneus_salvar_foto_step(imageFile);
    }
  }
  salvar_dados(){
    if(controller_mobx.pneus_balanceamento.isEmpty ||
        controller_mobx.pneus_frontal_direito.isEmpty ||
        controller_mobx.pneus_frontal_esquerdo.isEmpty ||
        controller_mobx.pneus_traseiro_direito.isEmpty ||
        controller_mobx.pneus_traseiro_esquerdo.isEmpty ||
        controller_mobx.pneus_step.isEmpty ||
        controller_mobx.pneus_foto_fro_dir == null ||
        controller_mobx.pneus_foto_fro_esq == null ||
        controller_mobx.pneus_foto_tra_dir == null ||
        controller_mobx.pneus_foto_tra_esq == null ||
        controller_mobx.pneus_foto_step == null){
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
