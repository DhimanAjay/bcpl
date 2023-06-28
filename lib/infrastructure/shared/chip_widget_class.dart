import 'package:flutter/material.dart';

import '../theme/colors.theme.dart';
import '../theme/text.theme.dart';


class ChipWidgetClass extends StatelessWidget{
final List chipList ;

final Function onClick;
const ChipWidgetClass({super.key, required this.chipList,required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: chipList
          .map((element) => GestureDetector(
        onTap: () {
          onClick(element);
        },
        child: Container(
          padding: const EdgeInsets.only(
              left: 15, top: 8, bottom: 8, right: 15),
          margin: const EdgeInsets.only(
              right: 10.0, top: 12.0, bottom: 12.0, left: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                  color: element.isSelect!
                      ? ColorsTheme.colPrimary
                      : ColorsTheme.cole8e6ea)),
          child: Text(
            element.title!,
            style: regularTextStyle(
                color: element.isSelect!
                    ? ColorsTheme.colPrimary
                    : ColorsTheme.col4D4D4D,
                fontSize: dimen13),
          ),
        ),
      ))
          .toList(),
    );
  }
}