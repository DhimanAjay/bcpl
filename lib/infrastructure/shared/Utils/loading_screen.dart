import 'package:flutter/material.dart';
import '../../theme/colors.theme.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
      child:  CircularProgressIndicator(color:  ColorsTheme.denimBlue,),
    );
  }
}
