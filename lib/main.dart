import 'dart:convert';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List data = [
      {
        "name": "Florida A&M University",
        "city": "Tallahassee",
        "logo":
            "https://upload.wikimedia.org/wikipedia/en/thumb/9/90/Florida_A%26M_University_seal.svg/240px-Florida_A%26M_University_seal.svg.png"
      },
      {
        "name": "Florida Atlantic University",
        "city": "Boca Raton",
        "logo":
            "https://upload.wikimedia.org/wikipedia/en/thumb/f/f3/Florida_Atlantic_University_seal.svg/240px-Florida_Atlantic_University_seal.svg.png"
      },
      {
        "name": "Florida Gulf Coast University",
        "city": "Fort Myers",
        "logo":
            "https://upload.wikimedia.org/wikipedia/en/thumb/c/c5/Florida_Gulf_Coast_University_seal.svg/240px-Florida_Gulf_Coast_University_seal.svg.png"
      },
      {
        "name": "Florida International University",
        "city": "Miami",
        "logo":
            "https://upload.wikimedia.org/wikipedia/en/thumb/9/9e/Florida_Internation_University_seal.svg/240px-Florida_Internation_University_seal.svg.png"
      },
      {
        "name": "Florida Polytechnic University",
        "city": "Lakeland",
        "logo":
            "https://upload.wikimedia.org/wikipedia/en/8/82/FloridaPolyLogo2017.jpg"
      },
      {
        "name": "Florida State University",
        "city": "Tallahassee",
        "logo":
            "https://upload.wikimedia.org/wikipedia/en/thumb/6/6b/Florida_State_University_seal.svg/240px-Florida_State_University_seal.svg.png"
      },
      {
        "name": "New College of Florida",
        "city": "Sarasota",
        "logo":
            "https://upload.wikimedia.org/wikipedia/en/d/d4/This_is_a_logo_for_New_College_of_Florida.jpeg"
      },
      {
        "name": "University of Central Florida",
        "city": "Orlando",
        "logo":
            "https://upload.wikimedia.org/wikipedia/en/thumb/8/81/University_of_Central_Florida_seal.svg/240px-University_of_Central_Florida_seal.svg.png"
      },
      {
        "name": "University of Florida",
        "city": "Gainesville",
        "logo":
            "https://upload.wikimedia.org/wikipedia/en/thumb/6/6d/University_of_Florida_seal.svg/240px-University_of_Florida_seal.svg.png"
      },
      {
        "name": "University of North Florida",
        "city": "Jacksonville",
        "logo":
            "https://upload.wikimedia.org/wikipedia/en/b/b7/UofNorthFloridaSeal.png"
      },
      {
        "name": "University of South Florida",
        "city": "Tampa",
        "logo":
            "https://upload.wikimedia.org/wikipedia/en/thumb/d/d1/University_of_South_Florida_seal.svg/240px-University_of_South_Florida_seal.svg.png"
      },
      {
        "name": "University of West Florida",
        "city": "Pensacola",
        "logo":
            "https://upload.wikimedia.org/wikipedia/en/f/f6/University_of_West_Florida_seal.png"
      },
    ];

    List<University> universities = _fetchData();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('State University System of Florida'),
        ),
        // body: _gridVersionOne(),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
          ),
          itemCount: data?.length ?? 0,
          itemBuilder: (context, index) {
            return Material(
              color: Colors.blueGrey[100],
              elevation: 6.0,
              borderRadius: BorderRadius.circular(5.0),
              child: Column(
                children: [
                  Align(
                    child: FavoriteIcon(),
                    // child: Icon(Icons.favorite_border),
                    alignment: Alignment.topLeft,
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(
                        data[index]['logo'],
                        // width: 150,
                        // height: 150,
                      ),
                    ),
                  ),
                  Align(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data[index]['name']),
                          Text(
                            '(${data[index]['city']})',
                            style: TextStyle(fontSize: 10.0),
                          ),
                        ],
                      ),
                    ),
                    alignment: Alignment.bottomLeft,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  List<University> _fetchData() {
    final Map<String, dynamic> jsonResponse = json.decode(jsonData);
    final List<dynamic> universities = jsonResponse['universities'];
    return universities.map<University>((e) => University.fromJson(e)).toList();
  }

  Widget _gridVersionOne() {
    return GridView(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      children: <Widget>[
        Stack(
          children: [
            Placeholder(),
            Align(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('University Name'),
              ),
              alignment: Alignment.bottomLeft,
            ),
          ],
        ),
        Container(
          color: Colors.lightBlue,
          child: Text('One'),
        ),
        Container(
          color: Colors.lightGreen,
          child: Text('Two'),
        ),
        Container(
          color: Colors.redAccent,
          child: Text('Three'),
        ),
        Container(
          color: Colors.yellowAccent,
          child: Text('Four'),
        ),
        Container(
          color: Colors.purpleAccent,
          child: Text('Five'),
        ),
        Container(
          color: Colors.cyanAccent,
          child: Text('Six'),
        ),
      ],
    );
  }
}

/// Widget Example
class FavoriteIcon extends StatefulWidget {
  const FavoriteIcon({Key key}) : super(key: key);

  @override
  _FavoriteIconState createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<FavoriteIcon> {
  // bool toggle;
  bool toggle = false;
  Icon select = Icon(
    Icons.favorite,
    color: Colors.red,
  );
  Icon deselect = Icon(Icons.favorite_border);

  // @override
  // void initState() {
  //   toggle = false;
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          toggle = !toggle;
        });
      },
      child: toggle ? select : deselect,
    );
  }
}

/// Plain Old Dart Object (PODO)
class University {
  String name;
  String city;
  String logo;
  University({this.name, this.city, this.logo});

  University.fromJson(Map<String, dynamic> json) {
    this.name = json['name'];
    this.city = json['city'];
    this.logo = json['logo'];
  }
}

const String jsonData = '''
{
  "universities":
    [
      {
        "name": "Florida A&M University",
        "city": "Tallahassee",
        "logo":
            "https://upload.wikimedia.org/wikipedia/en/thumb/9/90/Florida_A%26M_University_seal.svg/240px-Florida_A%26M_University_seal.svg.png"
      },
      {
        "name": "Florida Atlantic University",
        "city": "Boca Raton",
        "logo":
            "https://upload.wikimedia.org/wikipedia/en/thumb/f/f3/Florida_Atlantic_University_seal.svg/240px-Florida_Atlantic_University_seal.svg.png"
      },
      {
        "name": "Florida Gulf Coast University",
        "city": "Fort Myers",
        "logo":
            "https://upload.wikimedia.org/wikipedia/en/thumb/c/c5/Florida_Gulf_Coast_University_seal.svg/240px-Florida_Gulf_Coast_University_seal.svg.png"
      },
      {
        "name": "Florida International University",
        "city": "Miami",
        "logo":
            "https://upload.wikimedia.org/wikipedia/en/thumb/9/9e/Florida_Internation_University_seal.svg/240px-Florida_Internation_University_seal.svg.png"
      },
      {
        "name": "Florida Polytechnic University",
        "city": "Lakeland",
        "logo":
            "https://upload.wikimedia.org/wikipedia/en/8/82/FloridaPolyLogo2017.jpg"
      },
      {
        "name": "Florida State University",
        "city": "Tallahassee",
        "logo":
            "https://upload.wikimedia.org/wikipedia/en/thumb/6/6b/Florida_State_University_seal.svg/240px-Florida_State_University_seal.svg.png"
      },
      {
        "name": "New College of Florida",
        "city": "Sarasota",
        "logo":
            "https://upload.wikimedia.org/wikipedia/en/d/d4/This_is_a_logo_for_New_College_of_Florida.jpeg"
      },
      {
        "name": "University of Central Florida",
        "city": "Orlando",
        "logo":
            "https://upload.wikimedia.org/wikipedia/en/thumb/8/81/University_of_Central_Florida_seal.svg/240px-University_of_Central_Florida_seal.svg.png"
      },
      {
        "name": "University of Florida",
        "city": "Gainesville",
        "logo":
            "https://upload.wikimedia.org/wikipedia/en/thumb/6/6d/University_of_Florida_seal.svg/240px-University_of_Florida_seal.svg.png"
      },
      {
        "name": "University of North Florida",
        "city": "Jacksonville",
        "logo":
            "https://upload.wikimedia.org/wikipedia/en/b/b7/UofNorthFloridaSeal.png"
      },
      {
        "name": "University of South Florida",
        "city": "Tampa",
        "logo":
            "https://upload.wikimedia.org/wikipedia/en/thumb/d/d1/University_of_South_Florida_seal.svg/240px-University_of_South_Florida_seal.svg.png"
      },
      {
        "name": "University of West Florida",
        "city": "Pensacola",
        "logo":
            "https://upload.wikimedia.org/wikipedia/en/f/f6/University_of_West_Florida_seal.png"
      }
    ]
}
''';
