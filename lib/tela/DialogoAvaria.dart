import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../util/Controller.dart';
import '../util/Util.dart';
class DialogoAvaria extends StatefulWidget {
  const DialogoAvaria({Key? key}) : super(key: key);

  @override
  State<DialogoAvaria> createState() => _DialogoAvariaState();
}

class _DialogoAvariaState extends State<DialogoAvaria> {
  Util cores = Util();
  Controller controller_mobx = Controller();
  TextEditingController _controller_local = TextEditingController();
  FocusNode _foco_local = FocusNode();
  TextEditingController _controller_tipo = TextEditingController();
  FocusNode _foco_tipo = FocusNode();
  TextEditingController _controller_comentario = TextEditingController();
  FocusNode _foco_comentario = FocusNode();
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
                            "Nova Avaria",
                            textAlign: TextAlign.center,
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
                            controller: _controller_local,
                            focusNode: _foco_local,
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
                              isDense: true,
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              counterText: "",
                              labelText: "Local da Avaria",
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
                            controller: _controller_tipo,
                            focusNode: _foco_tipo,
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
                              isDense: true,
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              counterText: "",
                              labelText: "Tipo da Avaria",
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
                            controller: _controller_comentario,
                            focusNode: _foco_comentario,
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
                              isDense: true,
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              counterText: "",
                              labelText: "Comentário",
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
                        child: Padding(
                          padding: EdgeInsets.only(right: 4),
                          child: InputDecorator(
                              decoration: InputDecoration(
                                isDense: true,
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                                counterText: "",
                                labelText: "Foto da Avaria",
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
                                            borderRadius: BorderRadius.circular(15),
                                            onTap: (){
                                              tirar_foto();
                                            },
                                            child: Align(
                                                alignment: Alignment.center,
                                                child: (controller_mobx.inserir_avaria_foto_avaria == null) ? Icon(Icons.add, color: Colors.black26, size: 50,) : Image.file(controller_mobx.inserir_avaria_foto_avaria)
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
                                  return Expanded(
                                    child: Container(
                                        height: 100,
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
                                  Navigator.of(context).pop();
                                },
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Cancelar",
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
                                    "Salvar",
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
  tirar_foto() async{
    XFile? pickedFile = await ImagePicker().pickImage(
        source: ImageSource.camera,
        maxWidth: 1000,
        maxHeight: 1000,
        imageQuality: 25
    );
    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
      controller_mobx.inserir_avaria_salvar_foto_avaria(imageFile);
    }
  }
  salvar_dados(){
    if(_controller_local.text.isEmpty ||
        _controller_tipo.text.isEmpty ||
        controller_mobx.inserir_avaria_foto_avaria == null){
      Flushbar(
        backgroundColor: cores.cor_accent,
        message: 'Existem campos obrigatórios não preenchidos. Verifique e tente novamente',
        duration: Duration(seconds: 2),
      ).show(context);
      return;
    }
    else{
      controller_mobx.inserir_avaria_salvar_nova_avaria(_controller_local.text, _controller_tipo.text, _controller_comentario.text);
      Navigator.of(context).pop();
    }
  }
}
