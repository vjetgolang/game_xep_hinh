import 'dart:async';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var listCard = [
    {
      "id": 1,
      "image": "https://i.imgur.com/TmgbCBI.png",
    },
    {
      "id": 1,
      "image": "https://i.imgur.com/TmgbCBI.png",
    },
    {
      "id": 2,
      "image": "https://i.imgur.com/r6USrSQ.png",
    },
    {
      "id": 2,
      "image": "https://i.imgur.com/r6USrSQ.png",
    },
    {
      "id": 3,
      "image": "https://i.imgur.com/HvAIdH7.png",
    },
    {
      "id": 3,
      "image": "https://i.imgur.com/HvAIdH7.png",
    },
    {
      "id": 4,
      "image": "https://i.imgur.com/y7kAQ0S.png",
    },
    {
      "id": 4,
      "image": "https://i.imgur.com/y7kAQ0S.png",
    },
    {
      "id": 5,
      "image": "https://i.imgur.com/idvWkJV.png",
    },
    {
      "id": 5,
      "image": "https://i.imgur.com/idvWkJV.png",
    },
    {
      "id": 6,
      "image": "https://i.imgur.com/wTyyhne.png",
    },
    {
      "id": 6,
      "image": "https://i.imgur.com/wTyyhne.png",
    },
  ]..shuffle();

  var listSelectedIndex = [];
  var listChoosenIndex = [];

  Timer? timerPlay;
  Timer? timerAlgo;
  var indexAuto = 0;
  var second = 00;
  var minute = 00;
  var listSelectedByAi = [];
  var isAlgorithRun = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Simple Game"),
      //   centerTitle: true,
      // ),
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  margin: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.yellowAccent,
                  ),
                  child: Text(
                    "$minute : $second",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 24,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    bottom: 10,
                  ),
                  child: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        childAspectRatio: 0.7,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: listCard.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return GestureDetector(
                          onTap: () {
                            if (timerPlay == null || !timerPlay!.isActive) {
                              timerPlay =
                                  Timer.periodic(Duration(seconds: 1), (timer) {
                                if (second < 59) {
                                  setState(() {
                                    second = second + 1;
                                  });
                                } else {
                                  setState(() {
                                    second = 0;
                                    minute = minute + 1;
                                  });
                                }
                              });
                            }
                            if (!listChoosenIndex.contains(index)) {
                              if (!listSelectedIndex.contains(index) &&
                                  listSelectedIndex.length < 2) {
                                setState(() {
                                  listSelectedIndex.add(index);
                                });
                              }
                              if (listSelectedIndex.length == 2) {
                                print(listCard[listSelectedIndex[0]]['id']);
                                print(listCard[listSelectedIndex[1]]['id']);
                                if (listCard[listSelectedIndex[0]]['id'] ==
                                    listCard[listSelectedIndex[1]]['id']) {
                                  setState(() {
                                    listChoosenIndex.add(listSelectedIndex[0]);
                                    listChoosenIndex.add(listSelectedIndex[1]);
                                    listSelectedIndex.clear();
                                  });
                                } else {
                                  Timer(Duration(seconds: 1), () {
                                    setState(() {
                                      listSelectedIndex.clear();
                                    });
                                  });
                                }
                              }
                              print(listSelectedIndex);
                            }
                            if (listChoosenIndex.length == 12) {
                              timerPlay!.cancel();
                            }
                          },
                          child: Stack(
                            children: [
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.green,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.network(
                                    listCard[index]["image"].toString(),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                width: listSelectedIndex.contains(index) ||
                                        listChoosenIndex.contains(index)
                                    ? 0
                                    : null,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (timerPlay == null || !timerPlay!.isActive) {
                            timerPlay =
                                Timer.periodic(Duration(seconds: 1), (timer) {
                              if (second < 59) {
                                setState(() {
                                  second = second + 1;
                                });
                              } else {
                                setState(() {
                                  second = 0;
                                  minute = minute + 1;
                                });
                              }
                            });
                          }
                        },
                        child: Text("Bắt đầu"),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(15.0),
                    //   child: ElevatedButton(
                    //     onPressed: () {
                    //       timerPlay!.cancel();
                    //     },
                    //     child: Text("Pause"),
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ElevatedButton(
                        onPressed: () {
                          reset();
                        },
                        child: Text("Chơi lại"),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (!isAlgorithRun) myAlgorithm();
                    },
                    child: Text("Chạy thuật toán"),
                  ),
                ),
              ],
            ),
          ),
          Visibility(
            visible: listChoosenIndex.length == 12,
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(
                      10,
                    ),
                    child: Text("$minute : $second"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ElevatedButton(
                      onPressed: () {
                        reset();
                      },
                      child: Text("Chơi lại"),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  reset() {
    setState(() {
      minute = 00;
      second = 00;
      indexAuto = 0;
      listSelectedIndex.clear();
      listChoosenIndex.clear();
      listSelectedByAi.clear();
      if (timerPlay != null) {
        timerPlay!.cancel();
      }
      if (timerAlgo != null) {
        timerAlgo!.cancel();
      }
    });
  }

  myAlgorithm() async {
    setState(() {
      isAlgorithRun = true;
    });
    reset();
    if (timerPlay == null || !timerPlay!.isActive) {
      timerPlay = Timer.periodic(Duration(seconds: 1), (timer) {
        if (second < 59) {
          setState(() {
            second = second + 1;
          });
        } else {
          setState(() {
            second = 0;
            minute = minute + 1;
          });
        }
      });
    }
    timerAlgo = Timer.periodic(Duration(milliseconds: 500), (timer) {
      // if (timer.tick % 2 == 0) {
      if (!listSelectedByAi.contains(listCard[indexAuto]["id"])) {
        setState(() {
          listSelectedByAi.add(listCard[indexAuto]["id"]);
        });
      } else {
        setState(() {
          listSelectedByAi.add(listCard[indexAuto]["id"]);
          listChoosenIndex.add(indexAuto);
          listChoosenIndex
              .add(listSelectedByAi.indexOf(listCard[indexAuto]["id"]));
        });
      }
      setState(() {
        listSelectedIndex.clear();
        listSelectedIndex.add(indexAuto);
        indexAuto = indexAuto + 1;
        if (indexAuto == listCard.length) {
          timerAlgo!.cancel();
        }
      });
      print(listSelectedByAi);
      if (listChoosenIndex.length == 12) {
        timerPlay!.cancel();
        setState(() {
          isAlgorithRun = false;
        });
      }
    });
  }
}
