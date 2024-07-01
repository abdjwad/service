
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

import '../screens/favorat/favorat.dart';
import '../screens/detail/job_detail_screen.dart';

class Job {

  final String company;
  final String title;
  final String description;
  final String companyProfileUrl;
  final String applyUrl;
  final String imageUrl;  // إضافة رابط صورة الشركة
  final String location;  // إضافة موقع الشركة
  final String salary;    // إضافة الراتب

  Job({
    required this.company,
    required this.description,
    required this.companyProfileUrl,
    required this.applyUrl,
    required this.imageUrl,    // إضافة رابط صورة الشركة
    required this.location,    // إضافة موقع الشركة
    required this.salary,
    required this.title,
          // إضافة الراتب
  });
}
class JobListPage extends StatefulWidget {
  final List<Job> jobList;

  JobListPage({super.key, required this.jobList});

  @override
  _JobListPageState createState() => _JobListPageState();
}

class _JobListPageState extends State<JobListPage> {
  final List<Job> favoriteJobs = [];

  @override
  void initState() {
    super.initState();
    _addDefaultJob();
  }

  void _addDefaultJob() {
    if (widget.jobList.isEmpty) {
      widget.jobList.add(
          Job(
        title: 'No Jobs Available',
        company: 'N/A',
        location: 'N/A',
        description: 'Currently, there are no jobs available. Please check back later.',
        applyUrl: '',
        companyProfileUrl: '',
            imageUrl: "assets/images/car.jpg",
            salary: "233"
      ));
    }
  }

  void _addToFavorites(Job job) {
    setState(() {
      if (!favoriteJobs.contains(job)) {
        favoriteJobs.add(job);
      }
    });
  }

  void _removeFromFavorites(Job job) {
    setState(() {
      favoriteJobs.remove(job);
    });
  }

  void _applyToJob(int index) {
    // Functionality for applying to job
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Job Listings'),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoritesPage(
                    favoriteJobs: favoriteJobs,
                    removeFromFavorites: _removeFromFavorites,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: widget.jobList.length,
        itemBuilder: (context, index) {
          final job = widget.jobList[index];
          return GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>JobDetailScreen(job: job,)));
            },
            child: Container(
              margin: EdgeInsets.all(10),
              height: 250,
              width: 335,
              padding: EdgeInsets.only(left: 15, top: 15, right: 15),
              decoration: BoxDecoration(
                color: const Color(0xFF041841),
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black87,
                    blurRadius: 2.0,
                    spreadRadius: 1.0,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LikeButton(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    circleColor: const CircleColor(
                      start: Color(0xff00ddff),
                      end: Color(0xff0099cc),
                    ),
                    likeBuilder: (bool isLiked) {
                      return Icon(
                        Icons.favorite,
                        color: isLiked ? Colors.red : Colors.grey,
                        size: 30,
                      );
                    },
                    onTap: (isLiked) async {
                      if (!isLiked) {
                        _addToFavorites(job);
                      } else {
                        _removeFromFavorites(job);
                      }
                      return !isLiked;
                    },
                  ),
                  const SizedBox(height: 10),
                  Text(
                    job.title,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    children: [
                      Icon(
                        Icons.business_center,
                        size: 18.0,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 8.0),
                      Text(
                        job.company,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 18.0,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 8.0),
                      Text(
                        job.location,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  job.applyUrl.isNotEmpty
                      ? Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () => _applyToJob(index),
                        child: Text(
                          'Apply Now',
                          style: TextStyle(color: Colors.black87),
                        ),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.white,
                        ),
                      ),
                    ],
                  )
                      : Container(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
