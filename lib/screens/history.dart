import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:msg/models/proprety_value.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../models/BuildingAssessment/building_assessment.dart';
import '../models/Database/database_helper.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}


class _HistoryPageState extends State<HistoryPage>{
  List<BuildingAssessment> buildingAssessments = [];

  @override
  void initState() {
    _localGet();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // Get orders from users local storage
  _localGet() async {
    buildingAssessments = await DatabaseHelper.instance.readAllAssessments();

    /*
    SharedPreferences instance = await SharedPreferences.getInstance();
    final keys = instance.getKeys();

    for (String key in keys) {
      allEntries.add(instance.get(key));
    }
    */
   
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return buildView();
  }

  Widget buildView() {
    return ListView.separated(
        itemCount: buildingAssessments.length,
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemBuilder: (context, i) {
          dynamic entry = jsonDecode(buildingAssessments[i].toString());
          return buildTile(entry);
        });
  }

  Widget buildTile(entry) {
    return ListTile(title: Text(entry["name"]), trailing: Text(entry["area"]));
  }
}

class ListViewBuilder extends StatelessWidget {
  const ListViewBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
      return Container();
  }
}