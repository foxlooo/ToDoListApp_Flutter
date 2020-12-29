import 'package:flutter/material.dart';

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

  void _addToDoList() {


    setState(() {
      _ToDoList.add("ABCDEF");
    });
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

  Widget _buildRowToDo(String ToDoVar) {
    return Column(
      children: [
        ListTile(
          title: Text(
              ToDoVar
          ),
        ),
        Divider(),
      ],
    );
  }
}