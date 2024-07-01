import 'package:flutter/material.dart';
import '../config/palette.dart';

class JobListPage extends StatefulWidget {
  @override
  _JobListPageState createState() => _JobListPageState();
}

class _JobListPageState extends State<JobListPage> {
  List<Map<String, String>> allJobs = [
    {
      'title': 'Software Engineer',
      'company': 'Tech Corp',
      'location': 'New York',
      'category': 'Engineering',
    },
    {
      'title': 'Product Manager',
      'company': 'Innovate Ltd',
      'location': 'San Francisco',
      'category': 'Management',
    },
    {
      'title': 'UI/UX Designer',
      'company': 'Creative Solutions',
      'location': 'Austin',
      'category': 'Design',
    },
    {
      'title': 'Marketing Specialist',
      'company': 'Marketing Experts',
      'location': 'Miami',
      'category': 'Marketing',
    },
  ];

  List<Map<String, String>> filteredJobs = [];

  void _filterJobs(String query) {
    setState(() {
      filteredJobs = allJobs.where((job) {
        final titleLower = job['title']!.toLowerCase();
        final companyLower = job['company']!.toLowerCase();
        final categoryLower = job['category']!.toLowerCase();
        final searchLower = query.toLowerCase();

        return titleLower.contains(searchLower) ||
            companyLower.contains(searchLower) ||
            categoryLower.contains(searchLower);
      }).toList();

      // Sort the filtered jobs by the first letter of the title
      filteredJobs.sort((a, b) => a['title']!.compareTo(b['title']!));
    });

    _showFilteredJobs();
  }

  void _showFilteredJobs() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 400,
          padding: EdgeInsets.all(16.0),
          child: ListView.builder(
            itemCount: filteredJobs.length,
            itemBuilder: (context, index) {
              final job = filteredJobs[index];
              return JobCard(
                title: job['title']!,
                company: job['company']!,
                location: job['location']!,
                category: job['category']!,
                onFavorite: () {
                  // Handle favorite action
                },
                onApply: () {
                  // Handle apply action
                },
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Job List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SearchField(
              onChanged: (query) => _filterJobs(query),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: allJobs.length,
                itemBuilder: (context, index) {
                  final job = allJobs[index];
                  return JobCard(
                    title: job['title']!,
                    company: job['company']!,
                    location: job['location']!,
                    category: job['category']!,
                    onFavorite: () {
                      // Handle favorite action
                    },
                    onApply: () {
                      // Handle apply action
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class JobCard extends StatelessWidget {
  final String title;
  final String company;
  final String location;
  final String category;
  final VoidCallback onFavorite;
  final VoidCallback onApply;

  const JobCard({
    Key? key,
    required this.title,
    required this.company,
    required this.location,
    required this.category,
    required this.onFavorite,
    required this.onApply,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage('https://via.placeholder.com/150'), // Placeholder for company logo
                radius: 30,
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    company,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10.0),
          Row(
            children: [
              Icon(
                Icons.location_on,
                size: 18.0,
                color: Colors.grey,
              ),
              SizedBox(width: 8.0),
              Text(
                location,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.0),
          Row(
            children: [
              Icon(
                Icons.category,
                size: 18.0,
                color: Colors.grey,
              ),
              SizedBox(width: 8.0),
              Text(
                category,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(
                  Icons.favorite_border,
                  color: Colors.red,
                ),
                onPressed: onFavorite,
              ),
              ElevatedButton(
                onPressed: onApply,
                child: Text('Apply Now'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.blue,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
class SearchField extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const SearchField({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 50,
      decoration: BoxDecoration(
        color: kSecondaryColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: 'Search Job',
          prefixIcon: Icon(Icons.search),
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        ),
      ),
    );
  }
}