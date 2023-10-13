import 'package:cama_mod/models/counter_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Consumer<CounterModel>(builder: (ctx, data, _) {
              return Text("${data.x}");
            }),
            ElevatedButton(
                onPressed: () {
                  context.read<CounterModel>().incrementX();
                },
                child: const Text("Increment")),
            ElevatedButton(
                onPressed: () {
                  context.read<CounterModel>().decrementX();
                },
                child: const Text("Decrement")),
            ElevatedButton(
              onPressed: () => context.pushNamed("home"),
              child: const Text("To Home"),
            )
          ],
        ),
      ),
    );
  }
}
