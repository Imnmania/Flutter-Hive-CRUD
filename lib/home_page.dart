import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //
  Box<String> friendsBox;
  //
  final _idController = TextEditingController();
  final _nameController = TextEditingController();
  //

  @override
  void initState() {
    super.initState();
    friendsBox = Hive.box<String>("friends");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Hive'),
      ),
      body: Stack(
        children: [
          // Center(
          //   child: FlatButton(
          //     color: Colors.blue,
          //     child: Text('View'),
          //     onPressed: () {
          //       /// get data using index
          //       print(friendsBox.getAt(2));

          //       /// get data using key
          //       print(friendsBox.get('a'));
          //     },
          //   ),
          // ),
          Center(
            child: ValueListenableBuilder(
              valueListenable: friendsBox.listenable(),
              builder: (context, Box<String> friends, _) {
                return ListView.separated(
                    itemBuilder: (context, index) {
                      final key = friends.keys.toList()[index];
                      final value = friends.get(key);
                      return ListTile(
                        title: Text(value),
                        subtitle: Text(key),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        color: Colors.black,
                        thickness: 0.5,
                      );
                    },
                    itemCount: friends.keys.toList().length);
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FlatButton(
                  color: Colors.amber,
                  child: Text('Add'),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (_) {
                          return BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                            child: Dialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                              elevation: 0,
                              child: Container(
                                padding: EdgeInsets.all(20),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextField(
                                      controller: _idController,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    TextField(
                                      controller: _nameController,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    FlatButton(
                                      child: Text('Submit'),
                                      onPressed: () {
                                        final key = _idController.text;
                                        final value = _nameController.text;

                                        friendsBox.put(key, value);
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  },
                ),
                FlatButton(
                  color: Colors.amber,
                  child: Text('Update'),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (_) {
                          return BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                            child: Dialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                              elevation: 0,
                              child: Container(
                                padding: EdgeInsets.all(20),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextField(
                                      controller: _idController,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    TextField(
                                      controller: _nameController,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    FlatButton(
                                      child: Text('Submit'),
                                      onPressed: () {
                                        final key = _idController.text;
                                        final value = _nameController.text;

                                        friendsBox.put(key, value);
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  },
                ),
                FlatButton(
                  color: Colors.amber,
                  child: Text('Delete'),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (_) {
                          return BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                            child: Dialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                              elevation: 0,
                              child: Container(
                                padding: EdgeInsets.all(20),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextField(
                                      controller: _idController,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    // TextField(
                                    //   controller: _nameController,
                                    // ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    FlatButton(
                                      child: Text('Submit'),
                                      onPressed: () {
                                        final key = _idController.text;
                                        // final value = _nameController.text;

                                        friendsBox.delete(key);
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
