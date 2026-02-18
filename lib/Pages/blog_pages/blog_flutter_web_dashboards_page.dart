import 'package:flutter/material.dart';

import 'blog_detail_page.dart';

class BlogFlutterWebDashboardsPage extends StatelessWidget {
  final Function(String) onNavigate;

  const BlogFlutterWebDashboardsPage({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return BlogDetailPage(
      onNavigate: onNavigate,
      category: 'Flutter',
      title: 'Optimizing Flutter Web for Dashboards',
      readTime: '9 min read',
      description:
          'Techniques for building responsive, high-performance analytics dashboards with Flutter Web.',
      sections: const [
        'We start by examining layout patterns that work well for data-heavy dashboards on both desktop and tablet.',
        'The article then dives into performance profiling, including how to identify expensive rebuilds and overdraw.',
        'You will learn how to structure state management and API calls to keep the UI snappy even with live-updating charts.',
        'We finish with deployment and caching strategies to make your dashboard feel native-fast to users.',
      ],
    );
  }
}

