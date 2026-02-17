import 'package:aiservicewebsite/widgets/footer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import '../theme.dart';

class SolutionsPage extends StatelessWidget {
  
  // required void Function(String page) onNavigate
  final Function(String) onNavigate;
  
  const SolutionsPage({ required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return SingleChildScrollView(
      child: Column(
        children: [
          _HeaderSection(isMobile: isMobile),
          _AISolutionsGrid(isMobile: isMobile, onNavigate: onNavigate),
          _ProcessSection(isMobile: isMobile),
          _CTASection(isMobile: isMobile),
          Footer(),
        ],
      ),
    );
  }
}

class _HeaderSection extends StatelessWidget {
  final bool isMobile;

  const _HeaderSection({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Container(
  child: Padding(
    padding: EdgeInsets.symmetric(
      horizontal: isMobile ? 16 : 48,
      vertical: isMobile ? 40 : 80,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        /// Title Row
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'AI ',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: isMobile ? 36 : 48,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            Text(
              'Solutions',
              style: GoogleFonts.inter(
                fontSize: isMobile ? 36 : 48,
                fontWeight: FontWeight.bold,
                color: AppColors.orange,
              ),
            ),
          ],
        ),

        const SizedBox(height: 24),

        /// Description
        SizedBox(
          width: isMobile ? double.infinity : 700,
          child: Text(
            'Cutting-edge artificial intelligence solutions to transform your business operations and drive innovation',
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: isMobile ? 14 : 18,
              color: AppColors.textSecondary,
              height: 1.5,
            ),
          ),
        ),

        const SizedBox(height: 32),

        /// Tags
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 12,
          runSpacing: 12,
          children: const [
            _TagChip(label: 'Machine Learning'),
            _TagChip(label: 'Deep Learning'),
            _TagChip(label: 'Neural Networks'),
            _TagChip(label: 'AI Automation'),
          ],
        ),
      ],
    ),
  ),
);

  }
}

class _TagChip extends StatelessWidget {
  final String label;

  const _TagChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.orange.withValues(alpha: 0.1),
        border: Border.all(color: AppColors.orange.withValues(alpha: 0.3)),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        label,
        style: GoogleFonts.inter(
          fontSize: 13,
          color: AppColors.orange,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _AISolutionsGrid extends StatelessWidget {
  final bool isMobile;

  final Function(String) onNavigate;

  const _AISolutionsGrid({required this.isMobile, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    final solutions = [
      {
        'icon': Bootstrap.cpu,
        'title': 'Machine Learning Models',
        'description':
            'Custom ML models trained on your data to solve complex business problems and automate decision-making processes.',
        'page': 'solution_ml_models',
        'capabilities': [
          'Predictive analytics',
          'Pattern recognition',
          'Anomaly detection',
          'Recommendation systems'
        ],
        // 'category': 'Core AI',
      },
      {
        'icon': Bootstrap.messenger,
        'title': 'Natural Language Processing',
        'description':
            'Advanced NLP solutions for text analysis, sentiment detection, and conversational AI applications.',
        'page': 'solution_nlp',
        'capabilities': [
          'Sentiment analysis',
          'Text classification',
          'Entity extraction',
          'Language translation'
        ],
        // 'category': 'Language AI',
      },
      {
        'icon': Bootstrap.eye,
        'title': 'Computer Vision',
        'description':
            'Image and video analysis solutions for object detection, facial recognition, and visual inspection.',
        'page': 'solution_computer_vision',
        'capabilities': [
          'Object detection',
          'Image classification',
          'Facial recognition',
          'Quality inspection'
        ],
        // 'category': 'Vision AI',
      },
      {
        'icon': Bootstrap.bar_chart,
        'title': 'Predictive Analytics',
        'description':
            'Harness the power of AI to forecast trends, optimize operations, and make data-driven decisions.',
        'page': 'solution_predictive_analytics',
        'capabilities': [
          'Demand forecasting',
          'Risk assessment',
          'Customer churn prediction',
          'Price optimization'
        ],
        // 'category': 'Analytics',
      },
      {
        'icon': Bootstrap.file_text,
        'title': 'Document Intelligence',
        'description':
            'Automate document processing with AI-powered extraction, classification, and analysis.',
        'page': 'solution_document_intelligence',
        'capabilities': [
          'Document classification',
          'Data extraction',
          'Form processing',
          'Invoice automation'
        ],
        // 'category': 'Automation',
      },
      {
        'icon': Bootstrap.headphones,
        'title': 'Voice AI Solutions',
        'description':
            'Speech recognition and synthesis for voice assistants, transcription, and audio analysis.',
        'page': 'solution_voice_ai',
        'capabilities': [
          'Speech-to-text',
          'Text-to-speech',
          'Voice recognition',
          'Audio analysis'
        ],
        // 'category': 'Voice AI',
      },
      

    ];

    return Container(
      color: AppColors.darkBg,
      child: Padding(
        padding: EdgeInsets.all(isMobile ? 16 : 48),
        child: GridView.builder(
  shrinkWrap: true,
  physics: const NeverScrollableScrollPhysics(),
  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
    maxCrossAxisExtent: isMobile ? 600 : 520,
    mainAxisSpacing: 24,
    crossAxisSpacing: 24,
    mainAxisExtent: isMobile ? null : 310, // 🔑 controls height
  ),
  itemCount: solutions.length,
  itemBuilder: (context, index) {
    final solution = solutions[index];
    return _AISolutionCard(
      icon: solution['icon'] as IconData,
      title: solution['title'] as String,
      description: solution['description'] as String,
      capabilities: solution['capabilities'] as List<String>,
      onTap: () => onNavigate(solution['page'] as String),
      // category: solution['category'] as String,
    );
  },
),
      ),
    );
  }
}

class _AISolutionCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String description;
  final List<String> capabilities;
  final VoidCallback onTap;
  // final String category;

  const _AISolutionCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.capabilities,
    required this.onTap,
    // required this.category,
  });

  @override
  State<_AISolutionCard> createState() => _AISolutionCardState();
}

class _AISolutionCardState extends State<_AISolutionCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: widget.onTap,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.darkBgSecondary,
              border: Border.all(
                color: _isHovered
                    ? AppColors.orange.withValues(alpha: 0.4)
                    : AppColors.orange.withValues(alpha: 0.2),
              ),
              borderRadius: BorderRadius.circular(12),
              boxShadow: _isHovered
                  ? [
                      BoxShadow(
                        color: AppColors.orange.withValues(alpha: 0.1),
                        blurRadius: 12,
                        spreadRadius: 0,
                      ),
                    ]
                  : [],
            ),
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: AppColors.orange.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        widget.icon,
                        color: AppColors.orange,
                        size: 28,
                      ),
                    ),
                    Container(
                      // decoration: BoxDecoration(
                      //   color: AppColors.darkBgTertiary,
                      //   border: Border.all(
                      //     color: AppColors.orange.withValues(alpha: 0.3),
                      //   ),
                      //   borderRadius: BorderRadius.circular(20),
                      // ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      // child: Text(
                      //   widget.category,
                      //   style: GoogleFonts.inter(
                      //     fontSize: 12,
                      //     color: AppColors.orange,
                      //     fontWeight: FontWeight.w500,
                      //   ),
                      // ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  widget.title,
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  widget.description,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: AppColors.textTertiary,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Key Capabilities:',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: AppColors.orange,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: widget.capabilities
                      .map((capability) => Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 4,
                                height: 4,
                                decoration: BoxDecoration(
                                  color: AppColors.orange,
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                capability,
                                style: GoogleFonts.inter(
                                  fontSize: 12,
                                  color: AppColors.textSecondary,
                                ),
                              ),
                            ],
                          ))
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ProcessSection extends StatelessWidget {
  final bool isMobile;

  const _ProcessSection({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    final steps = [
      {'number': '1', 'title': 'Discovery', 'description': 'Understanding your business needs and AI opportunities'},
      {'number': '2', 'title': 'Design', 'description': 'Architecting the optimal AI solution for your requirements'},
      {'number': '3', 'title': 'Development', 'description': 'Building and training AI models with your data'},
      {'number': '4', 'title': 'Deployment', 'description': 'Seamless integration and ongoing optimization'},
    ];

    return Container(
      color: AppColors.darkBgSecondary,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 16 :28,
          vertical: isMobile ? 40 : 30,
        ),
        child: Column(
          children: [
            Text(
              'Our AI Development Process',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: isMobile ? 24 : 34,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'A proven methodology to deliver successful AI implementations',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: isMobile ? 14 : 22,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 8),
            GridView.count(
              crossAxisCount: isMobile ? 1 : 4,
              shrinkWrap: true,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1,
              children: steps
                  .map((step) => _ProcessStep(
                        number: step['number']!,
                        title: step['title']!,
                        description: step['description']!,
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProcessStep extends StatelessWidget {
  final String number;
  final String title;
  final String description;

  const _ProcessStep({
    required this.number,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: AppColors.orange,
            borderRadius: BorderRadius.circular(28),
          ),
          child: Center(
            child: Text(
              number,
              style: GoogleFonts.inter(
                fontSize: 34,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          title,
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          description,
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            fontSize: 18,
            color: const Color.fromARGB(255, 19, 19, 20),
            // height: 1.4,
          ),
        ),
      ],
    );
  }
}

class _CTASection extends StatelessWidget {
  final bool isMobile;

  const _CTASection({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.darkBg,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 16 : 48,
          vertical: isMobile ? 40 : 80,
        ),
        child: Column(
          children: [
            Text(
              'Ready to Harness AI for Your Business?',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: isMobile ? 24 : 32,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "Let's discuss how our AI solutions can drive your business forward",
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: isMobile ? 14 : 18,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.orange,
              ),
              child: Text(
                'Schedule a Consultation',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
