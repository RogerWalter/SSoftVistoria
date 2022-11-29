import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:ssoft_vistoria/tela/AbaDados.dart';

import '../util/Controller.dart';
import '../util/Util.dart';

class NovaVistoria extends StatefulWidget {
  const NovaVistoria({Key? key}) : super(key: key);

  @override
  State<NovaVistoria> createState() => _NovaVistoriaState();
}

class _NovaVistoriaState extends State<NovaVistoria> {
  Controller controller_mobx = Controller();

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    controller_mobx = Provider.of(context);
  }

  Util cores = Util();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/wallpaper.png'),
              //colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.75), BlendMode.modulate,),
              fit: BoxFit.cover
          )
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppBar(
              title: Text('Nova Vistoria', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
              backgroundColor: cores.cor_app_bar,
              automaticallyImplyLeading: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(10),
                ),
              ),
            ),
          ),
          body: Observer(
            builder: (_){
              return Padding(
                  padding: EdgeInsets.all(8),
                  child: controller_mobx.abas[controller_mobx.indice_tela]
              );
            },
          )
      ),
    );
  }
}
