import 'package:flutter/material.dart';
import 'package:flutter_catelog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CateglogHeader extends StatelessWidget {
  const CateglogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catelog App".text.xl5.color(MyThemes.blueishColor).bold.make(),
        "Trending Apps".text.xl2.make()
      ],
    );
  }
}