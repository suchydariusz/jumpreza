import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class MobileBody extends StatelessWidget {
  const MobileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var uuid = Uuid();
    var data = [
      uuid.v4(),
      uuid.v4(),
      uuid.v4(),
      uuid.v4(),
      uuid.v4(),
      uuid.v4(),
      uuid.v4(),
      uuid.v4()
    ];

    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      appBar: AppBar(
        title: Text('M O B I L E'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AspectRatio(
              aspectRatio: 16 / 6,
              child: Container(
                color: Colors.deepPurple[400],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 8,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.deepPurple[300],
                    height: 120,
                    child: Center(child: Text(data[index])),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
