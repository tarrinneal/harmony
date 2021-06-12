import 'package:flutter/widgets.dart';

abstract class PageBuilderArguments {
  const PageBuilderArguments();
}

class SplashPageBuilderArguments implements PageBuilderArguments {
  const SplashPageBuilderArguments({required this.advance});
  final VoidCallback advance;
}
