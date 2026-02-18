import 'package:flutter/material.dart';

import 'blog_detail_page.dart';

class BlogAiFirstSaasArchitecturePage extends StatelessWidget {
  final Function(String) onNavigate;

  const BlogAiFirstSaasArchitecturePage({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return BlogDetailPage(
      onNavigate: onNavigate,
      category: 'Architecture',
      title: 'Designing AI-First SaaS Architectures',
      readTime: '8 min read',
      description:
          'How to design your SaaS product so AI is a core capability, not an afterthought bolted on later.',
      sections: const [
        'We begin by contrasting traditional CRUD SaaS apps with AI-first products, where data collection and labeling strategies are built into the UX from day one.',
        'The article explores how to separate concerns between transactional workloads, analytical pipelines, and model-serving infrastructure.',
        'You will see several reference architectures for feature stores, model registries, and streaming pipelines that enable fast experimentation.',
        'We conclude with guidance on organization structure and team boundaries that support an AI-first roadmap.',
      ],
    );
  }
}

