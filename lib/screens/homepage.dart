import 'package:core_exam/utils/color.dart';
import 'package:core_exam/utils/custom.dart';
import 'package:core_exam/utils/global.dart';
import 'package:core_exam/utils/textStyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  bool isClick = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomWidget.getAppBar(
              context: context,
              title: "Student Data",
            ),
            SizedBox(
              height: 50,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://cdn1.byjus.com/wp-content/uploads/2018/11/cbse/2016/12/15112112/Student-App.png",
                        ),
                        fit: BoxFit.cover,
                      ),
                      color: primaryBlueColor,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isClick = true;
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 73,
                          width: MediaQuery.of(context).size.width / 2.28,
                          child: Text(
                            "My Data",
                            style: TextStyle(
                              color: (isClick == true)
                                  ? primaryWhite
                                  : primaryBlueColor,
                              fontSize: 25,
                            ),
                          ),
                          decoration: BoxDecoration(
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 8,
                                  spreadRadius: 2,
                                  offset: Offset(3, 3))
                            ],
                            borderRadius: BorderRadius.circular(25),
                            color: (isClick == true)
                                ? primaryBlueColor
                                : primaryWhite,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed('detailPage');
                        },
                        child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(left: 15),
                          height: 73,
                          width: MediaQuery.of(context).size.width / 2.28,
                          child: Text(
                            "Creat New",
                            style: TextStyle(
                              color: (isClick == false)
                                  ? primaryWhite
                                  : primaryBlueColor,
                              fontSize: 25,
                            ),
                          ),
                          decoration: BoxDecoration(
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 6,
                                  spreadRadius: 2,
                                  offset: Offset(3, 3))
                            ],
                            borderRadius: BorderRadius.circular(25),
                            color: (isClick == false)
                                ? primaryBlueColor
                                : primaryWhite,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                (isClick == true)
                    ? (Global.allStudent.isNotEmpty)
                        ? Column(
                            children: [
                              SizedBox(
                                height: 100,
                              ),
                              Text(
                                "No Data Available",
                                style: TextStyling.secondaryLabels,
                              ),
                            ],
                          )
                        : Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Column(
                              children: [
                                ...Global.allStudent.map(
                                  (e) => GestureDetector(
                                    onTap: () {
                                      Global.selectedStudent = e;
                                      Navigator.of(context)
                                          .pushNamed('pdf_viewer');
                                    },
                                    child: Stack(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 20, left: 20, right: 20),
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.of(context)
                                                  .pushNamed('detailPage');
                                            },
                                            child: Container(
                                                height: 120,
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    gradient: LinearGradient(
                                                        begin: Alignment
                                                            .centerLeft,
                                                        end: Alignment
                                                            .centerRight,
                                                        colors: [
                                                          primaryBlueColor
                                                              .withOpacity(
                                                                  0.18),
                                                          primaryBlueColor
                                                        ])),
                                                padding: EdgeInsets.only(
                                                  right: 18,
                                                ),
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        child: CircleAvatar(
                                                          radius: 50,
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 2,
                                                      child: Container(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  top: 30,
                                                                  left: 30),
                                                          child: Column(
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  Text(
                                                                    "Name",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            22,
                                                                        color:
                                                                            primaryWhite),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Text(
                                                                    "Std",
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          22,
                                                                      color:
                                                                          primaryWhite,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                        child: Container(
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          GestureDetector(
                                                            onTap: () {},
                                                            child: Icon(
                                                              Icons.delete,
                                                              size: 30,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          GestureDetector(
                                                            onTap: () {
                                                              setState(() {
                                                                isClick = false;

                                                                showDialog(
                                                                    context:
                                                                        context,
                                                                    barrierDismissible:
                                                                        false,
                                                                    builder:
                                                                        (context) {
                                                                      return AlertDialog(
                                                                        title: Text(
                                                                            "Student Data"),
                                                                        content:
                                                                            Expanded(
                                                                          child:
                                                                              TextField(
                                                                            onChanged:
                                                                                (val) {
                                                                              Global.StudentName = val;
                                                                            },
                                                                            decoration:
                                                                                InputDecoration(
                                                                              hintText: "Enter Student Name",
                                                                              border: OutlineInputBorder(),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        actions: [
                                                                          FloatingActionButton(
                                                                            onPressed:
                                                                                () {
                                                                              Navigator.of(context).pop('homepage');
                                                                            },
                                                                            child:
                                                                                Icon(Icons.close),
                                                                            mini:
                                                                                true,
                                                                            elevation:
                                                                                3,
                                                                          ),
                                                                          FloatingActionButton(
                                                                            onPressed:
                                                                                () {
                                                                              // Navigator.of(context).pushNamed('resume_workspace');
                                                                            },
                                                                            child:
                                                                                Icon(Icons.done),
                                                                            mini:
                                                                                true,
                                                                            elevation:
                                                                                3,
                                                                          ),
                                                                        ],
                                                                      );
                                                                    });
                                                              });
                                                            },
                                                            child: Icon(
                                                              Icons.edit,
                                                              size: 30,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ))
                                                  ],
                                                )),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                    : Container(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
