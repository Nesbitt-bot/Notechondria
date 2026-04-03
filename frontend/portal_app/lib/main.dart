import 'package:flutter/widgets.dart';
import 'package:notechondria_shared/notechondria_shared.dart';

void main() {
  runApp(
    const NotechondriaApp(
      initialIndex: 4,
      title: 'Notechondria Portal',
      visibleIndices: <int>[0, 4],
    ),
  );
}
