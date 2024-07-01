import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:service/config/models/job.dart';
import 'dart:convert';

import '../jop/JobListPage.dart';

class JobProvider with ChangeNotifier {
  List<Job> _jobs = [];

  List<Job> get jobs => _jobs;

  Future<void> fetchJobs() async {
    final url = Uri.parse('https://example.com/api/jobs'); //
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> jobData = json.decode(response.body);
      _jobs = jobData.map((item) => Job(
      //  id: item['id'],
        title: item['title'],
        company: item['company'],
        description: item['description'],
        companyProfileUrl: item['companyProfileUrl'],
        applyUrl: item['applyUrl'], location: 'sdgg', imageUrl: 'assets/images/spc5.jpg', salary: '323',
      )).toList();
      notifyListeners();
    } else {
      throw Exception('Failed to load jobs');
    }
  }
}
