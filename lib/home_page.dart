
import 'dart:convert';

import 'package:departure_gita/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'home_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
      Provider.of<HomeProvider>(context,listen: false).loaddata();

    super.initState();
  }



  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BHAGAVAD GITA",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent,
        actions: [
          Consumer<ThemeProvider>(
            builder:
                (BuildContext context, ThemeProvider value, Widget? child) {
              return InkWell(
                onTap: () {
                  value.changetheme();
                },
                child: Icon(
                  value.theme == ThemeMode.light
                      ? Icons.light_mode
                      : Icons.dark_mode,
                  color: Colors.white,
                ),
              );
            },
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: Consumer<HomeProvider>(
        builder:
            (BuildContext context, HomeProvider value, Widget? child) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: value.allist.length,
                  itemBuilder: (context, index) {
                    Map<String, dynamic> item = value.allist[index];
                    return InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "detail_page",
                              arguments: value.allist[index]);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.deepOrange,
                            ),
                            child: Center(
                              child: ListTile(
                                leading: Container(
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50)
                                  ),
                                  child: Image.network("${item["img"]}",fit: BoxFit.cover,),
                                ),
                                title: Text("${item["adhay_name"]}",style: TextStyle(color: Colors.white),),
                                subtitle: Text("${item["adhay_no"]??""}",style: TextStyle(color: Colors.white),),
                                trailing: Icon(Icons.keyboard_arrow_right,color: Colors.white,size: 30,),
                              ),
                            ),
                          ),
                        ));
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
