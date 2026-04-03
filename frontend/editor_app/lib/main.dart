import 'package:flutter/widgets.dart';
import 'package:notechondria_shared/notechondria_shared.dart';

void main() {
  runApp(
    const NotechondriaApp(
      initialIndex: 1,
      title: 'Notechondria Editor',
      visibleIndices: <int>[1, 4],
    ),
  );
}
