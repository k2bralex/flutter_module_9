import 'package:flutter/material.dart';

typedef ButtonClickCallback = void Function(int index);

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final ButtonClickCallback onButtonClick;

  const CustomAppBar({super.key, required this.onButtonClick});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Module 9"),
      actionsIconTheme: const IconThemeData(size: 30.0),
      centerTitle: true,
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: IconButton(
            icon: const Icon(
              Icons.list,
              color: Colors.white,
            ),
            onPressed: () => onButtonClick(0),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: IconButton(
            icon: const Icon(
              Icons.grid_view,
              color: Colors.white,
            ),
            onPressed: () => onButtonClick(1),
          ),
        )
      ],
    );
  }

  @override
  final Size preferredSize = const Size.fromHeight(kToolbarHeight);
}
