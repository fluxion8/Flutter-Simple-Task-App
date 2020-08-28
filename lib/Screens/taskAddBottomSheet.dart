import 'package:flutter/material.dart';
import 'package:simpletask/Models/task.dart';
import 'package:simpletask/Store/taskStore.dart';


class TaskAddBottomSheet extends StatefulWidget {
  @override
  _TaskAddBottomSheetState createState() => _TaskAddBottomSheetState();
}

class _TaskAddBottomSheetState extends State<TaskAddBottomSheet> {
  DateTime selectedDate;
  TextEditingController description = TextEditingController();
  bool descriptionError=false;
  bool dateError=false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom,right: 8.0,left: 8.0,top: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            onTap: (){
              setState(() {
                descriptionError=false;
              });
            },
            controller: description,
            decoration: InputDecoration(
              errorText: descriptionError ? "Boş bırakılamaz" : null,
              errorBorder: descriptionError ?OutlineInputBorder(borderSide: BorderSide(color: Colors.red,width: 1,),borderRadius: BorderRadius.circular(8.0)): null,
                hintText: "Planlarınızdan bahsedin", border: InputBorder.none),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
              onTap: () => showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2015),
                      lastDate: DateTime(2025))
                  .then((DateTime date) {
                    setState((){
                      dateError=false;
                      print(date);
                      selectedDate = date;
                    });
                    }

                  ),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: dateError ? Colors.red:Colors.blue),
                    borderRadius: BorderRadius.circular(8.0)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      selectedDate==null ? "Lütfen bir tarih seçin":selectedDate.parseDate(),
                      style:TextStyle(color: dateError ? Colors.red : null)
                      ),
                ),
              )),
          Container(
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.centerRight,
            margin: EdgeInsets.all(8.0),
            child: RaisedButton.icon(
                onPressed: (){
                    if(description.text.length == 0){
                      setState(() {
                        descriptionError=true;
                      });
                      return true;
                    }
                    if(selectedDate == null){
                      setState(() {
                        dateError=true;
                      });
                      return true;
                    }


                    taskStore.add(Task(description.text, selectedDate));

                    Navigator.of(context).pop(true);
                },
                icon: Icon(Icons.save),
                label: Text("Kaydet")),
          )
        ],
      ),
    );
  }
}
extension readableDate on DateTime {
  String parseDate() {
    return "${this.day}.${this.month}.${this.year}";
  }
}