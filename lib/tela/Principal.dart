import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:ssoft_vistoria/tela/VisualizarVistoria.dart';

import '../util/Controller.dart';
import '../util/SemConexao.dart';
import '../util/Util.dart';
import 'NovaVistoria.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(
      MultiProvider(
        providers: [
          Provider<Controller>(
            create: (BuildContext context) => Controller(),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primaryColor: Colors.black
          ),
          home: Main(),
        ),
      )
  );
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {

  Controller controller_mobx = Controller();
  int _conexao = 0; // 0 - SEM CONEXAO | 1 - CONECTADO
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    controller_mobx = Provider.of(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp
    ]);
  }

  @override
  Widget build(BuildContext context) {
    Util cores = Util();
    verificar_conexao();
    double altura_imagem =MediaQuery.of(context).size.height/5;
    controller_mobx.preenche_lista_vistoria();
    FlutterNativeSplash.remove();
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: altura_imagem,
                  child: Image.asset("images/logo.png"),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 16, bottom: 8),
                    child: Align(
                        alignment: Alignment.center,
                        child: DefaultTextStyle(
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                          ),
                          child: Text(
                            "Bem-Vindo!",
                          ),
                        )
                    )
                ),
                Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Align(
                        alignment: Alignment.center,
                        child: DefaultTextStyle(
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                          child: Text(
                            "O que deseja fazer hoje?",
                          ),
                        )
                    )
                ),
                Padding(
                    padding: EdgeInsets.only(top: 16, bottom: 8),
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
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => NovaVistoria()
                                    )
                                );
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding:EdgeInsets.only(left: 4),
                                    child: Icon(
                                      Icons.directions_car_rounded,
                                      color: cores.cor_app_bar,
                                      size: 30,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Nova Vistoria",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:EdgeInsets.only(right: 4),
                                    child: Icon(
                                      Icons.directions_car_rounded,
                                      color: cores.cor_app_bar,
                                      size: 30,
                                    ),
                                  ),
                                ],
                              )
                          ),
                        )
                    )
                ),
                Padding(
                    padding: EdgeInsets.only(top: 8, bottom: 8),
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
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => VisualizarVistoria()
                                    )
                                );
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding:EdgeInsets.only(left: 4),
                                    child: Icon(
                                      Icons.checklist_rounded,
                                      color: cores.cor_app_bar,
                                      size: 30,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Visualizar Vistorias",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:EdgeInsets.only(right: 4),
                                    child: Icon(
                                      Icons.checklist_rtl_rounded,
                                      color: cores.cor_app_bar,
                                      size: 30,
                                    ),
                                  ),
                                ],
                              )
                          ),
                        )
                    )
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  verificar_conexao() async{
    Util verif = Util();
    _conexao = await  verif.verificar_conexao();
    if(_conexao == 0){
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SemConexao()
          )
      );
    }
    else{
      return;
    }
  }
}

