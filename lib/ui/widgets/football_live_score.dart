import 'package:flutter/material.dart';

import '../../entities/football.dart';

class FootballLivescore extends StatelessWidget {
  const FootballLivescore({
    super.key, required this.football,
  });
  final Football football;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:[
            _buildTeam(football.team1Name, football.team1),
            Text('vs'),
            _buildTeam(football.team2Name, football.team2),
          ],
        ),
      ),
    );
  }

  Widget _buildTeam(String team, int score){
    return Column(
      children: [
        Text(score.toString(), style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600
        ),),
        Text(team, style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500
        ),),
      ],
    );
  }
}