import 'dart:io';

import 'package:core_exam/modal/student.dart';
import 'package:core_exam/utils/color.dart';
import 'package:core_exam/utils/global.dart';
import 'package:core_exam/utils/textStyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class detailPage extends StatefulWidget {
  const detailPage({super.key});

  @override
  State<detailPage> createState() => _detailPageState();
}

class _detailPageState extends State<detailPage> {
  ImagePicker imagePicker = ImagePicker();
  XFile? xFile;
  String? pickImagePath;
  GlobalKey<FormState> declarationKey = GlobalKey<FormState>();
  TextEditingController gridController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  bool on = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Data"),
      ),
      backgroundColor: Colors.grey.shade300,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 5),
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Column(
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height / 1.3,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 230, top: 25),
                                            child: Text(
                                              "Students Data",
                                              style: TextStyling.heading,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Container(
                                            height: 200,
                                            margin: EdgeInsets.only(
                                                left: 25, right: 25),
                                            color: Colors.white,
                                            alignment: Alignment.center,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    showDialog(
                                                        context: context,
                                                        builder: (context) {
                                                          return AlertDialog(
                                                            title: Text(
                                                              "Pick Image",
                                                            ),
                                                            content: Text(
                                                              "Choose Image From Gallery or Camera",
                                                            ),
                                                            actions: [
                                                              FloatingActionButton(
                                                                mini: true,
                                                                onPressed:
                                                                    () async {
                                                                  xFile = await imagePicker
                                                                      .pickImage(
                                                                    source: ImageSource
                                                                        .camera,
                                                                  );
                                                                  setState(() {
                                                                    if (xFile !=
                                                                        null) {
                                                                      pickImagePath =
                                                                          xFile!
                                                                              .path;
                                                                    }
                                                                  });

                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                                elevation: 3,
                                                                child: Icon(
                                                                  Icons
                                                                      .camera_alt,
                                                                ),
                                                              ),
                                                              FloatingActionButton(
                                                                mini: true,
                                                                onPressed:
                                                                    () async {
                                                                  xFile = await imagePicker
                                                                      .pickImage(
                                                                    source: ImageSource
                                                                        .gallery,
                                                                  );
                                                                  setState(() {
                                                                    if (xFile !=
                                                                        null) {
                                                                      pickImagePath =
                                                                          xFile!
                                                                              .path;
                                                                    }
                                                                  });

                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                                elevation: 3,
                                                                child: Icon(
                                                                  Icons.image,
                                                                ),
                                                              ),
                                                            ],
                                                          );
                                                        });
                                                  },
                                                  child: CircleAvatar(
                                                    radius: 70,
                                                    backgroundColor:
                                                        primaryBlueColor
                                                            .withOpacity(0.7),
                                                    backgroundImage:
                                                        (pickImagePath != null)
                                                            ? FileImage(File(
                                                                pickImagePath!))
                                                            : null,
                                                    child: (pickImagePath !=
                                                            null)
                                                        ? Container()
                                                        : Icon(
                                                            Icons.add,
                                                            color: primaryWhite,
                                                            size: 30,
                                                          ),
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    OutlinedButton(
                                                      onPressed: () {},
                                                      style: OutlinedButton
                                                          .styleFrom(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 50,
                                                                vertical: 14),
                                                        foregroundColor:
                                                            primaryBlueColor,
                                                      ),
                                                      child: Text("Clear"),
                                                    ),
                                                    ElevatedButton(
                                                      onPressed: () {
                                                        if (pickImagePath !=
                                                            null) {
                                                          Global.profileImageFile =
                                                              File(
                                                                  pickImagePath!);
                                                        }
                                                      },
                                                      style: OutlinedButton
                                                          .styleFrom(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 50,
                                                                vertical: 14),
                                                        foregroundColor:
                                                            primaryWhite,
                                                        backgroundColor:
                                                            primaryBlueColor,
                                                      ),
                                                      child: Text("Save"),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 40,
                                          ),
                                        ],
                                      ),
                                      Form(
                                        key: declarationKey,
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20, right: 20, top: 30),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: TextFormField(
                                                      validator: (val) {
                                                        if (val!.isEmpty) {
                                                          return "Enter Description";
                                                        }
                                                        return null;
                                                      },
                                                      onSaved: (val) {
                                                        Global.grid = val ?? "";
                                                      },
                                                      controller:
                                                          gridController,
                                                      decoration:
                                                          InputDecoration(
                                                        border:
                                                            OutlineInputBorder(),
                                                        hintText:
                                                            "Student GRID",
                                                        hintStyle: TextStyle(
                                                            color:
                                                                secondaryGrey,
                                                            fontSize: 20),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20, right: 20, top: 30),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: TextFormField(
                                                      validator: (val) {
                                                        if (val!.isEmpty) {
                                                          return "Enter Description";
                                                        }
                                                        return null;
                                                      },
                                                      onSaved: (val) {
                                                        Global.name = val ?? "";
                                                      },
                                                      controller:
                                                          nameController,
                                                      decoration:
                                                          InputDecoration(
                                                        border:
                                                            OutlineInputBorder(),
                                                        hintText:
                                                            "Student Name",
                                                        hintStyle: TextStyle(
                                                            color:
                                                                secondaryGrey,
                                                            fontSize: 20),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20, right: 20, top: 10),
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 20),
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            //height: 55,
                                                            width: 100,
                                                            child:
                                                                TextFormField(
                                                              validator: (val) {
                                                                if (val!
                                                                    .isEmpty) {
                                                                  return "Enter Date";
                                                                }
                                                                return null;
                                                              },
                                                              onSaved: (val) {
                                                                Global.age =
                                                                    val ?? "";
                                                              },
                                                              controller:
                                                                  ageController,
                                                              decoration: InputDecoration(
                                                                  border:
                                                                      OutlineInputBorder(),
                                                                  hintText:
                                                                      "Student Age",
                                                                  hintStyle: TextStyle(
                                                                      fontSize:
                                                                          20,
                                                                      height: 1,
                                                                      color:
                                                                          secondaryGrey)),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 30),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        OutlinedButton(
                                                          onPressed: () {
                                                            if (declarationKey
                                                                .currentState!
                                                                .validate()) {
                                                              declarationKey
                                                                  .currentState!
                                                                  .reset();

                                                              gridController
                                                                  .clear();
                                                              nameController
                                                                  .clear();
                                                              ageController
                                                                  .clear();
                                                            }
                                                          },
                                                          style: OutlinedButton
                                                              .styleFrom(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        40,
                                                                    vertical:
                                                                        15),
                                                            foregroundColor:
                                                                primaryBlueColor,
                                                          ),
                                                          child: Text(
                                                            "Clear",
                                                            style: TextStyle(
                                                                fontSize: 17),
                                                          ),
                                                        ),
                                                        ElevatedButton(
                                                          onPressed: () {
                                                            if (declarationKey
                                                                .currentState!
                                                                .validate()) {
                                                              declarationKey
                                                                  .currentState!
                                                                  .save();

                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  behavior:
                                                                      SnackBarBehavior
                                                                          .floating,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .green
                                                                          .shade500,
                                                                  action:
                                                                      SnackBarAction(
                                                                    label:
                                                                        "Next",
                                                                    onPressed:
                                                                        () {
                                                                      setState(
                                                                          () {
                                                                        Navigator.of(context).pushNamedAndRemoveUntil(
                                                                            "/",
                                                                            (route) =>
                                                                                false);
                                                                      });
                                                                    },
                                                                    textColor:
                                                                        primaryWhite,
                                                                  ),
                                                                  content: Text(
                                                                    "Student Data Saved SuccessFully!!!",
                                                                  ),
                                                                ),
                                                              );

                                                              gridController
                                                                  .clear();
                                                              nameController
                                                                  .clear();
                                                              ageController
                                                                  .clear();
                                                              Student student = Student(
                                                                  grid: Global
                                                                      .grid,
                                                                  age: Global
                                                                      .age,
                                                                  name: Global
                                                                      .name,
                                                                  profileImageFile:
                                                                      Global
                                                                          .profileImageFile,
                                                                  StudentName:
                                                                      Global
                                                                          .StudentName);
                                                            }
                                                          },
                                                          style: OutlinedButton
                                                              .styleFrom(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        40,
                                                                    vertical:
                                                                        15),
                                                            foregroundColor:
                                                                primaryWhite,
                                                            backgroundColor:
                                                                primaryBlueColor,
                                                          ),
                                                          child: Text(
                                                            "Save",
                                                            style: TextStyle(
                                                                fontSize: 17),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
