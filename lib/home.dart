import 'package:flutter/material.dart';

class Hom extends StatefulWidget {
  const Hom({Key? key}) : super(key: key);

  @override
  State<Hom> createState() => _HomState();
}

class _HomState extends State<Hom> {
  List bodyHealth = [
    bodyHealthItem('blood_w.png', '120/60', 'Blood Pressure'),
    bodyHealthItem('heart_w.png', '65', 'Heart Rate'),
    bodyHealthItem('heartbeat_w.png', '92', 'Oxygen'),
  ];

  int index = 0;

  bool active_1 = true;
  bool active_2 = false;
  bool active_3 = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  child: Container(
                    height: 100,
                    child: bodyHealth[index],
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.cyan[200]),
                  ),
                ),
                Positioned(
                    top: 50,
                    child: Row(
                      children: [
                        InkWell(
                            onTap: () {
                              setState(() {
                                active_1 = true;
                                active_2 = false;
                                active_3 = false;
                                index = 0;
                              });
                            },
                            child: iconMeasureItem(
                                'blood', '120/60', 'Blood Pressure', active_1)),
                        InkWell(
                            onTap: () {
                              setState(() {
                                active_1 = false;
                                active_2 = true;
                                active_3 = false;
                                index = 2;
                              });
                            },
                            child: iconMeasureItem(
                                'heart', '65', 'Heart Rate', active_2)),
                        InkWell(
                            onTap: () {
                              setState(() {
                                active_1 = false;
                                active_2 = false;
                                active_3 = true;
                                index = 2;
                              });
                            },
                            child: iconMeasureItem(
                                'heartbeat', '92', 'Oxygen', active_3)),
                      ],
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget bodyHealthItem(image, measure, measureType) {
  return Row(
    children: [
      Image.asset('assets/images/$image'),
      Column(
        children: [
          Text(
            measure,
            style: TextStyle(fontSize: 30),
          ),
          Text(measureType, style: TextStyle(fontSize: 14)),
          Text(
              'Create complex layouts with ConstraintLayout by adding constraints from each view to other views and guidelines. Then preview your layout on any screen size by selecting one of various device configurations or by simply resizing the preview window.',
              style: TextStyle(fontSize: 12))
        ],
      ),
    ],
  );
}

Widget iconMeasureItem(image, measure, measureType, active) {
  var color = active ? Colors.cyan[100] : Colors.cyan;
  var img = active ? '_b.png' : '_w.png';
  return CircleAvatar(
    backgroundColor: color,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset('assets/images/${image + img}'),
        Text(
          measure,
          style: TextStyle(fontSize: 12, color: Colors.white),
        ),
        Text(measureType, style: TextStyle(fontSize: 7, color: Colors.white)),
      ],
    ),
  );
}
