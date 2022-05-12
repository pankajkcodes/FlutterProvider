import 'package:flutter/material.dart';
import 'package:flutterprovider/providers/home_screen_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: ChangeNotifierProvider<HomeScreenProvider>(
            create: (context) => HomeScreenProvider(),
            child: Consumer<HomeScreenProvider>(
                builder: (context, provider, child) {
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(provider.eligibleMessage.toString(),
                        style: TextStyle(
                            color: (provider.isEligible == true)
                                ? Colors.green
                                : Colors.red)),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: "Enter Your Age ",
                      ),
                      onChanged: (val) {
                        provider.checkEligibility(int.parse(val));
                      },
                    )
                  ]);
            }),
          ),
        ),
      ),
    );
  }
}
