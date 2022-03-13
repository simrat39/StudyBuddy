import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_app/providers/timer_state_provider.dart';

class TimeSelectPage extends StatefulWidget {
  const TimeSelectPage({
    Key? key,
    required this.callback,
  }) : super(key: key);

  final Function(ChangeNotifierProvider<TimerStateProvider>) callback;

  @override
  State<TimeSelectPage> createState() => _TimeSelectPageState();
}

class _TimeSelectPageState extends State<TimeSelectPage> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController(text: "8200");
  }

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
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Set timer for: ",
                          style: Theme.of(context).textTheme.titleLarge),
                      TextField(
                        controller: _controller,
                      ),
                      Material(
                        type: MaterialType.transparency,
                        child: Card(
                          color: const Color(0xff8A93E9),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(12),
                            onTap: () {
                              int seconds = int.parse(_controller.value.text);
                              ChangeNotifierProvider<TimerStateProvider>
                                  provider = ChangeNotifierProvider(
                                (_) => TimerStateProvider(
                                  duration: Duration(seconds: seconds),
                                ),
                              );
                              widget.callback(provider);
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 30.0,
                                vertical: 16.0,
                              ),
                              child: Text("Begin",
                                  style:
                                      Theme.of(context).textTheme.titleLarge),
                            ),
                          ),
                        ),
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
