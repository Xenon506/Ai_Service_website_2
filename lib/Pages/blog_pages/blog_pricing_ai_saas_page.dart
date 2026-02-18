import 'package:flutter/material.dart';

import 'blog_detail_page.dart';

class BlogPricingAiSaasPage extends StatelessWidget {
  final Function(String) onNavigate;

  const BlogPricingAiSaasPage({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return BlogDetailPage(
      onNavigate: onNavigate,
      category: 'SaaS',
      title: 'Pricing AI Features in B2B SaaS',
      readTime: '5 min read',
      description:
          'Frameworks for deciding how to package, price, and position AI-powered features in subscription products.',
      sections: const [
        'We discuss common pricing models for AI capabilities: usage-based, seat-based, tiered, and value-based hybrids.',
        'You will see examples of how leading SaaS vendors expose AI add-ons while keeping pricing understandable to buyers.',
        'The article includes questions to validate whether AI features deserve separate pricing or should be included in core plans.',
        'We close with practical experiments you can run to test willingness to pay without disrupting your existing customers.',
      ],
    );
  }
}

