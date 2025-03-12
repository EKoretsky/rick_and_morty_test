import 'package:flutter/material.dart';

class BodyLarge extends StatelessWidget {
  const BodyLarge(this.data, {super.key, this.overFlow});

  final String data;
  final TextOverflow? overFlow;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(data, style: theme.textTheme.bodyLarge, overflow: overFlow);
  }
}
