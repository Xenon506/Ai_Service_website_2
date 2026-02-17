import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import 'solution_detail_page.dart';

class MachineLearningModelsPage extends StatelessWidget {
  final Function(String) onNavigate;

  const MachineLearningModelsPage({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return SolutionDetailPage(
      onNavigate: onNavigate,
      icon: Bootstrap.cpu,
      title: 'Machine Learning Models',
      description:
          'Custom ML models trained on your data to solve complex business problems and automate decision-making processes.',
      capabilities: const [
        'Predictive analytics',
        'Pattern recognition',
        'Anomaly detection',
        'Recommendation systems',
      ],
      useCases: const [
        'Forecast demand, revenue, and operational load using historical data and external signals.',
        'Detect anomalies in transactions, sensor readings, or user behavior to reduce risk and downtime.',
        'Recommend products, content, or next-best actions to increase conversions and retention.',
        'Score leads and automate prioritization using data-driven propensity models.',
      ],
      deliverables: const [
        'A trained model (and retraining pipeline where needed) with reproducible experiments.',
        'API or batch inference integration for your product or operations workflows.',
        'Monitoring for data drift, performance, and model health.',
        'Documentation and handover for maintenance and future iteration.',
      ],
    );
  }
}

