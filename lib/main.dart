import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:simpletask/Screens/taskAddBottomSheet.dart';

import 'Models/task.dart';
import 'Store/taskStore.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TasksPage(),
    );
  }
}

class TasksPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: ()=>showModalBottomSheet(
            isScrollControlled: true,
          context: context,
          builder: (_)=>TaskAddBottomSheet()
        ).then((value){
          if(value!=null){
            scaffoldKey.currentState.showSnackBar(SnackBar(content:Text("Görev eklendi",style: TextStyle(color: Colors.white),) ,backgroundColor: Colors.green,));
          }
        }),
      ),
      body: SafeArea(
        child: Observer(
          builder:(_)=> taskStore.tasks.length == 0 ? Center(child: Text("Listenizde görev bulunmuyor")):ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: taskStore.tasks.length,
              itemBuilder: (BuildContext context,int index)=>
          taskItem(taskStore.tasks[index])
          ),
        ),
      ),
    );
  }

  Widget taskItem(Task taskItem)=>Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(

      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.circular(8.0)
      ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(taskItem.date.parseDate(),style: TextStyle(color: Colors.grey),),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical:8.0),
                    child: Text(taskItem.description),
                  )
                ],
              ),
            ],
          ),
        )
    ),
  );
}

