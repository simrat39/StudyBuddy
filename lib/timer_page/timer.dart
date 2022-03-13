import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_app/providers/timer_state_provider.dart';

class TimerText extends ConsumerStatefulWidget {
  const TimerText({
    Key? key,
    required this.initial,
    required this.timerStateNotifier,
  }) : super(key: key);

  final Duration initial;
  final ChangeNotifierProvider<TimerStateProvider> timerStateNotifier;

  @override
  ConsumerState<TimerText> createState() => _TimerTextState();
}

class _TimerTextState extends ConsumerState<TimerText> {
  static String secondsToHumanReadable(int sec) {
    var minutes = (sec ~/ 60).toString();
    var seconds = (sec % 60).toString();
    if (seconds.length == 1) seconds = '0$seconds';
    if (minutes.length == 1) minutes = '0$minutes';
    if (sec > const Duration(hours: 1).inSeconds) {
      var hours = (int.parse(minutes) ~/ 60).toString();
      minutes = (int.parse(minutes) - (int.parse(hours) * 60)).toString();
      if (hours.length == 1) hours = '0$hours';
      if (minutes.length == 1) minutes = '0$minutes';
      return '$hours:$minutes:$seconds';
    }
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    var provider = ref.watch(widget.timerStateNotifier);
    return Text(
      secondsToHumanReadable(provider.remaining!),
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: 80,
          ),
    );
  }
}
