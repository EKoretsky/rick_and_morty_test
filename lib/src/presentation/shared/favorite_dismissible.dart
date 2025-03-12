import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class FavoriteDismissible extends StatelessWidget {
  const FavoriteDismissible({
    super.key,
    required this.child,
    required this.addToFavorites,
    required this.removeFromFavorites,
  });

  final Widget child;
  final VoidCallback addToFavorites;
  final VoidCallback removeFromFavorites;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(child.toString()),
      direction: DismissDirection.horizontal,

      background: DecoratedBox(decoration: BoxDecoration(color: Colors.green)),
      confirmDismiss: (direction) async => false,
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart) {
          addToFavorites();
        } else if(direction == DismissDirection.startToEnd) {
          removeFromFavorites();
        }
      },
      child: child,
    );
  }
}
