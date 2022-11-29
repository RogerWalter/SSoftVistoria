import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:ssoft_vistoria/tela/DialogoAvaria.dart';
import 'package:ssoft_vistoria/util/SemDados.dart';

import '../util/Controller.dart';
import '../util/Util.dart';
class AbaAvarias extends StatefulWidget {
  const AbaAvarias({Key? key}) : super(key: key);

  @override
  State<AbaAvarias> createState() => _AbaAvariasState();
}

class _AbaAvariasState extends State<AbaAvarias> {
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
                          "10 - Avarias no Veículo",
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
                                mostrar_dialogo_nova_avaria();
                              },
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Inserir Nova Avaria",
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
            Observer(
              builder: (_){
                return Expanded(
                  child: Column(
                    children: <Widget>[
                      if(controller_mobx.avaria_lista.length > 0)
                        Expanded(
                            child: ScrollConfiguration(
                                behavior: ScrollBehavior(),
                                child: GlowingOverscrollIndicator(
                                    axisDirection: AxisDirection.down,
                                    color: cores.laranja_teccel.withOpacity(0.20),
                                    child: ListView.builder(
                                      itemCount: controller_mobx.avaria_lista.length,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemBuilder: (_, index){
                                        return Card(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            child: InkWell(
                                              splashColor: cores.laranja_teccel.withOpacity(0.25),
                                              hoverColor: Colors.white,
                                              borderRadius: BorderRadius.circular(10),
                                              onTap: (){

                                              },
                                              child: ListTile(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(10),
                                                  ),
                                                  tileColor: Colors.white,
                                                  leading:  Container(
                                                      child: Image.file(controller_mobx.avaria_lista[index].foto)
                                                  ),
                                                  title: Padding(
                                                    padding: EdgeInsets.fromLTRB(0, 4, 0, 2),
                                                    child: ClipRect(
                                                      child: SingleChildScrollView(
                                                        scrollDirection: Axis.horizontal,
                                                        child: Container(
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                            children: <Widget>[
                                                              Text(
                                                                "TIPO: ",
                                                                textAlign: TextAlign.left,
                                                                style: TextStyle(
                                                                    color: Colors.black54,
                                                                    fontSize: (14),
                                                                    fontWeight: FontWeight.normal
                                                                ),
                                                                maxLines: 1,
                                                                overflow: TextOverflow.ellipsis,
                                                              ),
                                                              Padding(padding: EdgeInsets.only(left: 4)),
                                                              Text(
                                                                controller_mobx.avaria_lista[index].tipo,
                                                                textAlign: TextAlign.left,
                                                                style: TextStyle(
                                                                    color: Colors.black,
                                                                    fontSize: (14),
                                                                    fontWeight: FontWeight.bold
                                                                ),
                                                                maxLines: 1,
                                                                overflow: TextOverflow.ellipsis,
                                                              )
                                                            ],
                                                          ),
                                                        )
                                                      )
                                                    ),
                                                  ),
                                                  subtitle: Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: <Widget>[
                                                      Padding(
                                                        padding: EdgeInsets.fromLTRB(0, 2, 0, 2),
                                                        child: ClipRect(
                                                          child: SingleChildScrollView(
                                                            scrollDirection: Axis.horizontal,
                                                            child: Container(
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                children: <Widget>[
                                                                  Text(
                                                                    "LOCAL: ",
                                                                    textAlign: TextAlign.left,
                                                                    style: TextStyle(
                                                                        color: Colors.black54,
                                                                        fontSize: (14),
                                                                        fontWeight: FontWeight.normal
                                                                    ),
                                                                    maxLines: 1,
                                                                    overflow: TextOverflow.ellipsis,
                                                                  ),
                                                                  Padding(padding: EdgeInsets.only(left: 4)),
                                                                  Text(
                                                                    controller_mobx.avaria_lista[index].local,
                                                                    textAlign: TextAlign.left,
                                                                    style: TextStyle(
                                                                        color: Colors.black,
                                                                        fontSize: (14),
                                                                        fontWeight: FontWeight.bold
                                                                    ),
                                                                    maxLines: 1,
                                                                    overflow: TextOverflow.ellipsis,
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.fromLTRB(0, 2, 0, 4),
                                                        child: ClipRect(
                                                          child: SingleChildScrollView(
                                                            scrollDirection: Axis.horizontal,
                                                            child: Container(
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                children: <Widget>[
                                                                  Text(
                                                                    "COMENTÁRIO: ",
                                                                    textAlign: TextAlign.left,
                                                                    style: TextStyle(
                                                                        color: Colors.black54,
                                                                        fontSize: (14),
                                                                        fontWeight: FontWeight.normal
                                                                    ),
                                                                    maxLines: 1,
                                                                    overflow: TextOverflow.ellipsis,
                                                                  ),
                                                                  Padding(padding: EdgeInsets.only(left: 4)),
                                                                  Text(
                                                                    (controller_mobx.avaria_lista[index].comentario.isEmpty) ? "-" : controller_mobx.avaria_lista[index].comentario,
                                                                    textAlign: TextAlign.left,
                                                                    style: TextStyle(
                                                                        color: Colors.black,
                                                                        fontSize: (14),
                                                                        fontWeight: FontWeight.bold
                                                                    ),
                                                                    maxLines: 1,
                                                                    overflow: TextOverflow.ellipsis,
                                                                  )
                                                                ],
                                                              )
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  trailing: IconButton(
                                                    icon: Icon(Icons.delete_forever_rounded, color: Colors.red,),
                                                    onPressed: () {
                                                      mostrar_dialogo_remover_item(index);
                                                    },
                                                  )
                                              ),
                                            )
                                        );
                                      },
                                    )
                                )
                            )
                        )
                      else
                        Expanded(child: SemDados())
                    ],
                  ),
                );
              },
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
        );
      },
    );
  }
  mostrar_dialogo_nova_avaria(){
    showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Dialog(
            insetPadding: EdgeInsets.only(left: 8, right: 8),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            child: Padding(padding: EdgeInsets.all(8), child: DialogoAvaria(),)
        );
      },
      animationType: DialogTransitionType.fadeScale,
      curve: Curves.easeOutQuint,
      duration: Duration(milliseconds: 500),
    );
  }
  mostrar_dialogo_remover_item(int indice){
    showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return CustomDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0))),
            child: Wrap(
              children: <Widget>[
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(8,8,8,4),
                          child: Text(
                            "Remover Avaria",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: cores.cor_app_bar
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(8,4,8,4),
                          child: Text(
                            "Deseja realmente remover esta avaria da lista?",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: cores.cor_app_bar
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                            padding: EdgeInsets.fromLTRB(8,4,8,8),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Expanded(
                                      child: TextButton(
                                        onPressed: (){
                                          Navigator.of(context).pop();
                                        },
                                        child: Text(
                                            "Não",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: cores.laranja_teccel,
                                            ),
                                            textAlign: TextAlign.center
                                        ),
                                      )
                                  ),
                                  Expanded(
                                      child: TextButton(
                                        onPressed: (){
                                          controller_mobx.inserir_avaria_remover_avaria(indice);
                                          Navigator.of(context).pop();
                                        },
                                        child: Text(
                                            "Sim",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: cores.laranja_teccel
                                            ),
                                            textAlign: TextAlign.center
                                        ),
                                      )
                                  )
                                ]
                            )
                        ),
                      )
                    ]
                )
              ],
            )
        );
      },
      animationType: DialogTransitionType.fadeScale,
      curve: Curves.easeOutQuint,
      duration: Duration(milliseconds: 500),
    );
  }
}
