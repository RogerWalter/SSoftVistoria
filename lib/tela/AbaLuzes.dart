import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../util/Controller.dart';
import '../util/Util.dart';
class AbaLuzes extends StatefulWidget {
  const AbaLuzes({Key? key}) : super(key: key);

  @override
  State<AbaLuzes> createState() => _AbaLuzesState();
}

class _AbaLuzesState extends State<AbaLuzes> {
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
                            "4 - Luzes",
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
                              labelText: "Lanternas",
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
                                              color: (controller_mobx.luzes_lanterna == "OK") ? cores.cor_app_bar : Colors.transparent,
                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(13), bottomLeft: Radius.circular(13)),
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                                                onTap: (){
                                                  controller_mobx.luzes_altera_lanterna("OK");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "OK",
                                                    style: TextStyle(
                                                      color: (controller_mobx.luzes_lanterna == "OK") ? Colors.white : Colors.black,
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
                                              color: (controller_mobx.luzes_lanterna == "DEFEITO") ? cores.cor_app_bar : Colors.transparent,
                                              borderRadius: BorderRadius.only(topRight: Radius.circular(13), bottomRight: Radius.circular(13)),
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
                                                onTap: (){
                                                  controller_mobx.luzes_altera_lanterna("DEFEITO");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "DEFEITO",
                                                    style: TextStyle(
                                                      color: (controller_mobx.luzes_lanterna == "DEFEITO") ? Colors.white : Colors.black,
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
                              labelText: "Luz de Freio",
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
                                              color: (controller_mobx.luzes_freio == "OK") ? cores.cor_app_bar : Colors.transparent,
                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(13), bottomLeft: Radius.circular(13)),
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                                                onTap: (){
                                                  controller_mobx.luzes_altera_freio("OK");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "OK",
                                                    style: TextStyle(
                                                      color: (controller_mobx.luzes_freio == "OK") ? Colors.white : Colors.black,
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
                                              color: (controller_mobx.luzes_freio == "DEFEITO") ? cores.cor_app_bar : Colors.transparent,
                                              borderRadius: BorderRadius.only(topRight: Radius.circular(13), bottomRight: Radius.circular(13)),
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
                                                onTap: (){
                                                  controller_mobx.luzes_altera_freio("DEFEITO");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "DEFEITO",
                                                    style: TextStyle(
                                                      color: (controller_mobx.luzes_freio == "DEFEITO") ? Colors.white : Colors.black,
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
                              labelText: "Luz da Placa",
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
                                              color: (controller_mobx.luzes_placa == "OK") ? cores.cor_app_bar : Colors.transparent,
                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(13), bottomLeft: Radius.circular(13)),
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                                                onTap: (){
                                                  controller_mobx.luzes_altera_placa("OK");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "OK",
                                                    style: TextStyle(
                                                      color: (controller_mobx.luzes_placa == "OK") ? Colors.white : Colors.black,
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
                                              color: (controller_mobx.luzes_placa == "DEFEITO") ? cores.cor_app_bar : Colors.transparent,
                                              borderRadius: BorderRadius.only(topRight: Radius.circular(13), bottomRight: Radius.circular(13)),
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
                                                onTap: (){
                                                  controller_mobx.luzes_altera_placa("DEFEITO");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "DEFEITO",
                                                    style: TextStyle(
                                                      color: (controller_mobx.luzes_placa == "DEFEITO") ? Colors.white : Colors.black,
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
                              labelText: "Luz de Ré",
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
                                              color: (controller_mobx.luzes_re == "OK") ? cores.cor_app_bar : Colors.transparent,
                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(13), bottomLeft: Radius.circular(13)),
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                                                onTap: (){
                                                  controller_mobx.luzes_altera_re("OK");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "OK",
                                                    style: TextStyle(
                                                      color: (controller_mobx.luzes_re == "OK") ? Colors.white : Colors.black,
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
                                              color: (controller_mobx.luzes_re == "DEFEITO") ? cores.cor_app_bar : Colors.transparent,
                                              borderRadius: BorderRadius.only(topRight: Radius.circular(13), bottomRight: Radius.circular(13)),
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
                                                onTap: (){
                                                  controller_mobx.luzes_altera_re("DEFEITO");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "DEFEITO",
                                                    style: TextStyle(
                                                      color: (controller_mobx.luzes_re == "DEFEITO") ? Colors.white : Colors.black,
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
                              labelText: "Setas Dianteiras",
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
                                              color: (controller_mobx.luzes_setas_dianteiras == "OK") ? cores.cor_app_bar : Colors.transparent,
                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(13), bottomLeft: Radius.circular(13)),
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                                                onTap: (){
                                                  controller_mobx.luzes_altera_setas_dianteiras("OK");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "OK",
                                                    style: TextStyle(
                                                      color: (controller_mobx.luzes_setas_dianteiras == "OK") ? Colors.white : Colors.black,
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
                                              color: (controller_mobx.luzes_setas_dianteiras == "DEFEITO") ? cores.cor_app_bar : Colors.transparent,
                                              borderRadius: BorderRadius.only(topRight: Radius.circular(13), bottomRight: Radius.circular(13)),
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
                                                onTap: (){
                                                  controller_mobx.luzes_altera_setas_dianteiras("DEFEITO");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "DEFEITO",
                                                    style: TextStyle(
                                                      color: (controller_mobx.luzes_setas_dianteiras == "DEFEITO") ? Colors.white : Colors.black,
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
                              labelText: "Setas Traseiras",
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
                                              color: (controller_mobx.luzes_setas_traseiras == "OK") ? cores.cor_app_bar : Colors.transparent,
                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(13), bottomLeft: Radius.circular(13)),
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                                                onTap: (){
                                                  controller_mobx.luzes_altera_setas_traseiras("OK");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "OK",
                                                    style: TextStyle(
                                                      color: (controller_mobx.luzes_setas_traseiras == "OK") ? Colors.white : Colors.black,
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
                                              color: (controller_mobx.luzes_setas_traseiras == "DEFEITO") ? cores.cor_app_bar : Colors.transparent,
                                              borderRadius: BorderRadius.only(topRight: Radius.circular(13), bottomRight: Radius.circular(13)),
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
                                                onTap: (){
                                                  controller_mobx.luzes_altera_setas_traseiras("DEFEITO");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "DEFEITO",
                                                    style: TextStyle(
                                                      color: (controller_mobx.luzes_setas_traseiras == "DEFEITO") ? Colors.white : Colors.black,
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
                              labelText: "Farol",
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
                                              color: (controller_mobx.luzes_farol == "OK") ? cores.cor_app_bar : Colors.transparent,
                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(13), bottomLeft: Radius.circular(13)),
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                                                onTap: (){
                                                  controller_mobx.luzes_altera_farol("OK");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "OK",
                                                    style: TextStyle(
                                                      color: (controller_mobx.luzes_farol == "OK") ? Colors.white : Colors.black,
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
                                              color: (controller_mobx.luzes_farol == "DEFEITO") ? cores.cor_app_bar : Colors.transparent,
                                              borderRadius: BorderRadius.only(topRight: Radius.circular(13), bottomRight: Radius.circular(13)),
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
                                                onTap: (){
                                                  controller_mobx.luzes_altera_farol("DEFEITO");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "DEFEITO",
                                                    style: TextStyle(
                                                      color: (controller_mobx.luzes_farol == "DEFEITO") ? Colors.white : Colors.black,
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
    if(controller_mobx.luzes_lanterna.isEmpty ||
        controller_mobx.luzes_freio.isEmpty ||
        controller_mobx.luzes_placa.isEmpty ||
        controller_mobx.luzes_re.isEmpty ||
        controller_mobx.luzes_setas_dianteiras.isEmpty ||
        controller_mobx.luzes_setas_traseiras.isEmpty ||
        controller_mobx.luzes_farol.isEmpty){
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
