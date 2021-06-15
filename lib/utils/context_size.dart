import 'package:flutter/material.dart';

class SizeContext {
  final context;
  SizeContext(this.context);

  double get height {
    return (MediaQuery.of(context).size.height - kToolbarHeight) / 100.0;
  }

  double get width {
    return MediaQuery.of(context).size.width / 100.0;
  }
}
