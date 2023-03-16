import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';



class briefDetails extends StatelessWidget {
  final Map<String, dynamic> data;

  const briefDetails({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrangeAccent,
          title: Text(data['briefName']),
          centerTitle: true, // accessing the 'briefName' property
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(data['image']),
              Container(
                color: Colors.white,
                width: double.infinity,
                child:  Text(
                  data['briefName'],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        // width: 100,
                        // height: 100,
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(8),
                        color: Colors.deepOrangeAccent,
                        child: const Text(
                          'Java',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      Container(
                        // width: 100,
                        // height: 100,
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(8),
                        color: Colors.deepOrangeAccent,
                        child: const Text(
                          'MySQL',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      Container(
                        // width: 100,
                        // height: 100,
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(8),
                        color: Colors.deepOrangeAccent,
                        child: const Text(
                          'Git',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      Container(
                        // width: 100,
                        // height: 100,
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(8),
                        color: Colors.deepOrangeAccent,
                        child: const Text(
                          'UML',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ],
                  )),

             
              Container(
                color: Colors.white,
                width: double.infinity,
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(6),
                child: Column(
                  children:  [
                    Text(
                      'Modalités pédagogiques  :',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text( data['endDate'].toString()+"-"+data['group'].toString(),
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 14,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                width: double.infinity,
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(6),
                child: Column(
                  children: const [
                    Text(
                      'Critères de performance  :',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Appliquer les bonnes pratique du Code && Utilisation de Spring Boot et Spring Security',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 14,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                width: double.infinity,
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(6),
                child: Column(
                  children:  [
                    Text(
                      'Application Type :',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      data['type'].toString(),
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 14,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                width: double.infinity,
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(6),
                child: Column(
                  children: const [
                    Text(
                      'Livrables  :',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Lien Github de votre API',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 14,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
    )  ;
    }
}