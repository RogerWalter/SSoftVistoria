import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../util/Controller.dart';
import '../util/Util.dart';
class AbaInfosIniciais extends StatefulWidget {
  const AbaInfosIniciais({Key? key}) : super(key: key);

  @override
  State<AbaInfosIniciais> createState() => _AbaInfosIniciaisState();
}

class _AbaInfosIniciaisState extends State<AbaInfosIniciais> {
  Util cores = Util();
  Controller controller_mobx = Controller();

  TextEditingController _controller_km = TextEditingController();
  FocusNode _foco_km = FocusNode();

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
                            "2 - Informações Iniciais",
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
                              labelText: "Documento Atualizado?",
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
                                              color: (controller_mobx.infos_iniciais_doc_atualizado == "NÃO") ? cores.cor_app_bar : Colors.transparent,
                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(13), bottomLeft: Radius.circular(13)),
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                                                onTap: (){
                                                  controller_mobx.infos_iniciais_altera_doc_atualizado("NÃO");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "NÃO",
                                                    style: TextStyle(
                                                      color: (controller_mobx.infos_iniciais_doc_atualizado == "NÃO") ? Colors.white : Colors.black,
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
                                              color: (controller_mobx.infos_iniciais_doc_atualizado == "SIM") ? cores.cor_app_bar : Colors.transparent,
                                              borderRadius: BorderRadius.only(topRight: Radius.circular(13), bottomRight: Radius.circular(13)),
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
                                                onTap: (){
                                                  controller_mobx.infos_iniciais_altera_doc_atualizado("SIM");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "SIM",
                                                    style: TextStyle(
                                                      color: (controller_mobx.infos_iniciais_doc_atualizado == "SIM") ? Colors.white : Colors.black,
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
                              labelText: "Multas para Verificar?",
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
                                              color: (controller_mobx.infos_iniciais_multas == "NÃO") ? cores.cor_app_bar : Colors.transparent,
                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(13), bottomLeft: Radius.circular(13)),
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                                                onTap: (){
                                                  controller_mobx.infos_iniciais_altera_multas("NÃO");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "NÃO",
                                                    style: TextStyle(
                                                      color: (controller_mobx.infos_iniciais_multas == "NÃO") ? Colors.white : Colors.black,
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
                                              color: (controller_mobx.infos_iniciais_multas == "SIM") ? cores.cor_app_bar : Colors.transparent,
                                              borderRadius: BorderRadius.only(topRight: Radius.circular(13), bottomRight: Radius.circular(13)),
                                              child: InkWell(
                                                splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                hoverColor: Colors.transparent,
                                                borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
                                                onTap: (){
                                                  controller_mobx.infos_iniciais_altera_multas("SIM");
                                                },
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "SIM",
                                                    style: TextStyle(
                                                      color: (controller_mobx.infos_iniciais_multas == "SIM") ? Colors.white : Colors.black,
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
                        child: Container(
                          height: 50,
                          child: TextField(
                            controller: _controller_km,
                            focusNode: _foco_km,
                            keyboardType: TextInputType.number,
                            textCapitalization: TextCapitalization.characters,
                            textInputAction: TextInputAction.done,
                            cursorColor: cores.cor_app_bar,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            maxLength: 6,
                            style: TextStyle(
                                color: cores.cor_app_bar,
                                fontSize: 14,
                                fontWeight: FontWeight.bold
                            ),
                            decoration: InputDecoration(
                              isDense: true,
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              counterText: "",
                              labelText: "Km Atual",
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
                                labelText: "Foto do Documento",
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
                                  return Expanded(
                                    child: Container(
                                        height: 150,
                                        child: Material(
                                          color: Colors.transparent,
                                          borderRadius: BorderRadius.all(Radius.circular(13)),
                                          child: InkWell(
                                            splashColor: cores.laranja_teccel.withOpacity(0.25),
                                            hoverColor: Colors.transparent,
                                            borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                                            onTap: (){
                                              tirar_foto(1);
                                            },
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: (controller_mobx.infos_iniciais_foto_doc == null) ? Icon(Icons.add, color: Colors.black26, size: 50,) : Image.file(controller_mobx.infos_iniciais_foto_doc)
                                            ),
                                          ),
                                        )
                                    ),
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
                                labelText: "Foto do Hodômetro",
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
                                  return Expanded(
                                    child: Container(
                                        height: 150,
                                        child: Material(
                                          color: Colors.transparent,
                                          borderRadius: BorderRadius.all(Radius.circular(13)),
                                          child: InkWell(
                                            splashColor: cores.laranja_teccel.withOpacity(0.25),
                                            hoverColor: Colors.transparent,
                                            borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                                            onTap: (){
                                              tirar_foto(2);
                                            },
                                            child: Align(
                                                alignment: Alignment.center,
                                                child: (controller_mobx.infos_iniciais_foto_hod == null) ? Icon(Icons.add, color: Colors.black26, size: 50,) : Image.file(controller_mobx.infos_iniciais_foto_hod)
                                            ),
                                          ),
                                        )
                                    ),
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
                                labelText: "Foto Dianteira",
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
                                  return Expanded(
                                    child: Container(
                                        height: 150,
                                        child: Material(
                                          color: Colors.transparent,
                                          borderRadius: BorderRadius.all(Radius.circular(13)),
                                          child: InkWell(
                                            splashColor: cores.laranja_teccel.withOpacity(0.25),
                                            hoverColor: Colors.transparent,
                                            borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                                            onTap: (){
                                              tirar_foto(3);
                                            },
                                            child: Align(
                                                alignment: Alignment.center,
                                                child: (controller_mobx.infos_iniciais_foto_dianteira == null) ? Icon(Icons.add, color: Colors.black26, size: 50,) : Image.file(controller_mobx.infos_iniciais_foto_dianteira)
                                            ),
                                          ),
                                        )
                                    ),
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
                                labelText: "Foto Traseira",
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
                                  return Expanded(
                                    child: Container(
                                        height: 150,
                                        child: Material(
                                          color: Colors.transparent,
                                          borderRadius: BorderRadius.all(Radius.circular(13)),
                                          child: InkWell(
                                            splashColor: cores.laranja_teccel.withOpacity(0.25),
                                            hoverColor: Colors.transparent,
                                            borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                                            onTap: (){
                                              tirar_foto(4);
                                            },
                                            child: Align(
                                                alignment: Alignment.center,
                                                child: (controller_mobx.infos_iniciais_foto_traseira == null) ? Icon(Icons.add, color: Colors.black26, size: 50,) : Image.file(controller_mobx.infos_iniciais_foto_traseira)
                                            ),
                                          ),
                                        )
                                    ),
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
                                labelText: "Foto Lateral Direira",
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
                                  return Expanded(
                                    child: Container(
                                        height: 150,
                                        child: Material(
                                          color: Colors.transparent,
                                          borderRadius: BorderRadius.all(Radius.circular(13)),
                                          child: InkWell(
                                            splashColor: cores.laranja_teccel.withOpacity(0.25),
                                            hoverColor: Colors.transparent,
                                            borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                                            onTap: (){
                                              tirar_foto(5);
                                            },
                                            child: Align(
                                                alignment: Alignment.center,
                                                child: (controller_mobx.infos_iniciais_foto_lat_dir == null) ? Icon(Icons.add, color: Colors.black26, size: 50,) : Image.file(controller_mobx.infos_iniciais_foto_lat_dir)
                                            ),
                                          ),
                                        )
                                    ),
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
                                labelText: "Foto Lateral Esquerda",
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
                                  return Expanded(
                                    child: Container(
                                        height: 150,
                                        child: Material(
                                          color: Colors.transparent,
                                          borderRadius: BorderRadius.all(Radius.circular(13)),
                                          child: InkWell(
                                            splashColor: cores.laranja_teccel.withOpacity(0.25),
                                            hoverColor: Colors.transparent,
                                            borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                                            onTap: (){
                                              tirar_foto(6);
                                            },
                                            child: Align(
                                                alignment: Alignment.center,
                                                child: (controller_mobx.infos_iniciais_foto_lat_esq == null) ? Icon(Icons.add, color: Colors.black26, size: 50,) : Image.file(controller_mobx.infos_iniciais_foto_lat_esq)
                                            ),
                                          ),
                                        )
                                    ),
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
                                labelText: "Foto Interior",
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
                                  return Expanded(
                                    child: Container(
                                        height: 150,
                                        child: Material(
                                          color: Colors.transparent,
                                          borderRadius: BorderRadius.all(Radius.circular(13)),
                                          child: InkWell(
                                            splashColor: cores.laranja_teccel.withOpacity(0.25),
                                            hoverColor: Colors.transparent,
                                            borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                                            onTap: (){
                                              tirar_foto(7);
                                            },
                                            child: Align(
                                                alignment: Alignment.center,
                                                child: (controller_mobx.infos_iniciais_foto_interior == null) ? Icon(Icons.add, color: Colors.black26, size: 50,) : Image.file(controller_mobx.infos_iniciais_foto_interior)
                                            ),
                                          ),
                                        )
                                    ),
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
                                labelText: "Foto Porta-Malas",
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
                                  return Expanded(
                                    child: Container(
                                        height: 150,
                                        child: Material(
                                          color: Colors.transparent,
                                          borderRadius: BorderRadius.all(Radius.circular(13)),
                                          child: InkWell(
                                            splashColor: cores.laranja_teccel.withOpacity(0.25),
                                            hoverColor: Colors.transparent,
                                            borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                                            onTap: (){
                                              tirar_foto(8);
                                            },
                                            child: Align(
                                                alignment: Alignment.center,
                                                child: (controller_mobx.infos_iniciais_foto_porta_malas == null) ? Icon(Icons.add, color: Colors.black26, size: 50,) : Image.file(controller_mobx.infos_iniciais_foto_porta_malas)
                                            ),
                                          ),
                                        )
                                    ),
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
        controller_mobx.infos_iniciais_salvar_foto_doc(imageFile);
      if(parametro == 2)
        controller_mobx.infos_iniciais_salvar_foto_hod(imageFile);
      if(parametro == 3)
        controller_mobx.infos_iniciais_salvar_foto_dia(imageFile);
      if(parametro == 4)
        controller_mobx.infos_iniciais_salvar_foto_tra(imageFile);
      if(parametro == 5)
        controller_mobx.infos_iniciais_salvar_foto_latd(imageFile);
      if(parametro == 6)
        controller_mobx.infos_iniciais_salvar_foto_late(imageFile);
      if(parametro == 7)
        controller_mobx.infos_iniciais_salvar_foto_inte(imageFile);
      if(parametro == 8)
        controller_mobx.infos_iniciais_salvar_foto_porma(imageFile);
    }
  }
  salvar_dados(){
    if(_controller_km.text.isEmpty ||
        controller_mobx.infos_iniciais_doc_atualizado.isEmpty ||
        controller_mobx.infos_iniciais_multas.isEmpty ||
        controller_mobx.infos_iniciais_foto_doc == null ||
        controller_mobx.infos_iniciais_foto_hod == null ||
        controller_mobx.infos_iniciais_foto_dianteira == null ||
        controller_mobx.infos_iniciais_foto_traseira == null ||
        controller_mobx.infos_iniciais_foto_lat_dir == null ||
        controller_mobx.infos_iniciais_foto_lat_esq == null ||
        controller_mobx.infos_iniciais_foto_interior == null ||
        controller_mobx.infos_iniciais_foto_porta_malas == null){
      final snackBar = SnackBar(
        content: const Text('Existem campos obrigatórios não preenchidos. Verifique e tente novamente'),
        backgroundColor: cores.cor_accent,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    else{
      controller_mobx.salvar_infos_iniciais(_controller_km.text);
      controller_mobx.mudar_tela(1);
    }
  }
}
