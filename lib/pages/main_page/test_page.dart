import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test Page"),
      ),
      body: Center(
          child: Column(
        children: [
          SizedBox(
            height: 300,
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("Item $index"),
                );
              },
            ),
          ),
          CircleAvatar(
            backgroundColor: Colors.redAccent,
            child: IconButton(
              onPressed: (() => {}),
              icon: const Icon(Icons.search),
              style: IconButton.styleFrom(backgroundColor: Colors.redAccent),
            ),
          ),
          IconButton(
              onPressed: (() => {}),
              icon: const Icon(Icons.add),
              style: IconButton.styleFrom(
                backgroundColor: Colors.redAccent,
              )),
        ],
      )),
    );
  }
}
