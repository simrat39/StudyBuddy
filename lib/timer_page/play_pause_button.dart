import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_app/main.dart';
import 'package:study_app/providers/timer_state_provider.dart';

class PlayPauseButton extends ConsumerStatefulWidget {
  const PlayPauseButton({Key? key}) : super(key: key);

  @override
  ConsumerState<PlayPauseButton> createState() => _PlayPauseButtonState();
}

class _PlayPauseButtonState extends ConsumerState<PlayPauseButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 400,
      ),
    );
  }

  void toggle(TimerStateProvider provider) {
    provider.toggle();
    provider.isPlaying
        ? _animationController.forward()
        : _animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    var timerStatus = ref.watch(timerStateNotifier);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(100),
        onTap: () {
          toggle(timerStatus);
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              width: 2,
              color: Colors.orange,
            ),
          ),
          child: AnimatedIcon(
            progress: _animationController,
            icon: AnimatedIcons.play_pause,
            color: Colors.orange,
            size: 80,
          ),
        ),
      ),
    );
  }
}
