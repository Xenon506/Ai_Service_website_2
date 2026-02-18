import 'package:flutter/material.dart';

import 'blog_detail_page.dart';

class BlogMlopsChecklistPage extends StatelessWidget {
  final Function(String) onNavigate;

  const BlogMlopsChecklistPage({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return BlogDetailPage(
      onNavigate: onNavigate,
      category: 'Operations',
      title: 'MLOps Checklists for Small Teams',
      readTime: '6 min read',
      description:
          'Lightweight checklists that help small teams run AI systems safely without a huge platform.',
      sections: const [
        'We propose pragmatic checklists for data quality, model deployment, and post-deployment monitoring.',
        'Each checklist is designed to be realistic for teams without a dedicated platform engineering group.',
        'You will see examples of minimal-but-effective alerting and runbooks you can adapt to your stack.',
        'The article ends with suggestions on how to incrementally mature your MLOps practices over time.',
      ],
    );
  }
}

