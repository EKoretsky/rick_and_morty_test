import 'package:flutter/material.dart';

class HeadlineSmall extends StatelessWidget {
  const HeadlineSmall(this.data, {super.key, this.overFlow});

  final String data;
  final TextOverflow? overFlow;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      data,
      style: theme.textTheme.headlineSmall,
      overflow: overFlow,
    );
  }
}
