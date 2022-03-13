import 'package:flutter/material.dart';
import 'package:study_app/timer_page/done_button.dart';
import 'package:study_app/timer_page/play_pause_button.dart';
import 'package:study_app/timer_page/quit_button.dart';
import 'package:study_app/timer_page/timer.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return TimerPageState();
  }
}

class TimerPageState extends State<TimerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Card(
                color: const Color(0xffFFE0C3),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 16.0,
                  ),
                  child: Row(
                    children: [
                      Text(
                        "Study Session ~ 1hr",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontSize: 22),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.edit,
                        size: 30,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              const TimerText(
                initial: Duration(
                  hours: 1,
                  minutes: 20,
                  seconds: 42,
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              Card(
                color: const Color(0xffFFE0C3),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 16.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "5 friends studying with you",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontSize: 22),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  DoneButton(),
                  PlayPauseButton(),
                  QuitButton(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
