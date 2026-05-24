import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.height,
          height: double.infinity,
          decoration: BoxDecoration(border: Border.all(width: 5)),

          child: Image.asset("assets/kirby-xd.jpg", fit: BoxFit.fill),
        ),
      ),
      // body: Container(
      //   decoration: BoxDecoration(border: Border.all(width: 5)),
      //     // child: Text(
      //     //     "mama mia",
      //     //   style:
      //     //   TextStyle(
      //     //     color: Colors.deepPurpleAccent,
      //     //     fontWeight: FontWeight.bold,
      //     //     fontSize: 23
      //     //   ),
      //     // )
      //     child: RichText(text: TextSpan(text: "duma may", style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold, fontSize: 23))),
      // ),
      backgroundColor: Colors.yellowAccent,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        leading: IconButton(
            onPressed: (){},
            icon: Icon(Icons.menu)
        ),
        title: Center(child: Text("KEKW")),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search)),
          IconButton(onPressed: (){}, icon: Icon(Icons.telegram))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile "),
      ]),
    );
  }
}