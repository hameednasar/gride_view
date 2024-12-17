import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Responsive Grid ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ResponsiveGridScreen(),
    );
  }
}

class ResponsiveGridScreen extends StatelessWidget {
  const ResponsiveGridScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List of image URLs
    final List<String> images = [
      'https://picsum.photos/id/237/200/300', // Random image 1
      'https://picsum.photos/id/238/200/300', // Random image 2
      'https://picsum.photos/id/239/200/300', // Random image 3
      'https://picsum.photos/id/240/200/300', // Random image 4
      'https://picsum.photos/id/241/200/300', // Random image 5
      'https://picsum.photos/id/242/200/300', // Random image 6
      'https://picsum.photos/id/243/200/300', // Random image 7
    ];

    // Calculate the number of columns based on screen width
    double screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount = (screenWidth / 150).floor(); // Each item is 150px wide

    return Scaffold(
      appBar: AppBar(
        title: const Text('Responsive Grid Layout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount, // Dynamically set columns
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: images.length,
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                images[index],
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey,
                    child: const Center(
                      child: Icon(
                        Icons.error,
                        color: Colors.red,
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
