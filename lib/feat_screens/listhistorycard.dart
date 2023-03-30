import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../userInfo.dart';
import 'history.dart';

//THE LIST VIEW CARD IN HISTORY
class ListViewHomeLayout extends StatefulWidget {
  const ListViewHomeLayout({super.key});

  @override
  ListViewHome createState() {
    return ListViewHome();
  }
}

class ListViewHome extends State<ListViewHomeLayout> {
  List<String> titles = [];
  final subtitles = [];
/*   List<String> titles = ["List 1", "List 2", "List 3"];
  final subtitles = [
    "Here is list 1 subtitle",
    "Here is list 2 subtitle",
    "Here is list 3 subtitle"
  ]; */
/*   final icons = [Icons.ac_unit, Icons.access_alarm, Icons.access_time]; */
  var userid = GoogleUserStaticInfo().uid;

/*   Future getHistory() async {
    QuerySnapshot qn =
        await firestore.collection("pinnedhistory").where(userid).get();
    return qn.docs;
  }
  var firestore = FirebaseFirestore.instance; */

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection("pinnedlocation")
            .where('user_id', isEqualTo: GoogleUserStaticInfo().uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('An error has occurred!'),
            );
          } else if (snapshot.hasData) {
            final datadocs = snapshot.data!.docs;

            if (datadocs.isEmpty) {
              return Scaffold(
                  backgroundColor: const Color.fromARGB(255, 241, 242, 242),
                  appBar: AppBar(
                    backgroundColor: Colors.transparent,
                    title: const Text('Pinned Locations History'),
                    foregroundColor: const Color.fromARGB(255, 44, 45, 48),
                    elevation: 0.0,
                    leading: const BackButton(
                      color: Color.fromARGB(255, 44, 45, 48),
                    ),
                  ),
                    body: Padding(
                    padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.fromLTRB(35, 20, 40, 7),
                    child: Row(
                      children: const <Widget>[
                        const ImageIcon(
                          AssetImage("assets/images/icons/historyIcon.png"),
                          color: Color.fromARGB(255, 23, 23, 23),
                          size: 23,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Expanded(
                          child: Text('Below are the recent locations pinned',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 23, 23, 23),
                                  fontSize: 18.0)),
                        )
                      ],
                    ),
                  ),
              Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(15, 7, 15, 7),
                  child: ListTile(
                    onTap: () async {
                      /*   await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HistoryDialogLayout(
                                    historyid: datadocs[index].id,
                                  ))); */
                    },
                    title: const Text("No History"),
                    subtitle: const Text(
                        'You dont have any history data, venture place first'),
                    leading: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 22),
                      child: Image.asset(
                        'assets/images/icons/pin.png',
                        height: 25,
                        width: 18.6,
                      ),
                    ),
                  ),
                  )]))));
            }

            return ListView.builder(
                itemCount: datadocs.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Card(
                      elevation: 0,
                      color: Colors.white,
                      child: ListTile(
                        onTap: () async {
                          await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HistoryDialogLayout(
                                    historyid: datadocs[index].id,
                                  )));

                          //      HistoryDialog().showHistoryDialog(context);
                        },
                        title: Text(datadocs[index]['place_name']),
                        // ignore: prefer_interpolation_to_compose_strings
                        subtitle: Text('The suggested shop to this place is ' +
                            datadocs[index]['ideal_shop'] +
                            '  with ' +
                            datadocs[index]['percentage'] +
                            ' % Feasibility '),
                        leading: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 22),
                          child: Image.asset(
                            'assets/images/icons/pin.png',
                            height: 25,
                            width: 18.6,
                          ),
                        ),
                        /*   trailing: Icon(icons[index])  */
                      ));
                });
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}