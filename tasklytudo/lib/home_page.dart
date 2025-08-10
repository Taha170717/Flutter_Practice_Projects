import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'models/task.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late double _devheight, _devwidth;
  String? _newtaskContent;
  Box? _box;
  _HomePageState();

  @override
  Widget build(BuildContext context) {
    _devwidth = MediaQuery.of(context).size.width;
    _devheight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        toolbarHeight: _devheight * 0.1,
        title: Text(
          'Taskly!',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: _taskView(),
      floatingActionButton: _addtaskButton(),
    );
  }

  Widget _Tasklist() {
    List tasks = _box!.values.toList();
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (BuildContext context, int index) {
        var task = Task.fromMap(tasks[index]);
        return  ListTile(
          title: Text(
           task.content,
            style: TextStyle(decoration: task.done? TextDecoration.lineThrough : null),
          ),
          subtitle: Text(task.timestamp.toString()),
          trailing: Icon(
            task.done? Icons.check_box_outlined: Icons.check_box_outline_blank,
            color: Colors.red,
          ),
          onTap: (){

            setState(() {
              task.done = !task.done;
              _box!.putAt(index, task.toMap());
            });

          },
          onLongPress: (){
            setState(() {
              _box!.deleteAt(index);
            });
        },
        );

      },
    );


  }
  Widget _taskView ()  {

    return FutureBuilder(future: Hive.openBox('tasks'), builder: (BuildContext _context, AsyncSnapshot _snapshot){
      if (_snapshot.connectionState == ConnectionState.done){
        _box = _snapshot.data;
        return _Tasklist();
      }
      else{
        return Center(child: CircularProgressIndicator());
      }
    } );
  }

  Widget _addtaskButton(){
    return FloatingActionButton(onPressed: _displaytaskPopUp,
      backgroundColor: Colors.red,
    child: Icon(Icons.add,color: Colors.white,),
    );
  }

  void _displaytaskPopUp(){
    showDialog(context: context, builder: (BuildContext _context){
      return AlertDialog(
        title: Text("Add New Task"),
        content: TextField(
          onSubmitted: (_value){
            if (_newtaskContent != null){
              var task = Task(content: _newtaskContent!, timestamp: DateTime.now(), done: false);
              _box!.add(task.toMap());
              setState(() {
                _newtaskContent = null;
                Navigator.pop(context);
              });

            }
          },
          onChanged: (_value){
            setState(() {
              _newtaskContent = _value;
            });

          },

        ),

      );
    });
  }


}
