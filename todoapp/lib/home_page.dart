import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoapp/add_task.dart';
import 'package:todoapp/login_page.dart';
import 'package:flutter/services.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'database.dart';
import 'add_task.dart';
import 'first_page.dart';
import 'monthly_page.dart';
import 'todo_tile.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class homePage extends StatelessWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: home(),
    );
  }
}

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
            statusBarColor: Colors.transparent
          //color set to transperent or set your own color
        )
    );
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child:
              Text("WORK LIST", style: GoogleFonts.fredoka(fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
            ),

            // ------------------------------tab bar ------------------------------------------
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(90),
              child: TabBar(
                indicatorColor: Colors.black,
                unselectedLabelColor: Colors.grey.shade400,
                tabs: [
                  Tab(
                    icon: Icon(Icons.today, color: Color(0xff283048)),
                    child: Text(
                      "Today",
                      style: GoogleFonts.fredoka(color: Colors.black),
                    ),
                  ),
                  Tab(
                      icon: Icon(Icons.date_range, color: Color(0xff283048),),
                      child: Text(
                        "Monthly",
                        style: GoogleFonts.fredoka(color: Colors.black),
                      )),
                ],
              ),
            ),

            // --------------------------------Icons of app bar-------------------------------------
            leading: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: BackButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                color: Colors.black
                ,
              ),
            ),
            actions: [Padding(
              padding: const EdgeInsets.only(top: 12.0, right: 7),
              child: IconButton(onPressed: () {},
                icon: Icon(
                  Icons.account_circle, color: Colors.black, size: 30,),),
            )
            ],

          ),
          body: TabBarView(
            children: [Today(), Monthly()],
          ),
        ),
      ),
    );
  }
}

class Today extends StatefulWidget {
  const Today({Key? key}) : super(key: key);

  @override
  State<Today> createState() => _TodayState();
}

class _TodayState extends State<Today> {
  //-------------------------------------------FUnctions----------------------------------------
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  DateTime today = DateTime.now();

  final _myBox = Hive.box('mybox');
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    // if this is the first time opening the app, then create the default data
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  //text controller
  final _controller = TextEditingController();

//check box changed
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateData();
  }

  //save new task
  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateData();
  }

  //creating new task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return AddTask(
          controller: _controller,
          onSave: saveNewTask,
          //this dismiss the dialogue box
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  //delete task
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateData();
  }

  //---------------------------------------------body-------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: db.toDoList.length,
          itemBuilder: (context, index) {
            return ToDoList(
              taskName: db.toDoList[index][0],
              taskCompleted: db.toDoList[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
              deleteFunc: (context) => deleteTask(index),
            );
          }),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(10),
        child: GNav(
          // backgroundColor: Color(0xff283048),
          gap: 12,
          tabBackgroundColor: Color(0xff283048),
          tabs: [
            GButton(
              icon: Icons.home,
              text: "Back to Home Page",
              textColor: Colors.white,
              iconActiveColor: Colors.white,
              iconColor: Colors.grey.shade500,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FirstPage()));
              },
            ),
            GButton(
              icon: Icons.add,
              text: "Add Task",
              textColor: Colors.white,
              iconActiveColor: Colors.white,
              iconColor: Colors.grey.shade500,
              onPressed: createNewTask,
            ),
            GButton(
                icon: Icons.info,
                text: "Information",
                textColor: Colors.white,
                iconActiveColor: Colors.white,
                iconColor: Colors.grey.shade500, ),
          ],
        ),
      ),
    );
  }
}
