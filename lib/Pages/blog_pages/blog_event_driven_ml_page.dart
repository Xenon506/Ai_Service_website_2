import 'package:flutter/material.dart';

import 'blog_detail_page.dart';

class BlogEventDrivenMlPage extends StatelessWidget {
  final Function(String) onNavigate;

  const BlogEventDrivenMlPage({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return BlogDetailPage(
      onNavigate: onNavigate,
      category: 'Backend',
      title: 'Event-Driven Pipelines for Machine Learning',
      readTime: '11 min read',
      description:
          'Designing resilient event-driven systems that keep your models supplied with fresh, trustworthy data.',
      sections: const [
        'We review the benefits of event-driven architectures for machine learning: decoupling, scalability, and clear data lineage.',
        'You will see patterns for building ingestion, enrichment, and validation stages using queues and streams.',
        'The article shows how to connect these pipelines to feature stores and training workflows so your models evolve continuously.',
        'We also discuss failure modes and backpressure handling so that bad events do not silently corrupt your models.',
      ],
    );
  }
}

