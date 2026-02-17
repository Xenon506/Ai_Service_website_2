import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import 'solution_detail_page.dart';

class ComputerVisionPage extends StatelessWidget {
  final Function(String) onNavigate;

  const ComputerVisionPage({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return SolutionDetailPage(
      onNavigate: onNavigate,
      icon: Bootstrap.eye,
      title: 'Computer Vision',
      description:
          'Image and video analysis solutions for object detection, facial recognition, and visual inspection.',
      capabilities: const [
        'Object detection',
        'Image classification',
        'Facial recognition',
        'Quality inspection',
      ],
      useCases: const [
        'Detect and count objects in images/video (inventory, retail shelves, logistics).',
        'Classify images for moderation, cataloging, or defect categories.',
        'Perform automated visual inspection for manufacturing quality control.',
        'Enable secure identity verification and access workflows where appropriate.',
      ],
      deliverables: const [
        'Model(s) tuned for your camera setup, lighting conditions, and target objects.',
        'Edge or cloud inference deployment depending on latency and cost needs.',
        'Dataset guidance (labeling standards, augmentation, QA) to scale accuracy.',
        'Monitoring and feedback loop for continuous accuracy improvements.',
      ],
    );
  }
}

