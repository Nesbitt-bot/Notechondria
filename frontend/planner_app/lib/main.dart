import 'package:flutter/widgets.dart';
import 'package:notechondria_shared/notechondria_shared.dart';

void main() {
  runApp(
    const NotechondriaApp(
      initialIndex: 2,
      title: 'Notechondria Planner',
      visibleIndices: <int>[0, 2, 3],
    ),
  );
}
