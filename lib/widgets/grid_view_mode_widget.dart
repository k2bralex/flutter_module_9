import 'package:flutter/material.dart';
import 'package:flutter_module_9/models/hotel_card.dart';

class GridViewModeWidget extends StatelessWidget {
  final HotelCard hotelCard;

  const GridViewModeWidget({super.key, required this.hotelCard});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flexible(
              flex: 3,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: Image.asset(
                  "assets/images/${hotelCard.poster}",
                  fit: BoxFit.cover,
                  height: 100,
                ),
              ),
            ),
            Flexible(
                flex: 2,
                child: Center(
                  child: Text(hotelCard.name),
                )),
            Flexible(
              flex: 1,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)))),
                onPressed: () {
                  Navigator.pushNamed(context, '/detail', arguments: hotelCard.uuid);
                  //print("Details");
                },
                child: const Text("Details"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
