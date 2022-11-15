import 'package:flutter/material.dart';

import '../models/card.dart';
import 'grid_view_mode_widget.dart';

class GridViewMode extends StatelessWidget {
  final List<HotelCard> cards;

  const GridViewMode({super.key, required this.cards});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 2,
        children: cards.map((card) => GridViewModeWidget(card: card)).toList());
  }
}
