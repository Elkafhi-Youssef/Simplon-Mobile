import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  _buildBrief(
    String briefImg,
    String briefTitle,
  String briefType) {
    return Container(
      width: 160,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black38, width: 1),
          borderRadius: BorderRadius.circular(10)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Image.asset(briefImg,
            width: 200, height: 200, fit: BoxFit.cover),
        Container(
          child:  Text(
            briefTitle,
            style: TextStyle(
              fontFamily: "firstfont",
              fontSize: 16,
            ),
            textAlign: TextAlign.start,
          ),
        ),
        Container(
          child: Text(briefType),
          margin: EdgeInsets.fromLTRB(5, 10, 0, 0),
        )
      ]),
    );
  }

 
  var brief = Container(
    width: 160,
    padding: const EdgeInsets.all(4),
    decoration: BoxDecoration(
        border: Border.all(color: Colors.black38, width: 1),
        borderRadius: BorderRadius.circular(10)),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Image.asset('assets/img/filerouge.png',
          width: 200, height: 200, fit: BoxFit.cover),
      Container(
        child: const Text(
          "File rouge",
          style: TextStyle(
            fontFamily: "firstfont",
            fontSize: 16,
          ),
          textAlign: TextAlign.start,
        ),
      ),
      Container(
        child: Text("application web / mobile"),
        margin: EdgeInsets.fromLTRB(5, 10, 0, 0),
      )
    ]),
  );
  @override
  Widget build(BuildContext context) {
    Widget brief1 =  _buildBrief('assets/img/filerouge.png', "File rouge", "application web / mobile");
    Widget brief2 =  _buildBrief('assets/img/filerouge.png', "File rouge", "application web / mobile");
    Widget brief3 =  _buildBrief('assets/img/mypet.png', "My Pets", "application web / mobile");
    Widget brief4 =  _buildBrief('assets/img/angular.png', "Angular", "application web / mobile");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Simplone", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          IconButton(icon: const Icon(Icons.message), onPressed: () {}),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.all(5),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                child: Expanded(
                  child: Row(children: [
                    Container(
                      child: Image.asset('assets/img/imgpromo.webp',
                          width: 200, height: 200, fit: BoxFit.cover),
                    ),
                    Expanded(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              margin: EdgeInsets.all(8),
                              child: const Text("Brendan Eich",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: "firstfont",
                                      fontWeight: FontWeight.w500)),
                            ),
                            Container(
                              margin: EdgeInsets.all(8),
                              child: const Text("19 apprenants",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: "firstfont",
                                      fontWeight: FontWeight.w500)),
                            ),
                            Container(
                              margin: EdgeInsets.all(8),
                              child: const Text(
                                "2022/2023",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: "firstfont",
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ]),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                child: Column(children: [
                  const Text(
                    "Lsit of briefs",
                    style: TextStyle(
                        fontFamily: "firstfont",
                        fontSize: 16,
                        decoration: TextDecoration.underline),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Wrap(
                      runSpacing: 10.0,
                      alignment: WrapAlignment.center,
                      spacing: 10,
                      children: [
                        brief1,
                        brief2,
                        brief4,
                        brief3,
                      ],
                    ),
                  )
                ]),
              )
            ],
          )),
    );
  }
}
