import 'package:flutter/material.dart';
import 'package:todo_app/res/constant/app_colors.dart';
import 'package:todo_app/res/constant/app_string.dart';

class AddToDoScreen extends StatefulWidget {
  const AddToDoScreen({super.key});

  @override
  State<AddToDoScreen> createState() => _AddToDoScreenState();
}

class _AddToDoScreenState extends State<AddToDoScreen> {
  TimeOfDay _time = TimeOfDay(hour: 7, minute: 15);

  void _selectTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (newTime != null) {
      setState(() {
        _time = newTime;
      });
    }
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
          title: const Text(AppStrings.todoTitle,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
              )),
          elevation: 0,
          backgroundColor: AppColors.pink,
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      // enabledBorder: enabledBorder,
                      contentPadding: const EdgeInsets.all(20),
                      isDense: true,
                      hintText: AppStrings.title,
                      hintStyle: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      // filled: true,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(10),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight / 40),
                  OutlinedButton(
                    style: ButtonStyle(
                      fixedSize: MaterialStatePropertyAll(
                        Size(screenWidth, screenHeight / 14),
                      ),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                    ),
                    onPressed: _selectTime,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                        'Selected time: ${_time.format(context)}',
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight / 40),
                  TextField(
                    decoration: InputDecoration(
                      // enabledBorder: enabledBorder,
                      contentPadding: const EdgeInsets.all(60),
                      isDense: true,
                      hintText: "contain",
                      hintStyle: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      // filled: true,
                    ),
                  ),
                  SizedBox(height: screenHeight / 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                          style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                              AppColors.pink,
                            ),
                            fixedSize: MaterialStatePropertyAll(
                              Size(80, 50),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text(
                            "Add",
                            style: TextStyle(
                              fontSize: 20,
                              // color: AppColors.,
                            ),
                          )),
                      SizedBox(width: screenWidth / 30),
                      OutlinedButton(
                        style: ButtonStyle(
                          fixedSize: MaterialStatePropertyAll(
                            Size(90, 50),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "delete",
                          style: TextStyle(
                            fontSize: 20,
                            color: AppColors.pink,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
