import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:signature/signature.dart';
import 'package:ssoft_vistoria/tela/DialogoProvidencias.dart';
import 'package:ssoft_vistoria/util/SemConexao.dart';
import '../util/Controller.dart';
import '../util/Util.dart';
import 'Principal.dart';
class AbaConclusao extends StatefulWidget {
  const AbaConclusao({Key? key}) : super(key: key);

  @override
  State<AbaConclusao> createState() => _AbaConclusaoState();
}

class _AbaConclusaoState extends State<AbaConclusao> {
  Util cores = Util();
  Controller controller_mobx = Controller();
  TextEditingController _controller_obs_motorista = TextEditingController();
  FocusNode _foco_obs_motorista = FocusNode();
  Uint8List? _assinatura_gerada;

  /*@override
  void dispose() {
    controller_mobx.conclusao_controller_assinatura.dispose();
    super.dispose();
  }*/

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
                          "11 - Conclusão da Vistoria",
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
            if(controller_mobx.providencias_a_tomar.length > 0)Padding(
              padding: EdgeInsets.only(top: 8, bottom: 8),
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
                                color: cores.cor_app_bar,
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
                                mostrar_dialogo_visualizar_providencias();
                              },
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  (controller_mobx.providencias_a_tomar.length > 1) ? "Há " + controller_mobx.providencias_a_tomar.length.toString() + " ações para realizar. Toque para ver" : "Há " + controller_mobx.providencias_a_tomar.length.toString() + " ação para realizar. Toque para ver" ,
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
            )
            else
              Padding(
                padding: EdgeInsets.only(top: 8, bottom: 8),
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
                                  color: cores.cor_app_bar,
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
                                  final snackBar = SnackBar(
                                    content: const Text('O veículo está de acordo com o esperado. Não é necessário tomar nenhuma providência de correção'),
                                    backgroundColor: Colors.green,
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                },
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Nenhuma ação necessária" ,
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
                          controller: _controller_obs_motorista,
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
                            isDense: true,
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            counterText: "",
                            labelText: "Observações do Motorista",
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
            Expanded(
              child: Container(
                child: Padding(
                  padding: EdgeInsets.only(top: 8, bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Observer(
                          builder: (_){
                            return Expanded(
                              child: Stack(
                                children: <Widget>[
                                  InputDecorator(
                                      decoration: InputDecoration(
                                        floatingLabelBehavior: FloatingLabelBehavior.always,
                                        counterText: "",
                                        labelText: "Assinatura do Condutor",
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
                                      child: ClipRRect(
                                        child: Signature(
                                          key: const Key('signature'),
                                          controller: controller_mobx.conclusao_controller_assinatura,
                                          //height: 200,
                                          backgroundColor: Colors.transparent,
                                        ),
                                      )
                                  ),
                                  Align(
                                      alignment: Alignment.topRight,
                                      child: Padding(
                                        padding: EdgeInsets.only(right: 4),
                                        child: IconButton(
                                          icon: Icon(Icons.undo_rounded, color: cores.laranja_teccel,),
                                          onPressed: (){
                                            controller_mobx.conclusao_controller_assinatura.undo();
                                          },
                                        ),
                                      )
                                  ),
                                ],
                              ),
                            );
                          }
                      )
                    ],
                  )
                ),
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
                                //gerar_realtorio();
                                //salvar_firebase();
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
  salvar_dados() async{
    if(controller_mobx.conclusao_controller_assinatura.isEmpty){
      final snackBar = SnackBar(
        content: const Text('Existem campos obrigatórios não preenchidos. Verifique e tente novamente'),
        backgroundColor: cores.cor_accent,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    else{
      int conexao = await cores.verificar_conexao();
      if(conexao == 0){//sem conexão
        mostrar_sem_conexao();
      }
      else{
        await gerar_imagem_assinatura(context);
        controller_mobx.conclusao_salvar_dados(_controller_obs_motorista.text, _assinatura_gerada);
        controller_mobx.mudar_tela(1);
      }
    }
  }

  mostrar_dialogo_visualizar_providencias(){
    showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Dialog(
            insetPadding: EdgeInsets.only(left: 8, right: 8),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            child: Padding(padding: EdgeInsets.all(8), child: Wrap(children: <Widget>[DialogoProvidencias()],),)
        );
      },
      animationType: DialogTransitionType.fadeScale,
      curve: Curves.easeOutQuint,
      duration: Duration(milliseconds: 500),
    );
  }

  Future<void> gerar_imagem_assinatura(BuildContext context) async {
    final Uint8List? data =
    await controller_mobx.conclusao_controller_assinatura.toPngBytes();
    if (data == null) {
      return;
    }
    if (!mounted) return;
    _assinatura_gerada = data;
  }

  mostrar_sem_conexao(){
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_){
          return WillPopScope(
            child: Dialog(
              child: Wrap(
                children:  [Center(child: SemConexao(),)]
              ),
            ),
            onWillPop: () async => false
          );
        });
  }
}
