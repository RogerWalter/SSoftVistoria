import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../util/Controller.dart';
import '../util/Util.dart';
class DialogoProvidencias extends StatefulWidget {
  const DialogoProvidencias({Key? key}) : super(key: key);

  @override
  State<DialogoProvidencias> createState() => _DialogoProvidenciasState();
}

class _DialogoProvidenciasState extends State<DialogoProvidencias> {
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
                          "Ações Necessárias",
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
            Observer(
              builder: (_){
                return Container(
                  height: 400,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                          child: ScrollConfiguration(
                              behavior: ScrollBehavior(),
                              child: GlowingOverscrollIndicator(
                                  axisDirection: AxisDirection.down,
                                  color: cores.laranja_teccel.withOpacity(0.20),
                                  child: ListView.builder(
                                    itemCount: controller_mobx.providencias_a_tomar.length,
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
                                              mostrar_dialogo_remover_item(index);
                                            },
                                            child: ListTile(
                                                dense:true,
                                                contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
                                                visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                tileColor: Colors.white,
                                                leading:  CircleAvatar(
                                                    backgroundColor: Colors.transparent,
                                                    child: Icon(Icons.error_outline, color: cores.cor_accent,)
                                                ),
                                                title: Padding(
                                                  padding: EdgeInsets.fromLTRB(0, 4, 0, 2),
                                                  child: Text(
                                                    controller_mobx.providencias_a_tomar[index],
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: (14),
                                                        fontWeight: FontWeight.bold
                                                    ),
                                                    maxLines: 1,
                                                    overflow: TextOverflow.ellipsis,
                                                  )
                                                ),
                                                subtitle:Padding(
                                                    padding: EdgeInsets.fromLTRB(0, 4, 0, 2),
                                                    child: Text(
                                                      "TOQUE PARA EXCLUIR",
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.black54,
                                                          fontSize: (12),
                                                          fontWeight: FontWeight.normal
                                                      ),
                                                  ),
                                                ),
                                            ),
                                          )
                                      );
                                    },
                                  )
                              )
                          )
                      )
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
                                Navigator.of(context).pop();
                              },
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Fechar",
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
                            "Remover Ação",
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
                            "Deseja realmente remover esta ação da lista?",
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
                                          controller_mobx.remover_providencia_indice(indice);
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
