import 'package:bmicalculator/constants.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int height = 150;
  int weight = 80;
  late double bmi = calculateBMI(height: height, weight: weight);
  String gender = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          color: Colors.white38,
          child: Column(children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    print("Male");
                    setState(() {
                      gender = 'M';
                    });
                  },
                  child: Container(
                    height: 200,
                    width: 175,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: gender == 'M'
                            ? Colors.orange.withAlpha(150)
                            : Colors.orange.withAlpha(50)),
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: const [
                        Icon(
                          Icons.male,
                          size: 150,
                        ),
                        Text("Male"),
                      ],
                    ),
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    print("Female");
                    setState(() {
                      gender = 'F';
                    });
                  },
                  child: Container(
                    height: 200,
                    width: 175,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: gender == 'F'
                            ? Colors.orange.withAlpha(150)
                            : Colors.orange.withAlpha(50)),
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: const [
                        Icon(
                          Icons.female,
                          size: 150,
                        ),
                        Text("Female"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text("Height"),
                      Text(
                        "$height",
                        style: kInputLabelColor,
                      ),
                      Row(
                        children: [
                          FloatingActionButton(
                            onPressed: (() {
                              setState(() {
                                height > 50 ? height-- : null;
                                bmi = calculateBMI(
                                    height: height, weight: weight);
                              });
                            }),
                            child: Icon(
                              Icons.remove,
                              size: 40,
                            ),
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          FloatingActionButton(
                            onPressed: (() {
                              setState(() {
                                height < 220 ? height++ : null;
                                bmi = calculateBMI(
                                    height: height, weight: weight);
                              });
                            }),
                            child: Icon(
                              Icons.add,
                              size: 40,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text("Weight"),
                      Text("$weight", style: kInputLabelColor),
                      Row(
                        children: [
                          FloatingActionButton(
                            onPressed: (() {
                              setState(() {
                                weight > 20 ? weight-- : null;
                                bmi = calculateBMI(
                                    height: height, weight: weight);
                              });
                            }),
                            child: Icon(
                              Icons.remove,
                              size: 40,
                            ),
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          FloatingActionButton(
                            onPressed: (() {
                              setState(() {
                                weight < 300 ? weight++ : null;
                                bmi = calculateBMI(
                                    height: height, weight: weight);
                              });
                            }),
                            child: Icon(
                              Icons.add,
                              size: 40,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Column(
              children: [
                Text("BMI"),
                Text(
                  "${bmi.toStringAsFixed(2)}",
                  style: kInputLabelColor.copyWith(
                      color: kOutputTextColor, fontSize: 60),
                ),
                Text(getResult(bmi))
              ],
            )
          ]),
        ),
      ),
    );
  }

  double calculateBMI({required int height, required int weight}) {
    return (weight / (height * height)) * 10000;
  }

  static String getResult(bmiValue) {
    if (bmiValue >= 25) {
      return "Overweight";
    } else if (bmiValue <= 18.5) {
      return "Underweight";
    } else {
      return "Healthy";
    }
  }
}
