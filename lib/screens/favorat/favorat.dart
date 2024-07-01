import 'package:flutter/material.dart';

import '../../config/models/job.dart';
import '../../jop/JobListPage.dart';
import '../detail/job_detail_screen.dart';

class FavoriteItem {
  final String title;
  final String description;
  final String imageUrl;
  final Job job;

  FavoriteItem({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.job,
  });
}

class FavoritesPage extends StatelessWidget {
  final List<Job> favoriteJobs;
  final Function(Job) removeFromFavorites;

  const FavoritesPage({
    super.key,
    required this.favoriteJobs,
    required this.removeFromFavorites,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
        backgroundColor: Color(0xFF3B5999),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: favoriteJobs.length,
        itemBuilder: (context, index) {
          final job = favoriteJobs[index];
          return Dismissible(
            key: Key(job.title),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              removeFromFavorites(job);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${job.title} removed from favorites')),
              );
            },
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
            child: Card(
              margin: EdgeInsets.symmetric(vertical: 10),
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.all(15),
                leading: Image.network(
                  'https://via.placeholder.com/150',
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                title: Text(
                  job.title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  'Company: ${job.company}\nLocation: ${job.location}',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.info, color: Colors.blue),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => JobDetailScreen(job: job),
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
