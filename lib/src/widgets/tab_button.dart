import 'package:flutter/material.dart';

class TabButton extends StatelessWidget {
  final Icon? icon;
  final Function? onTap;
  final String tooltip;
  final bool selected;
  final Color backgroundColor;

  TabButton(
      {this.icon,
      this.onTap,
      this.tooltip = '',
      this.selected = false,
      this.backgroundColor = Colors.purple});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 32.0,
      width: 32.0,
      decoration: new BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          onTap: () => onTap!(),
          child: Center(
            child: icon,
          ),
        ),
      ),
    );
  }
}
