import 'package:flutter/cupertino.dart';

class FadeSlideTransition extends StatelessWidget {
  final Animation<double> animation;
  final double additionalOffset;
  final Widget child;

  const FadeSlideTransition({
    @required this.animation,
    @required this.additionalOffset,
    @required this.child,
  }) : assert(animation != null),
       assert(additionalOffset != null),
       assert(child != null);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      child: child,
      builder: (_, Widget builderChild) {
        return Transform.translate(
            offset: Offset(
                0.0,
                (32.0 + additionalOffset) * (1 - animation.value)
            ),
          child: Opacity(
            opacity: animation.value,
            child: builderChild,
          ),
        );
      },
    );
  }
}
