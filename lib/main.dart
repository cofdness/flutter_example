import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
      home: buildHomePage('Strawberry Pavlova Recipe'),
      debugShowCheckedModeBanner: false,
    );
  }

  Widget borderBox(Widget widget) => Container(
    decoration: BoxDecoration(
        border: Border.all(color: Colors.black)
    ),
    child: widget,
  );

  Widget buildHomePage(String title) {


    const titleText = Padding(
      padding: EdgeInsets.all(20),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          'Strawberry Pavlova',
          style: TextStyle(
              fontWeight: FontWeight.w800,
              letterSpacing: 0.5,
              fontSize: 30
          ),
        ),
      )
    );

    const subText = Padding(
        padding: EdgeInsets.all(20),
        child: Align(
          alignment: Alignment.center,
          child: Text(
              'Pavlova is a meringue-based dessert named after the Russian ballerina '
              'Anna Pavlova. Pavlova features a crisp crust and soft, light inside, '
              'topped with fruit and whipped cream.',
            style: TextStyle(
              fontFamily: 'Georgia',
              fontSize: 25
            ),
          ),
    ),
    );

    final mainImage = Image.asset(
      'assets/images/pavlova.jpg',
      fit: BoxFit.fill,
    );
    Icon icon(Color color) => Icon(Icons.star, color: color);

    final stars = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        icon(Colors.green.shade500),
        icon(Colors.green.shade500),
        icon(Colors.green.shade500),
        icon(Colors.black),
        icon(Colors.black)
      ],
    );

    const ratingText = Text(
      '170 Reviews',
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w800,
        fontFamily: 'Roboto',
        letterSpacing: 0.5,
        fontSize: 20,
      ),
    );

    final starView = Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          stars,
          ratingText
        ],
      ),
    );

    const descTextStyle = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w800,
      fontFamily: 'Roboto',
      letterSpacing: 0.5,
      fontSize: 18,
      height: 2,
    );

    final iconList = DefaultTextStyle.merge(
      style: descTextStyle,
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Icon(Icons.kitchen, color: Colors.green[500]),
                const Text('PREP:'),
                const Text('25 min'),
              ],
            ),
            Column(
              children: [
                Icon(Icons.timer, color: Colors.green[500]),
                const Text('COOK:'),
                const Text('1 hr'),
              ],
            ),
            Column(
              children: [
                Icon(Icons.restaurant, color: Colors.green[500]),
                const Text('FEEDS:'),
                const Text('4-6'),
              ],
            ),
          ],
        ),
      ),
    );

    final recipeDescription = Container(
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children:  [
          borderBox(titleText),
          borderBox(subText),
          borderBox(starView),
          borderBox(iconList)
          

        ],
      ),
    );


    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Card(
        margin: const EdgeInsets.all(32),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 440,
              child: recipeDescription,
            ),
            SizedBox(
                height: 547,
                child: mainImage
            )
          ],
        ),
      ),
    );
  }
}