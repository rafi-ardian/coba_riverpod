import 'package:coba_riverpod/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerWidget {
  Home({super.key});
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                ref.watch(Counter).value.toString(),
                style: TextStyle(fontSize: 50),
              ),
              Text(ref.watch(ChangeName).name, style: TextStyle(fontSize: 25)),
              ElevatedButton(
                onPressed: () {
                  ref.read(Counter).increment();
                },
                child: Icon(Icons.plus_one),
              ),
              ElevatedButton(
                onPressed: () {
                  ref.read(Counter).decrement();
                },
                child: Icon(Icons.remove),
              ),
              ElevatedButton(
                onPressed: () {
                  ref.read(Counter).reset();
                },
                child: Text("Reset"),
              ),
              TextField(
                controller: textController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  ref.read(ChangeName).changeName(textController.text);
                },
                child: Text("Change name"),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text("Go to second page"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
