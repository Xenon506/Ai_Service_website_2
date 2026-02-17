import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import 'solution_detail_page.dart';

class NaturalLanguageProcessingPage extends StatelessWidget {
  final Function(String) onNavigate;

  const NaturalLanguageProcessingPage({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return SolutionDetailPage(
      onNavigate: onNavigate,
      icon: Bootstrap.messenger,
      title: 'Natural Language Processing',
      description:
          'Advanced NLP solutions for text analysis, sentiment detection, and conversational AI applications.',
      capabilities: const [
        'Sentiment analysis',
        'Text classification',
        'Entity extraction',
        'Language translation',
      ],
      useCases: const [
        'Analyze customer reviews and support tickets to surface trends, pain points, and sentiment.',
        'Auto-route incoming messages to the right team (sales, support, billing) using intent classification.',
        'Extract entities like names, products, dates, and amounts from unstructured text.',
        'Enable multilingual support with translation and locale-aware processing.',
      ],
      deliverables: const [
        'NLP model(s) or LLM-powered pipeline with evaluation metrics.',
        'Integration for real-time or batch processing (webhooks, APIs, or queues).',
        'Human-in-the-loop workflows for review, corrections, and continuous improvement.',
        'Analytics dashboards for intent/sentiment and model performance.',
      ],
    );
  }
}

