import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import 'solution_detail_page.dart';

class PredictiveAnalyticsPage extends StatelessWidget {
  final Function(String) onNavigate;

  const PredictiveAnalyticsPage({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return SolutionDetailPage(
      onNavigate: onNavigate,
      icon: Bootstrap.bar_chart,
      title: 'Predictive Analytics',
      description:
          'Harness the power of AI to forecast trends, optimize operations, and make data-driven decisions.',
      capabilities: const [
        'Demand forecasting',
        'Risk assessment',
        'Customer churn prediction',
        'Price optimization',
      ],
      useCases: const [
        'Forecast demand and staffing needs to reduce costs and improve service levels.',
        'Model risk and detect early warning signals (fraud, defaults, outages).',
        'Predict churn and identify retention actions for at-risk customers.',
        'Optimize pricing and promotions using elasticity and scenario simulations.',
      ],
      deliverables: const [
        'Forecasting and scoring models with clear business KPIs and thresholds.',
        'Dashboards for forecast confidence intervals and decision support.',
        'Automations that trigger actions (alerts, workflows, offers) from predictions.',
        'A measurement plan to track lift, savings, and ongoing ROI.',
      ],
    );
  }
}

