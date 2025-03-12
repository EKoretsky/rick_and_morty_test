import 'package:flutter/material.dart';

class BodySmall extends StatelessWidget {
  const BodySmall(this.data, {super.key, this.overFlow});

  final String data;
  final TextOverflow? overFlow;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(data, style: theme.textTheme.bodySmall, overflow: overFlow);
  }
}
