import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do List App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyToDoList(),
    );
  }
}

class MyToDoList extends StatefulWidget {
  @override
  _MyToDoListState createState() => _MyToDoListState();
}

class _MyToDoListState extends State<MyToDoList> {
  final List<String> _ToDoList = <String>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My To Do List'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: _addToDoList,
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
      body: _buildToDoList(),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(icon: Icon(Icons.menu), onPressed: () {},),
            IconButton(icon: Icon(Icons.search), onPressed: () {},),
          ],
        ),
        color: Colors.white,
      ),
    );
  }

  void _addListPopUp(context) {
    final myController = TextEditingController();

    @override
    void dispose() {
      myController.dispose();
      super.dispose();
    }

    Alert(
        context: context,
        title: "Add To Do List:",
        content: Column(
          children: <Widget>[
            TextField(
              controller: myController,
              // decoration: InputDecoration(
              //   icon: Icon(Icons.account_circle),
              //   labelText: 'To Do: ',
              // ),
            ),
          ],
        ),
        image: Image.asset("assets/success.png"),
        buttons: [
          DialogButton(
            onPressed: () {
              setState(() {
                _ToDoList.add(myController.text);
              });
              Navigator.pop(context);
            },
            child: Text(
              "Add",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]).show();
  }

  void _addToDoList() {
    _addListPopUp(context);
  }

  Widget _buildToDoList() {
    return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _ToDoList.length,
        itemBuilder: (BuildContext _context, int i) {
          return _buildRowToDo(_ToDoList[i]);
        }
    );
  }

  IconData currentIcon = Icons.check_box_outline_blank;

  Widget _buildRowToDo(String ToDoVar) {

    return Column(
      children: [
        ListTile(
          leading: Container(
            width: 30,
            height: 30,
            child: IconButton(
              icon: Icon(currentIcon, size: 10),
              onPressed: () {
                setState(() {
                  currentIcon = Icons.check;
                  _ToDoList.remove(ToDoVar);
                });
              }
            ),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey),
          ),
          title: Text(
              ToDoVar
          ),
        ),
        Divider(),
      ],
    );
  }
}