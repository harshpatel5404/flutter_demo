import 'package:flutter/material.dart';
import 'package:flutter_demo/Services/event_services.dart';

import '../Models/samplemodel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  late Color statusColor;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo App"),
        centerTitle: true,
      ),
      body: FutureBuilder<List<TrainingEventModel>>(
        future: readJsonData(),
        builder: (BuildContext context,
            AsyncSnapshot<List<TrainingEventModel>> snapshot) {
          if (snapshot.data != null &&
              snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5.0, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(snapshot.data![index].day),
                          Text(snapshot.data![index].date.toString()),
                        ],
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data![index].events.length,
                      itemBuilder: (BuildContext context, int i) {
                        if (snapshot.data![index].events[i].status == "High") {
                          statusColor = Colors.red;
                        } else if (snapshot.data![index].events[i].status ==
                            "Low") {
                          statusColor = Colors.blue;
                        } else {
                          statusColor = Colors.yellow;
                        }

                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text("ID :  "),
                                    Text(snapshot.data![index].events[i].id
                                        .toString()),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("Status :  "),
                                    Text(
                                      snapshot.data![index].events[i].status,
                                      style: TextStyle(color: statusColor),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("tmName :  "),
                                    Text(snapshot
                                        .data![index].events[i].te.tmName),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                );
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
