import 'package:flutter/material.dart';

class Bounce extends StatefulWidget {
  const Bounce({super.key, required this.child, required this.animate});
  final Widget child ;
  final bool animate ;
  @override
  State<Bounce> createState() => _BounceState();
}

class _BounceState extends State<Bounce> with SingleTickerProviderStateMixin {
  late AnimationController _controller ;
  late Animation<double> _animation ;
  @override
  void initState() {
    _controller = AnimationController(duration:const Duration(milliseconds: 200),vsync: this);
    _animation = TweenSequence<double>(
      [
        TweenSequenceItem(tween: Tween(begin:1.0 ,end:1.3), weight: 1),
        TweenSequenceItem(tween: Tween(begin:1.3,end:1), weight: 1),
      ]
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.bounceInOut));
    super.initState();
  }
  @override
  void didUpdateWidget(covariant Bounce oldWidget) {
    if(widget.animate){
      _controller.reset();
      _controller.forward();
    }
    super.didUpdateWidget(oldWidget);
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  ScaleTransition(
      scale: _animation,
      child: widget.child,
    );
  }
}