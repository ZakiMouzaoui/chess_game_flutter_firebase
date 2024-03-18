import 'package:cached_network_image/cached_network_image.dart';
import 'package:chess_game/controllers/game_controller.dart';
import 'package:chess_game/controllers/game_setup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlayerTile extends StatelessWidget {
  const PlayerTile(
      {super.key, this.rating, required this.name, required this.image, required this.timer});

  final int? rating;
  final String name;
  final String image;
  final int timer;

  @override
  Widget build(BuildContext context) {
    final minutes = timer ~/ 60;
    final seconds = timer % 60;
    final remainingTime = '$minutes:${seconds.toString().padLeft(2, '0')}';

    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.blueGrey,
        backgroundImage: CachedNetworkImageProvider(image),
        radius: 30,
      ),
      title: Text(name),
      subtitle: Text(rating != null ? "Rating: $rating" : "Difficulty: Medium"),
      trailing: Text(remainingTime, style: const TextStyle(fontSize: 14)),
    );
  }
}
