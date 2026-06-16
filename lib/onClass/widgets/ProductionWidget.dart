import 'package:flutter/material.dart';


class Productionwidget extends StatelessWidget {
  const Productionwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 700,
        child: Column(
          children: [
            Expanded(
              flex: 8,
              child: SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  height: 500,
                  decoration: BoxDecoration(
                    border: Border.all(width: 5, color: Colors.deepPurple),
                  ),
                  child: Stack(
                    children: [
                      Image.asset("assets/kirby-xd.jpg", fit: BoxFit.fill),
                      Positioned(
                        bottom: 10,
                        right: 20,
                        child: FloatingActionButton.extended(
                          onPressed: () {},
                          label: const Text("Add to cart"),
                          icon: const Icon(Icons.shopping_basket),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("AYY CARUMBA"),
                      Text("DUMA MAY U AR DA GEY SICK"),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Icon(Icons.airline_seat_legroom_extra_sharp),
                      Text("Outisde ROw xDALKSDASJDKjl"),
                    ],
                  ),
                ],
              ),
            ),
            const Expanded(
              flex: 2,
              child: Text(
                "ITEMDESCRIPTION YIPPEE YIPPEE YIPPEE YIPPEE YIPPEE YIPPEE YIPPEE YIPPEE YIPPEE YIPPEE YIPPEE YIPPEE YIPPEE YIPPEE YIPPEE YIPPEE YIPPEE YIPPEE YIPPEE YIPPEE YIPPEE YIPPEE YIPPEE YIPPEE YIPPEE YIPPEE YIPPEE YIPPEE YIPPEE YIPPEE YIPPEE YIPPEE YIPPEE YIPPEE YIPPEE YIPPEE",
                textAlign: TextAlign.justify,
              ),
            )
          ],
        ),
      ),
    );
  }
}