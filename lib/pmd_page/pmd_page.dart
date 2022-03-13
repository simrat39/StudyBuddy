import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_app/done_page/done_page.dart';
import 'package:study_app/pmd_page/pmd_play_pause_button.dart';
import 'package:study_app/pmd_page/pmd_timer_text.dart';
import 'package:study_app/providers/pmd_state_provider.dart';
import 'package:study_app/timer_page/buddy_row.dart';
import 'package:study_app/timer_page/done_button.dart';
import 'package:study_app/timer_page/quit_button.dart';

class PmdPage extends ConsumerStatefulWidget {
  const PmdPage({Key? key, required this.pmdStateChangeNotifier})
      : super(key: key);

  final ChangeNotifierProvider<PmdStateProvider> pmdStateChangeNotifier;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return TimerPageState();
  }
}

class TimerPageState extends ConsumerState<PmdPage> {
  @override
  Widget build(BuildContext context) {
    var prov = ref.watch(widget.pmdStateChangeNotifier);
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
            child: Column(
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Card(
                      color: const Color(0xffFFD7D7),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14.0,
                          vertical: 16.0,
                        ),
                        child: Column(
                          children: [
                            Text(
                              "Pomodoro",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(fontSize: 22),
                            ),
                            Text(
                              "${prov.pmdData.focusTime} min focus; ${prov.pmdData.breakTime} min break",
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
                    Text(
                      prov.focusing ? "Focus" : "Break",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    PmdTimerText(
                      initial: const Duration(
                        hours: 1,
                        minutes: 20,
                        seconds: 42,
                      ),
                      pmdStateNotifier: widget.pmdStateChangeNotifier,
                    ),
                    Material(
                      type: MaterialType.transparency,
                      child: Card(
                        color: const Color(0xff8A93E9),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(12),
                          onTap: () {
                            prov.focusing ? prov.break_() : prov.focus();
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 8,
                            ),
                            child: Text(
                              prov.focusing
                                  ? "Next Break: ${prov.pmdData.breakTime} Minutes >>"
                                  : "Next Focus: ${prov.pmdData.focusTime} Minutes",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
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
                              "4 buddies studying with you",
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
                      height: 15,
                    ),
                    const BuddyRow(),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        DoneButton(onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const DonePage(),
                            ),
                          );
                        }),
                        PmdPlayPauseButton(
                          pmdStateNotifier: widget.pmdStateChangeNotifier,
                        ),
                        QuitButton(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => ClipRRect(
                                borderRadius: BorderRadius.circular(14),
                                child: AlertDialog(
                                  backgroundColor: Colors.white,
                                  title: const Text("Its sad to see you go!"),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text("Close"),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).popUntil(
                                          (route) => route.isFirst,
                                        );
                                      },
                                      child: const Text("Exit"),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
