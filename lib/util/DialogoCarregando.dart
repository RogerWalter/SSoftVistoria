import 'package:flutter/material.dart';
import 'Util.dart';
class DialogoCarregando extends StatefulWidget {
  const DialogoCarregando({Key? key}) : super(key: key);

  @override
  State<DialogoCarregando> createState() => _DialogoCarregandoState();
}

class _DialogoCarregandoState extends State<DialogoCarregando> {
  @override
  Widget build(BuildContext context) {
    Util cores = Util();
    return CircularProgressIndicator(
      color: cores.cor_app_bar,
      backgroundColor: cores.laranja_teccel,
    );
  }
}
