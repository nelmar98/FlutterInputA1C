import 'dart:io';

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'numpad_input.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InputPage(),
    );
  }
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String userInput = '';
  var answer = '';
  int rowNumber = 4;
  //Array of buttons
  final List<String> buttons = [
    '7',
    '8',
    '9',
    'C',
    '4',
    '5',
    '6',
    ' ',
    '1',
    '2',
    '3',
    ' ',
  ];

  // '0',
  // '.',
  // 'Input',

  final List<String> buttons2 = [
    '0',
    '.',
    'Input',
  ];

  var alert_message;
  var alert_title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.black,
        //centerTitle: true,
        title: Row(
          children: <Widget>[
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white),
                onPressed: () {},
                child: Row(
                  children: const <Widget>[
                    Icon(Icons.arrow_back_ios_new_outlined),
                    Text('Back', style: TextStyle(fontSize: 18.0)),
                  ],
                )),
            const Padding(
                padding: EdgeInsets.fromLTRB(40.0, 0, 0, 0),
                child: Text('Input A1C', style: TextStyle(fontSize: 25.0))),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 100.0,
            // width: 10.0,
            padding: EdgeInsets.all(10.0),
            color: Color(0xFF616161),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Displayed Date here',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
                Column(
                  children: [
                    Icon(
                      Icons.date_range_outlined,
                      size: 60.0,
                      color: Colors.white,
                    ),
                    Text(
                      "DATE",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.date_range_outlined,
                      size: 60.0,
                      color: Colors.white,
                    ),
                    Text(
                      'NOW',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                )
              ],
            ),
          ),

          //Container for user input
          Container(
            height: 100.0,
            // width: 10.0,
            color: Color(0xFFFAFAFA),
            padding: const EdgeInsets.all(30.0),
            child: Center(
              child: Text(
                '$userInput%',
                style: TextStyle(fontSize: 25.0),
              ),
            ),
          ),

          //sizebox for numpad
          Container(
            height: 285.0,
            // width: 10.0,
            color: Color(0xFFFAFAFA),
            //padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 5.0),
            child: Padding(
              padding: const EdgeInsets.only(left: 5.0, right: 5.0),
              child: GridView.builder(
                itemCount: buttons.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (BuildContext context, int index) {
                  if (buttons[index] == ' ') {
                    return MyButton(
                      buttontapped: null,
                      buttonText: buttons[index],
                      color: Color(0xFFFAFAFA),
                      textColor: Color(0xFFFAFAFA),
                    );
                  }

                  //clear button
                  if (buttons[index] == 'C') {
                    return MyButton(
                      buttontapped: () {
                        setState(() {
                          userInput = '';
                        });
                      },
                      buttonText: buttons[index],
                      color: Color(0xFFE91E63),
                      textColor: Colors.white,
                    );
                  } else {
                    return MyButton(
                      buttontapped: () {
                        if (userInput.length == 3) {
                          null;
                        } else {
                          setState(() {
                            userInput += buttons[index];
                            //put condition here
                          });
                        }
                      },
                      buttonText: buttons[index],
                      color: Color(0xFF808080),
                      textColor: Colors.white,
                    );
                  }
                },
              ),
            ),
          ),
          Container(
            height: 100.0,
            //color: Colors.red,
            color: Color(0xFFFAFAFA),
            child: Padding(
              padding: EdgeInsets.only(left: 4.0, right: 5.0),
              child: Row(
                children: [
                  Container(
                    width: 98.0,
                    height: 98.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100.0),
                      child: MyButton(
                        buttontapped: () {
                          if (userInput.length == 3) {
                            null;
                          } else {
                            setState(() {
                              userInput += buttons2[0];
                            });
                          }
                        },
                        buttonText: buttons2[0],
                        color: Color(0xFF808080),
                        textColor: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    width: 98.0,
                    height: 98.0,
                    child: MyButton(
                      buttontapped: () {
                        if (userInput.contains('.') || userInput.length == 3) {
                          null;
                        } else {
                          setState(() {
                            userInput += buttons2[1];
                            //put condition here
                          });
                        }
                      },
                      buttonText: buttons2[1],
                      color: Color(0xFF808080),
                      textColor: Colors.white,
                    ),
                  ),
                  MyInputBtn(
                    buttontapped: () async {
                      if (userInput.isEmpty) {
                        alert_title = 'Confirm A1C';
                        alert_message = 'Input A1C';
                      } else {
                        if (userInput.length == 3) {
                          null;
                        }
                        if ((double.parse(userInput) > 20) ||
                            (double.parse(userInput) < 3)) {
                          alert_title = 'Confirm A1C';
                          alert_message = 'Input A1C between 3.0 to 20.0';
                        } else {
                          await DatabaseHelper.instance.add(
                            InputA1C(a1cInput: userInput),
                          );
                          alert_title = 'Input Processing';
                          alert_message = 'Input Completed';

                          //alert_message = 'You inputted $userInput';

                          //if inputted in the same date...
                          // alert_title = 'Confirm Overwrite';
                          // alert_message = 'A1C data has already been inputted on the same date';
                        }
                      }

                      setState(() {
                        userInput = '';
                      });

                      //alert dialog
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          backgroundColor: Color(0xFF141414),
                          title: Text(
                            alert_title,
                            style: TextStyle(color: Colors.white),
                          ),
                          content: Text(
                            alert_message,
                            style: TextStyle(color: Colors.white),
                          ),
                          actions: <Widget>[
                            // TextButton(
                            //   onPressed: () => Navigator.pop(context, 'Cancel'),
                            //   child: const Text('Cancel'),
                            // ),
                            Container(
                              color: Color(0xFFA7A7A7),
                              width: 100.0,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: Color(0xFFE8E8E8),
                                ),
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: Center(
                                  child: const Text(
                                    'OK',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    buttonText: buttons2[2],
                    color: Color(0xFFE91E63),
                    textColor: Colors.white,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void BtnInputPressed() {
    String finalUserInput = userInput;
    Parser p = Parser();
    Expression exp = p.parse(finalUserInput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    answer = eval.toString();
  }
}

//create InputA1C Model
class InputA1C {
  final int? id;
  final String a1cInput;

  InputA1C({this.id, required this.a1cInput});

  //add factory from map
  factory InputA1C.fromMap(Map<String, dynamic> json) => InputA1C(
        id: json['ID'],
        a1cInput: json['TEXT_INPUTA1C'],
      );
//add method toMap
  Map<String, dynamic> toMap() {
    return {
      'ID': id,
      'TEXT_INPUTA1C': a1cInput,
    };
  }
}

//create a database helper class
//this will help with the database
//Creating a singleton class
//Singleton class creates only one instance/object throughout
// the life cycle and
//that instance/object is accessible globally.
class DatabaseHelper {
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  //after importing the sqflite
  static Database? _database;

//if this variable _database doesn't exist then its going to initialize the _initDatabase.
//otherwise it's going to use the set variable.
  Future<Database> get database async => _database ??= await _initDatabase();

  // after importing path and provider
  //creating the _initDatabase
  Future<Database> _initDatabase() async {
    //import the dart.io library to make Directory work
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'INPUT_A1C.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  //if the INPUT_A1C.db' doesn't exist...
  // we need the oncreate method
  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE INPUT_A1C(
      ID INTEGER PRIMARY KEY,
      TEXT_INPUTA1C TEXT
      )
    ''');
    //This will create the InputA1C table when it creates the database
  }

  //add method
  Future<int> add(InputA1C inputtedA1C) async {
    Database db = await instance.database;
    return await db.insert('INPUT_A1C', inputtedA1C.toMap());
  }
}
