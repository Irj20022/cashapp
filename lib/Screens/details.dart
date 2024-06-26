import 'package:flutter/material.dart';

import 'package:cashapp/components/BottomMainNavigationBar.dart';
import 'package:cashapp/components/PrimaryTextComponent.dart';
import 'package:cashapp/components/CustomizedAppBar.dart';
import 'package:cashapp/components/PrimaryContainer.dart';
import 'package:cashapp/components/SecondaryContainer.dart';

import 'package:cashapp/backend/database_helper.dart';
import 'package:cashapp/Screens/addDetails.dart';
import 'package:cashapp/service/budget_service.dart';
import 'package:cashapp/model/budget.dart';

class DetailsScreen extends StatefulWidget {
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int weeklyBudget = 0;
  int totalIncome = 0;
  int totalExpense = 0;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    weeklyBudget = await DatabaseHelper.instance.fetchWeeklyBudget();
    totalIncome = await DatabaseHelper.instance.fetchTotalIncomeForWeek();
    totalExpense = await DatabaseHelper.instance.fetchTotalExpenseForWeek();
    setState(() {}); // Update the UI
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomMainNavigationBar(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120.0),
        child: CustomizedAppBar(headingText: "Budget"),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(
                  right: 25.0,
                  left: 25.0,
                  bottom: 25.0,
                ),
                child: Column(
                  children: [

                    Row(
                      children: [
                        PrimaryTextComponent(
                          textStatement: "Rs",
                          fontSize: 24.0,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        PrimaryTextComponent(
                          textStatement: '$weeklyBudget',
                          fontFamily: "PoetsenOne",
                          fontSize: 64.0,
                          fontWeight: FontWeight.w400,
                        )
                      ],
                    ),
                    PrimaryTextComponent(
                      textStatement: "Available total balance",
                      fontColor: Color(0xff6A6A6A),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    PrimaryContainer(
                      componentWidgets: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              PrimaryTextComponent(textStatement: "Income"),
                              PrimaryTextComponent(textStatement: "Monday"),
                            ],
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              PrimaryTextComponent(
                                  textStatement: "Rs",
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.w600),
                              SizedBox(
                                width: 5.0,
                              ),
                              PrimaryTextComponent(
                                textStatement: "2,500",
                                fontSize: 40.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    SecondaryContainer(
                      componentWidgets: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              PrimaryTextComponent(textStatement: "Expences"),
                              PrimaryTextComponent(textStatement: "Monday"),
                            ],
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              PrimaryTextComponent(
                                textStatement: "Rs",
                                fontSize: 24.0,
                                fontWeight: FontWeight.w600,
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              PrimaryTextComponent(
                                textStatement: "1,500",
                                fontWeight: FontWeight.w600,
                                fontSize: 40.0,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    PrimaryTextComponent(
                        textStatement: "The budget you set for this week is,"),
                    SizedBox(
                      height: .0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        PrimaryTextComponent(
                            textStatement: "Rs",
                            fontWeight: FontWeight.w600,
                            fontSize: 24.0),
                        SizedBox(
                          width: 5.0,
                        ),
                        PrimaryTextComponent(
                          textStatement: "1,500",
                          fontSize: 32.0,
                          fontFamily: "PoetsenOne",
                          fontWeight: FontWeight.w400,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          colors: <Color>[
                            Color(0xff92D899),
                            Color(0xffFFEDBF),
                          ],
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text.rich(
                          TextSpan(
                            children: <InlineSpan>[
                              TextSpan(
                                text: 'Congrants! you are ',
                                style: TextStyle(
                                    color: Color(0xff000000),
                                    fontSize: 15.0,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400),
                              ),
                              TextSpan(
                                  text: " in ",
                                  style: TextStyle(
                                      color: Color(0xffAA7A00),
                                      fontSize: 15.0,
                                      fontFamily: 'Poppins-Bold',
                                      fontWeight: FontWeight.w700)),
                              TextSpan(
                                text: 'your Budget!',
                                style: TextStyle(
                                    color: Color(0xff000000),
                                    fontSize: 15.0,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
