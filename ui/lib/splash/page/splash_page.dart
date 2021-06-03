import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:harmony/spec/spec.dart';

final _assetName = 'assets/Harmony.svg';

class SplashPage extends StatefulWidget {
  SplashPage({required this.onComplete});

  final VoidCallback onComplete;
  @override
  _SplashPageState createState() => _SplashPageState();
}

// TODO(#32): Create a Splash page for users's loading the application
class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )
    ..addStatusListener((status) {
      if (status == AnimationStatus.completed) widget.onComplete();
    })
    ..forward();

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeOutCubic,
  ).drive(Tween(begin: 0, end: 4.25));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final logoSvg = SvgPicture.asset(
      _assetName,
      semanticsLabel: 'Harmony Logo',
      fit: BoxFit.scaleDown,
      height: Sizing.serverSideBarWidth,
    );
    return Scaffold(
      body: Center(
        child: RotationTransition(
          turns: _animation,
          child: TextButton(
            onPressed: widget.onComplete,
            child: logoSvg,
          ),
        ),
      ),
    );
  }
}
