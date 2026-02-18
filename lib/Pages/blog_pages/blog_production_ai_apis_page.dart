import 'package:flutter/material.dart';

import 'blog_detail_page.dart';

class BlogProductionAiApisPage extends StatelessWidget {
  final Function(String) onNavigate;

  const BlogProductionAiApisPage({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return BlogDetailPage(
      onNavigate: onNavigate,
      category: 'AI Engineering',
      title: 'Building Production Ready AI APIs',
      readTime: '6 min read',
      description:
          'Patterns and guardrails for turning experimental notebooks into resilient, observable AI APIs.',
      sections: const [
        'Most AI projects begin in notebooks, but production systems require strict contracts, timeouts, and fallbacks. We start by defining clear API schemas and error envelopes.',
        'We then look at techniques for handling latency and variability in model responses, including circuit breakers, caching, and bulkheads.',
        'You will learn how to apply observability to AI endpoints: structured logging, tracing, and metrics that capture both technical health and model quality.',
        'The article ends with deployment strategies for blue/green and shadow rollouts, so you can introduce new models with confidence.',
      ],
    );
  }
}

