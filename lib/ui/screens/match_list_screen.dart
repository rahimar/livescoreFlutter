import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:live_score/entities/football.dart';

import '../widgets/football_live_score.dart';

class MatchListScreen extends StatefulWidget {
  const MatchListScreen({super.key});

  @override
  State<MatchListScreen> createState() => _MatchListScreenState();
}

class _MatchListScreenState extends State<MatchListScreen> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  List<Football> matchlist = [];

  Future<void> _getFootballMatches() async {
    matchlist.clear();
    final QuerySnapshot result = await firebaseFirestore.collection('football').get();

    for(QueryDocumentSnapshot doc in result.docs){
      matchlist.add(Football(
          matchName: doc.id,
          team1Name: doc.get('team1Name'),
          team2Name: doc.get('team2Name'),
          team1: doc.get('team1'),
          team2: doc.get('team2'),
      ),);
    }

    setState(() {

    });

  }

  @override
  void initState() {
    super.initState();
    _getFootballMatches();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Football'),
        backgroundColor: Colors.purple,
      ),
      body: StreamBuilder(
        stream: firebaseFirestore.collection('football').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {

          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if(snapshot.hasError){
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          if(snapshot.hasData == false){
            return const Center(
              child: Text('Empty List'),
            );
          }

          matchlist.clear();
          for(QueryDocumentSnapshot doc in snapshot.data?.docs ?? []){
            matchlist.add(Football(
              matchName: doc.id,
              team1Name: doc.get('team1Name'),
              team2Name: doc.get('team2Name'),
              team1: doc.get('team1'),
              team2: doc.get('team2'),
            ),);
          }

          return ListView.builder(
              itemCount: matchlist.length,
              itemBuilder: (context, index){
                return FootballLivescore(football: matchlist[index],);
              }

          );
        }
      ),
    );
  }
}


