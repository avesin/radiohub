import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:radioapp/core/providers.dart';

class BlinkDot extends ConsumerWidget {
  const BlinkDot({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(blinkTimerProvider);

    final state = ref.watch(blinkProvider);

    return AnimatedOpacity(
      opacity: state.visible ? 1 : 0,
      duration: const Duration(milliseconds: 700),
      child: Icon(Icons.circle, size: 8, color: state.color),
    );
  }
}
