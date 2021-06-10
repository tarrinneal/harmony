import 'package:flutter/material.dart';
import 'package:harmony/splash/splash.dart';

import 'app_route_arguments.dart';
import 'harmony_page.dart';

typedef ArgumentBuilder<T extends PageBuilderArguments> = Widget Function(
  BuildContext,
  T,
);

abstract class PageBuilder<T extends PageBuilderArguments> {
  const PageBuilder();
  Page build(BuildContext context, T args);
}

class MaterialPageBuilder<T extends PageBuilderArguments>
    extends PageBuilder<T> {
  const MaterialPageBuilder({required this.builder});

  final ArgumentBuilder<T> builder;
  @override
  Page build(BuildContext context, T args) {
    return MaterialPage(child: builder(context, args));
  }
}

final _splashPageBuilder = MaterialPageBuilder<SplashPageBuilderArguments>(
  builder: (_, args) => SplashPage(onComplete: args.advance),
);

final routeMap = <HarmonyPage, PageBuilder>{
  HarmonyPage.splash: _splashPageBuilder,
};
