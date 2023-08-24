import 'package:flutter/material.dart';
import 'package:todo_app/res/constant/app_colors.dart';

import '../../res/constant/app_string.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
          title: const Text(AppStrings.appTitle,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
              )),
          elevation: 0,
          backgroundColor: AppColors.pink,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: screenWidth,
                height: screenHeight / 3.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.pink.withOpacity(0.10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppStrings.title,
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            AppStrings.contain,
                            style: TextStyle(
                              color: AppColors.pink,
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            AppStrings.time,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Align(
                        alignment: Alignment.topRight,
                        child: PopupMenuButton(
                          elevation: 0,
                          iconSize: 35,
                          padding: const EdgeInsets.only(right: 10),
                          itemBuilder: (context) => [
                            CheckedPopupMenuItem(
                              // checked: true,
                              child: Container(
                                height: 60,
                                child: const Column(
                                  children: [
                                    Text("delete",
                                        style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w500,
                                        )),
                                    Text(
                                      "Edit",
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
