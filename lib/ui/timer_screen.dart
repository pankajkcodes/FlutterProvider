import 'package:flutter/material.dart';
import 'package:flutterprovider/providers/timer_provider.dart';
import 'package:provider/provider.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({Key? key}) : super(key: key);

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: ChangeNotifierProvider<TimerProvider>(
      create: (context) => TimerProvider(),
      child: Consumer<TimerProvider>(
        builder: (context, timer, widget) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('${timer.hour}'),
                  Text('${timer.minute}'),
                  Text('${timer.seconds}'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  (timer.startEnable)
                      ? ElevatedButton(
                          onPressed: timer.startTimer, child: const Text('Start'))
                      : ElevatedButton(
                          onPressed: () {}, child: const Text('Start')),
                  (timer.stopEnable)
                      ? ElevatedButton(
                          onPressed: timer.stopTimer, child: const Text('Stop'))
                      : ElevatedButton(
                          onPressed: () {}, child: const Text('Stop')),
                  (timer.continueEnable)
                      ? ElevatedButton(
                          onPressed: timer.continueTimer, child: const Text('Continue'))
                      : ElevatedButton(
                          onPressed: () {}, child: const Text('Continue')),
                ],
              ),
            ],
          );
        },
      ),
    )));
  }
}
