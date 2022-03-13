import 'package:flutter/material.dart';
import 'package:study_app/invite_homies/invite_homies_page.dart';
import 'package:study_app/pmd_page/pmd_page.dart';
import 'package:study_app/pmd_select/pmd_select_page.dart';
import 'package:study_app/time_select/time_select_page.dart';
import 'package:study_app/timer_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  List<String> days = ["Mo", "Tu", "We", "Th", "Fr", "Sa", "Su"];

  static String dateTimetoHumanReadable(DateTime dt) {
    String dateSlug =
        "${dt.year.toString()}-${dt.month.toString().padLeft(2, '0')}-${dt.day.toString().padLeft(2, '0')}";
    return dateSlug;
  }

  @override
  Widget build(BuildContext context) {
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
            child: ListView(
              children: [
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Good Afternoon",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                          Text(
                            "Simrat",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                        ],
                      ),
                    ),
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: const Color(0xffBDDBEC),
                      child: Image.asset(
                        "assets/tomato_red.png",
                        width: 36,
                        height: 36,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                const SizedBox(
                  height: 20,
                ),
                Card(
                  color: const Color(0xffD7DEF8),
                  child: Container(
                    padding: const EdgeInsets.all(
                      20.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Today: ${dateTimetoHumanReadable(DateTime.now())}",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            Text(
                              "Your Study Streak: 7 Days",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        const Divider(),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: days
                              .map(
                                (e) => Expanded(
                                  child: CircleAvatar(
                                    child: Text(e),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Material(
                  type: MaterialType.transparency,
                  child: Card(
                    color: const Color(0xff8A93E9),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () => {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const InviteHomiesPage(),
                          ),
                        )
                      },
                      child: Container(
                        padding: const EdgeInsets.all(
                          20.0,
                        ),
                        child: Column(
                          children: [
                            Text(
                              "Begin a group study session",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(fontSize: 30),
                            ),
                            const SizedBox(
                              height: 40.0,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Invite Friends",
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                const Spacer(),
                                Row(
                                  children: const [
                                    Icon(
                                      Icons.message,
                                      size: 30,
                                    ),
                                    SizedBox(
                                      width: 12,
                                    ),
                                    Icon(
                                      Icons.mail,
                                      size: 30,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Material(
                  type: MaterialType.transparency,
                  child: Card(
                    color: const Color(0xffFFE0C3),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(14),
                      onTap: () => {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => TimeSelectPage(
                              callback: (p) {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => TimerPage(
                                      timerStateChangeNotifier: p,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        )
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12.0,
                          vertical: 16.0,
                        ),
                        child: Row(
                          children: [
                            Text(
                              "Set a timer block",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(fontSize: 22),
                            ),
                            const Spacer(),
                            Image.asset(
                              "assets/hourglass.png",
                              height: 30,
                              width: 30,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Material(
                  type: MaterialType.transparency,
                  child: Card(
                    color: const Color(0xffFFD7D7),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(14),
                      onTap: () => {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => PmdSelectPage(
                              callback: (p) {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => PmdPage(
                                      pmdStateChangeNotifier: p,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        )
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12.0,
                          vertical: 16.0,
                        ),
                        child: Row(
                          children: [
                            Text(
                              "Start a pomodoro",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(fontSize: 22),
                            ),
                            const Spacer(),
                            Image.asset(
                              "assets/tomato_black.png",
                              height: 30,
                              width: 30,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
