

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var data = MyModel();

    return Provider(
      create: (BuildContext context) {
        return data;
      },
      child: MaterialApp(
          home: Scaffold(
            appBar: AppBar(title: Text('Provider example')),
            backgroundColor: Colors.grey,
            body: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[

                Container(
                  padding: const EdgeInsets.all(20),
                  color: Colors.green[200],
                  child: Consumer<MyModel>(
                    builder: (context, mymodel, child) {
                      return ElevatedButton(
                        child: Text('Do something'),
                        onPressed: () {
                          mymodel.doSomething();
                        },
                      );
                    },
                  ),
                ),

                Container(
                  padding: const EdgeInsets.all(35),
                  color: Colors.blue[200],
                  child: Consumer<MyModel> (builder: (context, myData, child) {
                    return Text(myData.text);
                  },),
                  // child: Consumer<MyModel>(
                  //   builder: (context, mymodel, child) {
                  //     return Text(mymodel.text);
                  //   },
                  // ),
                ),

              ],
            ),
          ),
        ),
    );
  }
}


class MyModel {
  String text = "Hello";

  void doSomething() {
    text = "World";
  }
}