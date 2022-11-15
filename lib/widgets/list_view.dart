import 'package:flutter/material.dart';

import '../models/card.dart';
import 'list_view_mode_widget.dart';

class ListViewMode extends StatelessWidget {
  final List<HotelCard> cards;

  const ListViewMode({super.key, required this.cards});

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: cards.map((card) => ListViewModeWidget(card: card)).toList());
  }
}
