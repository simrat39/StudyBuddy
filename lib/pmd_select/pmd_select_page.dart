import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_app/models/pmd_data.dart';
import 'package:study_app/providers/timer_state_provider.dart';

class PmdSelectPage extends StatefulWidget {
  const PmdSelectPage({
    Key? key,
    required this.callback,
  }) : super(key: key);

  final Function(ChangeNotifierProvider<TimerStateProvider>) callback;

  @override
  State<PmdSelectPage> createState() => _PmdSelectPageState();
}

class _PmdSelectPageState extends State<PmdSelectPage> {
  late PmdData _data;

  @override
  void initState() {
    super.initState();
    _data = PmdData(20, 5);
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
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text(
                                "Start a Pomodoro",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                      fontSize: 30,
                                    ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Image.asset(
                                "assets/tomato_black.png",
                                height: 72,
                                width: 72,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xffC6D2FF),
                                  borderRadius: BorderRadius.circular(
                                    14,
                                  ),
                                ),
                                child: RadioListTile<PmdData>(
                                  title:
                                      const Text('20 min focus; 5 min break'),
                                  value: PmdData(20, 5),
                                  groupValue: _data,
                                  onChanged: (var value) {
                                    setState(() {
                                      _data = value!;
                                    });
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xffC6D2FF),
                                  borderRadius: BorderRadius.circular(
                                    14,
                                  ),
                                ),
                                child: RadioListTile<PmdData>(
                                  title:
                                      const Text('40 min focus; 10 min break'),
                                  value: PmdData(40, 10),
                                  groupValue: _data,
                                  onChanged: (var value) {
                                    setState(() {
                                      _data = value!;
                                    });
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xffC6D2FF),
                                  borderRadius: BorderRadius.circular(
                                    14,
                                  ),
                                ),
                                child: RadioListTile<PmdData>(
                                  title:
                                      const Text('60 min focus; 20 min break'),
                                  value: PmdData(60, 20),
                                  groupValue: _data,
                                  onChanged: (var value) {
                                    setState(() {
                                      _data = value!;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 14.0),
                            child: Material(
                              type: MaterialType.transparency,
                              child: Card(
                                color: const Color(0xffFFD7D7),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(12),
                                  onTap: () {
                                    /* int minutes = */
                                    /*     int.parse(_controller.value.text); */
                                    /* ChangeNotifierProvider<TimerStateProvider> */
                                    /*     provider = ChangeNotifierProvider( */
                                    /*   (_) => TimerStateProvider( */
                                    /*     duration: Duration(minutes: minutes), */
                                    /*   ), */
                                    /* ); */
                                    /* widget.callback(provider); */
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0,
                                      vertical: 16.0,
                                    ),
                                    child: Row(
                                      children: [
                                        Text("Begin",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge),
                                        const Spacer(),
                                        const Icon(
                                          CupertinoIcons.chevron_right,
                                        ),
                                      ],
                                    ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
