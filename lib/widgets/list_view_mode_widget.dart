import 'package:flutter/material.dart';
import 'package:flutter_module_9/models/hotel_card.dart';

class ListViewModeWidget extends StatelessWidget {
  final HotelCard hotelCard;

  const ListViewModeWidget({super.key, required this.hotelCard});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 5,
        margin: const EdgeInsets.all(8),
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {},
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: Image.asset(
                  "assets/images/${hotelCard.poster}",
                  fit: BoxFit.cover,
                  height: 200,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(hotelCard.name),
                        )),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/detail',
                                arguments: hotelCard.uuid);
                          },
                          child: const Text("Details"),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
