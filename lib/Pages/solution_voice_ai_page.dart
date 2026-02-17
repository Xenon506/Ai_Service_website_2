import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import 'solution_detail_page.dart';

class VoiceAISolutionsPage extends StatelessWidget {
  final Function(String) onNavigate;

  const VoiceAISolutionsPage({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return SolutionDetailPage(
      onNavigate: onNavigate,
      icon: Bootstrap.headphones,
      title: 'Voice AI Solutions',
      description:
          'Speech recognition and synthesis for voice assistants, transcription, and audio analysis.',
      capabilities: const [
        'Speech-to-text',
        'Text-to-speech',
        'Voice recognition',
        'Audio analysis',
      ],
      useCases: const [
        'Transcribe calls and meetings with speaker diarization and summaries.',
        'Build voice-enabled assistants for support, scheduling, or internal tools.',
        'Analyze call quality and compliance using audio + transcript signals.',
        'Enable accessibility features like live captions and voice navigation.',
      ],
      deliverables: const [
        'Speech pipeline (streaming or batch) with latency and accuracy targets.',
        'Integration for recordings, storage, and retrieval of transcripts.',
        'Customization for domain vocabulary and noisy environments.',
        'Monitoring for accuracy, cost, and privacy/compliance requirements.',
      ],
    );
  }
}

