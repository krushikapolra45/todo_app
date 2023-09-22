import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/res/constant/app_colors.dart';
import 'package:todo_app/res/constant/constant.dart';

import '../../model/to_do_model_view.dart';
import '../../res/constant/app_string.dart';
import 'add_todo_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SharedPreferences? prefs;

  setInstance() async {
    prefs = await SharedPreferences.getInstance();
    getToDOData();
  }

  getToDOData() async {
    Constant.todoList = (json.decode(prefs!.getString("ToDoList")!) as List).map((value) => ToDoModelAddList.fromJson(value)).toList();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    setInstance();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    double screenWidth = size.width;
    EdgeInsets devicePadding = MediaQuery.of(context).viewPadding;
    return Padding(
      padding: devicePadding,
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.appTitle,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
              )),
          elevation: 0,
          backgroundColor: AppColors.pink,
        ),
        body: Constant.todoList.isEmpty
            ? const Center(
                child: Text(
                  "No To-Do Found",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            : ListView.separated(
                itemCount: Constant.todoList.length,
                separatorBuilder: (context, index) => SizedBox(),
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: screenWidth,
                    height: screenHeight / 7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.pink.withOpacity(0.10),
                          blurRadius: 2,
                          // spreadRadius: 0,
                          offset: Offset(0, 6),
                        ),
                      ],
                      color: AppColors.pink.withOpacity(0.10),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Title: ${Constant.todoList[index].title}",
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "content: ${Constant.todoList[index].content}",
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                // toDoModelListData[index].itemname!,
                                "time: ${Constant.todoList[index].time}",
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Align(
                            alignment: Alignment.topRight,
                            child: Column(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      Constant.todoList.removeAt(index);
                                      // prefs!.setString("ToDoList", json.encode(Constant.todoList.map((value) => value.toJson()).toList()));
                                    });
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    color: AppColors.pink,
                                    size: 20,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => AddToDoScreen(index: index),
                                      ),
                                    ).then((value) {
                                      setState(() {});
                                    });
                                  },
                                  icon: Icon(
                                    Icons.change_circle,
                                    color: AppColors.pink,
                                    size: 20,
                                  ),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
              ),
        floatingActionButton: FloatingActionButton.extended(
          elevation: 0,
          focusColor: AppColors.white,
          backgroundColor: AppColors.pink,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddToDoScreen(),
              ),
            ).then((value) {
              setState(() {});
            });
          },
          icon: const Icon(Icons.add),
          label: const Text("Add", style: TextStyle(fontSize: 20)),
        ),
      ),
    );
  }
}
