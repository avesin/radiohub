import 'package:flutter/material.dart';

class TransparentRoute extends PageRouteBuilder {
  final Widget child; // Changed from 'builder' to 'child' for clarity

  TransparentRoute({required this.child})
    : super(
        opaque: false,
        // Correctly returning the widget here:
        pageBuilder: (context, animation, secondaryAnimation) => child,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
                .animate(
                  CurvedAnimation(
                    parent: animation,
                    curve: Curves.easeOutQuart, // Smoother transition
                  ),
                ),
            child: child,
          );
        },
      );
}
