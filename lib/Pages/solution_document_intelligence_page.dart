import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import 'solution_detail_page.dart';

class DocumentIntelligencePage extends StatelessWidget {
  final Function(String) onNavigate;

  const DocumentIntelligencePage({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return SolutionDetailPage(
      onNavigate: onNavigate,
      icon: Bootstrap.file_text,
      title: 'Document Intelligence',
      description:
          'Automate document processing with AI-powered extraction, classification, and analysis.',
      capabilities: const [
        'Document classification',
        'Data extraction',
        'Form processing',
        'Invoice automation',
      ],
      useCases: const [
        'Extract key fields from invoices, receipts, contracts, and statements.',
        'Classify incoming documents (KYC, claims, onboarding) to the right workflow.',
        'Automate forms and PDF processing to reduce manual entry and errors.',
        'Enable search and analytics across large document repositories.',
      ],
      deliverables: const [
        'OCR + extraction pipeline tailored to your document templates and variability.',
        'Validation rules and exception handling for low-confidence fields.',
        'Integration into your ERP/CRM/back-office systems.',
        'Audit trail and reporting for compliance and operational visibility.',
      ],
    );
  }
}

