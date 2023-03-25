import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:main_venture/feat_screens/dialogbutton.dart';

import '../userInfo.dart';

class ZoneScreen extends StatefulWidget {
  const ZoneScreen(
      {super.key,
      required this.dataID,
      required this.place,
      required this.coordinates_latitude,
      required this.coordinates_longitude,
      required this.land_size,
      required this.population,
      required this.revenue});

  final String dataID, place, land_size, population, revenue;

  final double coordinates_latitude, coordinates_longitude;

  @override
  State<ZoneScreen> createState() => _ZoneScreenState();
}

class _ZoneScreenState extends State<ZoneScreen> {
  List<DropdownData> dropdownDatas = [];
  List<DropdownDataAssumption> dropdownAssumption = [];

  Future getBusiness() async {
    await FirebaseFirestore.instance
        .collection("business")
        .get()
        .then((QuerySnapshot snapshot) => {
              snapshot.docs.forEach((documents) async {
                var data = documents.data() as Map;

                dropdownDatas.add(DropdownData(nameofbusiness: documents.id));
                dropdownAssumption.add(
                    DropdownDataAssumption(budgetassump: data['budgetassump']));
              })
            });
  }

  @override
  void initState() {
    getBusiness();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 241, 242, 242),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text('Pinned Information'),
          foregroundColor: const Color.fromARGB(255, 44, 45, 48),
          elevation: 0.0,
          leading: const BackButton(
            color: Color.fromARGB(255, 44, 45, 48),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Container(
                //   color: Colors.white,
                //   padding: const EdgeInsets.fromLTRB(20, 2, 40, 7),
                //   child: const Center(
                //     child: Text("\n\nYou have pinned this location\n",
                //         textAlign: TextAlign.center,
                //         style: TextStyle(
                //             color: Color.fromARGB(255, 28, 28, 28),
                //             fontSize: 18.0, fontWeight: FontWeight.bold)), // <-- Text
                //   ),
                // ),
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
                ),
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.fromLTRB(70, 10, 35, 5),
                  child: Row(
                    children: const <Widget>[
                      Image(
                          image: AssetImage(
                              'assets/images/icons/pinBuildingIcon.png'),
                          height: 30),
                      SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: Text('You have pinned this location',
                            style: TextStyle(
                                color: Color.fromARGB(255, 44, 45, 48),
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold)),
                      )
                    ],
                  ),
                ),
                //PLACE
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
                ),
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.fromLTRB(20, 10, 35, 5),
                  child: Row(
                    children: <Widget>[
                      const Image(
                          image:
                              AssetImage('assets/images/icons/PlaceIcon.png'),
                          height: 100),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: Text('Place: ${widget.place}',
                            style: const TextStyle(
                              color: Color.fromARGB(255, 44, 45, 48),
                              fontSize: 16.0,
                            )),
                      )
                    ],
                  ),
                ),

                //COORDINATES
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
                ),
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.fromLTRB(20, 10, 35, 5),
                  child: Row(
                    children: <Widget>[
                      const Image(
                          image: AssetImage(
                              'assets/images/icons/CoordinatesIcon.png'),
                          height: 70),
                      const SizedBox(
                        width: 17.0,
                      ),
                      Expanded(
                        child: Text(
                            'Coordinates: \nLatitude: ${widget.coordinates_latitude} \nLongitude: ${widget.coordinates_longitude}',
                            style: const TextStyle(
                              color: Color.fromARGB(255, 44, 45, 48),
                              fontSize: 16.0,
                            )),
                      )
                    ],
                  ),
                ),
                //ZONE
                /*        Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(20, 10, 35, 5),
              child: Row(
                children: const <Widget>[
                  Image(
                      image: const AssetImage('assets/images/icons/ZoneIcon.png'),
                      height: 90),
                  SizedBox(
                    width: 25.0,
                  ),
                  Expanded(
                    child: Text('Zone:',
                        style: TextStyle(
                            color: Color.fromARGB(255, 44, 45, 48),
                            fontSize: 16.0, fontWeight: FontWeight.bold)),

                  )
                ],
              ),
            ), */
                //LAND SIZE
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
                ),
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.fromLTRB(20, 10, 35, 5),
                  child: Row(
                    children: <Widget>[
                      const Image(
                          image: AssetImage(
                              'assets/images/icons/LandSizeIcon.png'),
                          height: 80),
                      const SizedBox(
                        width: 15.0,
                      ),
                      Expanded(
                        child: Text('Land Size: ${widget.land_size}',
                            style: const TextStyle(
                              color: Color.fromARGB(255, 44, 45, 48),
                              fontSize: 16.0,
                            )),
                      )
                    ],
                  ),
                ),
                //POPULATION
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
                ),
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.fromLTRB(20, 10, 35, 5),
                  child: Row(
                    children: <Widget>[
                      const Image(
                          image: AssetImage(
                              'assets/images/icons/PopulationIcon.png'),
                          height: 80),
                      const SizedBox(
                        width: 26.0,
                      ),
                      Expanded(
                        child: Text('Population:  ${widget.population}',
                            style: const TextStyle(
                              color: Color.fromARGB(255, 44, 45, 48),
                              fontSize: 16.0,
                            )),
                      )
                    ],
                  ),
                ),
                //REVENUE
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
                ),
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.fromLTRB(20, 10, 35, 5),
                  child: Row(
                    children: <Widget>[
                      const Image(
                          image:
                              AssetImage('assets/images/icons/RevenueIcon.png'),
                          height: 80),
                      const SizedBox(
                        width: 35.0,
                      ),
                      Expanded(
                        child: Text('Revenue: ${widget.revenue}',
                            style: const TextStyle(
                              color: Color.fromARGB(255, 44, 45, 48),
                              fontSize: 16.0,
                            )),
                      )
                    ],
                  ),
                ),
                // const SizedBox(
                //   height: 1.0,
                // ),
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                ),
                GestureDetector(
                  onTap: () async {
                    await DialogQuestion(
                            widget.dataID, dropdownDatas, dropdownAssumption)
                        .showMyDialog(context);
                  },
                  child: Material(
                    color: const Color.fromARGB(255, 0, 110, 195),
                    borderRadius: BorderRadius.circular(5.0),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        SizedBox(width: 10.0, height: 50),
                        Text('Venture it!\t\t',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0)),
                        // Ink.image(
                        //     image: const AssetImage(
                        //         'assets/images/icons/back.png'),
                        //     height: 40,
                        //     width: 30),
                      ],
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.fromLTRB(20, 2, 20, 20),
                ),

                //END
              ],
            ),
          ),
        ));
      backgroundColor: const Color.fromARGB(255, 241, 242, 242),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Pinned Location'),
        foregroundColor: const Color.fromARGB(255, 44, 45, 48),
        elevation: 0.0,
        leading: const BackButton(
          color: Color.fromARGB(255, 44, 45, 48),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Container(
              //   color: Colors.white,
              //   padding: const EdgeInsets.fromLTRB(20, 2, 40, 7),
              //   child: const Center(
              //     child: Text("\n\nYou have pinned this location\n",
              //         textAlign: TextAlign.center,
              //         style: TextStyle(
              //             color: Color.fromARGB(255, 28, 28, 28),
              //             fontSize: 18.0, )), // <-- Text
              //   ),
              // ),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
              ),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.fromLTRB(70, 10, 35, 5),
                child: const Row(
                  children: <Widget>[
                    Image(
                        image: AssetImage(
                            'assets/images/icons/pinBuildingIcon.png'),
                        height: 30),
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: Text('You have pinned this location',
                          style: TextStyle(
                            color: Color.fromARGB(255, 44, 45, 48),
                            fontSize: 18.0,
                          )),
                    )
                  ],
                ),
              ),
              //PLACE
              Container(
                color: Colors.white,
                padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
              ),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.fromLTRB(20, 10, 35, 5),
                child: Row(
                  children: <Widget>[
                    const Image(
                        image: AssetImage('assets/images/icons/PlaceIcon.png'),
                        height: 100),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: Text('Place: ${widget.place}',
                          style: const TextStyle(
                            color: Color.fromARGB(255, 44, 45, 48),
                            fontSize: 16.0,
                          )),
                    )
                  ],
                ),
              ),

              //COORDINATES
              Container(
                color: Colors.white,
                padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
              ),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.fromLTRB(20, 10, 35, 5),
                child: Row(
                  children: <Widget>[
                    const Image(
                        image: AssetImage(
                            'assets/images/icons/CoordinatesIcon.png'),
                        height: 70),
                    const SizedBox(
                      width: 17.0,
                    ),
                    Expanded(
                      child: Text(
                          'Coordinates: \nLatitude: ${widget.coordinates_latitude} \nLongitude: ${widget.coordinates_longitude}',
                          style: const TextStyle(
                            color: Color.fromARGB(255, 44, 45, 48),
                            fontSize: 16.0,
                          )),
                    )
                  ],
                ),
              ),
              /*   //ZONE
              Container(
                color: Colors.white,
                padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
              ),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.fromLTRB(20, 10, 35, 5),
                child: Row(
                  children: const <Widget>[
                    Image(
                        image: const AssetImage(
                            'assets/images/icons/ZoneIcon.png'),
                        height: 90),
                    SizedBox(
                      width: 25.0,
                    ),
                    Expanded(
                      child: Text('Zone:',
                          style: TextStyle(
                            color: Color.fromARGB(255, 44, 45, 48),
                            fontSize: 16.0,
                          )),
                    )
                  ],
                ),
              ), */
              //LAND SIZE
              Container(
                color: Colors.white,
                padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
              ),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.fromLTRB(20, 10, 35, 5),
                child: Row(
                  children: <Widget>[
                    const Image(
                        image:
                            AssetImage('assets/images/icons/LandSizeIcon.png'),
                        height: 80),
                    const SizedBox(
                      width: 15.0,
                    ),
                    Expanded(
                      child: Text('Land Size: ${widget.land_size}',
                          style: const TextStyle(
                            color: Color.fromARGB(255, 44, 45, 48),
                            fontSize: 16.0,
                          )),
                    )
                  ],
                ),
              ),
              //POPULATION
              Container(
                color: Colors.white,
                padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
              ),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.fromLTRB(20, 10, 35, 5),
                child: Row(
                  children: <Widget>[
                    const Image(
                        image: AssetImage(
                            'assets/images/icons/PopulationIcon.png'),
                        height: 80),
                    const SizedBox(
                      width: 26.0,
                    ),
                    Expanded(
                      child: Text('Population: ${widget.population}',
                          style: const TextStyle(
                            color: Color.fromARGB(255, 44, 45, 48),
                            fontSize: 16.0,
                          )),
                    )
                  ],
                ),
              ),
              //REVENUE
              Container(
                color: Colors.white,
                padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
              ),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.fromLTRB(20, 10, 35, 5),
                child: Row(
                  children: <Widget>[
                    const Image(
                        image:
                            AssetImage('assets/images/icons/RevenueIcon.png'),
                        height: 80),
                    const SizedBox(
                      width: 35.0,
                    ),
                    Expanded(
                      child: Text('Revenue: ${widget.revenue}',
                          style: const TextStyle(
                            color: Color.fromARGB(255, 44, 45, 48),
                            fontSize: 16.0,
                          )),
                    )
                  ],
                ),
              ),
              // const SizedBox(
              //   height: 1.0,
              // ),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
              ),
              GestureDetector(
                onTap: () async {
                  await DialogQuestion(
                          widget.dataID, dropdownDatas, dropdownAssumption)
                      .showMyDialog(context);
                },
                child: Material(
                  color: const Color.fromARGB(255, 0, 110, 195),
                  borderRadius: BorderRadius.circular(5.0),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 10.0, height: 50),
                      Text('Venture it!\t\t',
                          style:
                              TextStyle(color: Colors.white, fontSize: 20.0)),
                      // Ink.image(
                      //     image: const AssetImage(
                      //         'assets/images/icons/back.png'),
                      //     height: 40,
                      //     width: 30),
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.fromLTRB(20, 2, 20, 20),
              ),

              //END
            ],
          ),
        ),
      ),
    );
  }
}

 /* class ContentHowToUse extends StatelessWidget {
  const ContentHowToUse({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return 
  }
} */