import 'package:flutter/material.dart';

import 'blog_detail_page.dart';

class BlogAiSaasPlatformPage extends StatelessWidget {
  final Function(String) onNavigate;

  const BlogAiSaasPlatformPage({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return BlogDetailPage(
      onNavigate: onNavigate,
      category: 'Case Study',
      title: 'How We Built an Enterprise AI SaaS Platform',
      readTime: '10 min read',
      description:
          'A practical look at how we combined Flutter, Supabase, and modern AI infrastructure to deliver an enterprise-ready SaaS platform.',
      sections: const [
        'In this article, we walk through the high-level architecture behind our AI SaaS platform, from authentication and multi-tenancy to model orchestration.',
        'We cover trade-offs between using managed services versus rolling our own infrastructure, and how that impacted velocity, reliability, and cost.',
        'You will see how we structured our Flutter web client, API gateway, and background workers so that new AI-powered features can be added quickly without destabilizing the existing product.',
        'Finally, we share a checklist of decisions you should make early when designing a similar platform: data residency, observability, model lifecycle, and billing.',
      ],
    );
  }
}

