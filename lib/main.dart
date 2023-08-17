import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:super_tooltip/super_tooltip.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'List Project'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

final name = TextEditingController();
final desc = TextEditingController();
final price = TextEditingController();
final qty = TextEditingController();

List todoList = [
  ["demo1","abc","99","2"],
  ["demo2","xyz","99","3"],
];

void onSave(){
  setState(() {
    todoList.add([name.text,desc.text,price.text,qty.text],);
  });
  Navigator.of(context).pop();
}



void createNewTask(){
    showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          // backgroundColor: Colors.cyan,
          content: Container(
            height: 350,
            child: Center(
              child: Column(  
                children:[
                  Container(
                    child: TextField(
                      controller: name,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Enter Name",
                    ),
                                ),
                  ),
                      
                Container(
                  padding: EdgeInsets.only(top: 15),
                  child: TextField(
                    controller: desc,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Enter Description",
                    ),
                  ),
                ),
                      
                Container(
                  padding: EdgeInsets.only(top: 15),
                  child: TextField(
                    controller: price,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Enter Price",
                    ),
                  ),
                ),
                      
                Container(
                  padding: EdgeInsets.only(top: 15),
                  child: TextField(
                    controller: qty,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Enter Quantity",
                    ),
                  ),
                ),
                
                Container(
                  width: 230,
                  height: 60,
                  padding: EdgeInsets.only(top: 15),
                  child: ElevatedButton(
                    onPressed: onSave,
                    child: Text("Save",style: TextStyle(fontSize: 18),)
                    ),
                ),
                ], 
              ),
            ),
          ),
        );
    },
  );
}




  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Row(
          children: [
            Text(widget.title),
            SuperTooltip(
              showBarrier: true,
              content: Row(
                children: [
                  Container(
                    height: 10,
                    width: 10,
                    color: Colors.amber,
                  ),
                  Text(" :Occupied"),
                  SizedBox(width: 10),
                  Container(
                    height: 10,
                    width: 10,
                    color: Colors.grey,
                  ),
                  Text(" :Inactive"),
                ],
              ),
              child: Container(
                child: const Icon(
                  Icons.info_outline
                  )),
            )
          ],
        ),

      ),

      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),

      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.only(left: 25,right: 25,top: 25),
            child: Column(
              children: [
                Slidable(
                  endActionPane: ActionPane(
                    motion: StretchMotion(),
                    children: [
                      SlidableAction(
                        backgroundColor: Colors.red,
                        borderRadius: BorderRadius.circular(11),
                        onPressed: (context) => setState(() {
                          todoList.removeAt(index);
                        }),
                        icon: Icons.delete,
                      )
                    ],
                  ),
                  child: Container(
                      padding: EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        color: Colors.cyan,
                        borderRadius: BorderRadius.circular(15)
                        ),
                      child: Row(
                        children: [
                          Text(todoList[index][0],style: TextStyle(fontSize: 20),),
                          Container(margin: EdgeInsets.only(left: 30),),
                          Text(todoList[index][1],style: TextStyle(fontSize: 20),),
                          Container(margin: EdgeInsets.only(left: 30),),
                          Text(todoList[index][2],style: TextStyle(fontSize: 20),),
                          Container(margin: EdgeInsets.only(left: 30),),
                          Text(todoList[index][3],style: TextStyle(fontSize: 20),),
                        ],
                      )
                      ),
                ),
              ],
            ),
          );
        },
      ),
      
    );
  }
}
