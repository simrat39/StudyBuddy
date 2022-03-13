import 'package:flutter/material.dart';
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Good Afternoon",
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                      Text(
                        "Simrat",
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  const CircleAvatar(
                    radius: 30,
                    child: Icon(
                      Icons.person,
                      size: 40,
                    ),
                  ),
                ],
              ),
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
                            "Today: Date",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text(
                            "Your Study Streak: 3 Days",
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
                        children: List.filled(
                          7,
                          const Expanded(child: CircleAvatar()),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Material(
                type: MaterialType.transparency,
                child: Card(
                  color: const Color(0xff8A93E9),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
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
                        "Set a timer block",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontSize: 22),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.timer,
                        size: 30,
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                color: const Color(0xffFFD7D7),
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
                      const Icon(
                        Icons.apple,
                        size: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
