import 'package:flutter/material.dart';

class AIServicesPage extends StatelessWidget {
  const AIServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E0E0E),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            SizedBox(height: 60),
            PageHeader(),
            SizedBox(height: 80),
            FeatureGrid(),
            SizedBox(height: 80),
            UseCaseSection(),
            SizedBox(height: 80),
            PricingPlans(),
            SizedBox(height: 80),
            TechStackSection(),
            SizedBox(height: 80),
            CTASection(),
            SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}

class PageHeader extends StatelessWidget {
  const PageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text(
          "Enterprise AI Services",
          style: TextStyle(fontSize: 46, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        Text(
          "Production-ready AI solutions powered by modern LLMs, automation pipelines and advanced analytics.",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white70, fontSize: 18),
        ),
      ],
    );
  }
}

class FeatureGrid extends StatelessWidget {
  const FeatureGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final features = [
      {
        "title": "LLM Integration",
        "desc":
            "Custom GPT & Claude integrations with enterprise security and RAG pipelines.",
        "icon": Icons.psychology
      },
      {
        "title": "Predictive Analytics",
        "desc":
            "Forecast demand, churn, revenue & risk using time-series ML models.",
        "icon": Icons.analytics
      },
      {
        "title": "Computer Vision",
        "desc":
            "Image detection, OCR, surveillance intelligence & visual automation.",
        "icon": Icons.remove_red_eye
      },
      {
        "title": "AI Automation",
        "desc":
            "Workflow automation using AI agents, APIs and event driven triggers.",
        "icon": Icons.settings_suggest
      },
      {
        "title": "Conversational AI",
        "desc":
            "Enterprise chatbots, voice agents & customer support AI.",
        "icon": Icons.chat
      },
      {
        "title": "Document Intelligence",
        "desc":
            "Invoice parsing, contract analysis & enterprise document AI.",
        "icon": Icons.description
      },
    ];

    return Wrap(
      spacing: 30,
      runSpacing: 30,
      alignment: WrapAlignment.center,
      children: features.map((f) {
        return HoverCard(
          child: SizedBox(
            width: 300,
            child: Column(
              children: [
                Icon(f["icon"] as IconData,
                    size: 40, color: Colors.deepOrange),
                const SizedBox(height: 16),
                Text(f["title"] as String,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Text(
                  f["desc"] as String,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

class UseCaseSection extends StatelessWidget {
  const UseCaseSection({super.key});

  @override
  Widget build(BuildContext context) {
    final useCases = [
      "AI Customer Support Automation",
      "Fraud Detection Systems",
      "Healthcare Data Intelligence",
      "Retail Demand Forecasting",
      "AI Code Assistants",
      "Financial Risk Modeling",
    ];

    return Column(
      children: [
        const Text(
          "Real Industry Use Cases",
          style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 30),
        Wrap(
          spacing: 20,
          runSpacing: 20,
          children: useCases
              .map((e) => Chip(
                    backgroundColor: Colors.deepOrange,
                    label: Text(e),
                  ))
              .toList(),
        ),
      ],
    );
  }
}

class PricingPlans extends StatelessWidget {
  const PricingPlans({super.key});

  @override
  Widget build(BuildContext context) {
    final plans = [
      {"name": "Starter", "price": "₹9,999/mo"},
      {"name": "Growth", "price": "₹29,999/mo"},
      {"name": "Enterprise", "price": "Custom Pricing"},
    ];

    return Column(
      children: [
        const Text("Service Plans",
            style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold)),
        const SizedBox(height: 40),
        Wrap(
          spacing: 30,
          runSpacing: 30,
          children: plans.map((p) {
            return HoverCard(
              child: SizedBox(
                width: 260,
                child: Column(
                  children: [
                    Text(p["name"]!,
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 16),
                    Text(p["price"]!,
                        style: const TextStyle(
                            fontSize: 26, color: Colors.deepOrange)),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class TechStackSection extends StatelessWidget {
  const TechStackSection({super.key});

  @override
  Widget build(BuildContext context) {
    const stack = [
      "OpenAI GPT-4/5 APIs",
      "LangChain & LlamaIndex",
      "Python FastAPI",
      "Node.js Microservices",
      "TensorFlow & PyTorch",
      "MongoDB / PostgreSQL",
      "AWS / GCP Deployment",
      "Docker & Kubernetes"
    ];

    return Column(
      children: [
        const Text("Technology Stack",
            style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold)),
        const SizedBox(height: 30),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: stack
              .map((e) => Chip(
                    backgroundColor: const Color(0xFF1E1E1E),
                    label: Text(e),
                  ))
              .toList(),
        ),
      ],
    );
  }
}

class CTASection extends StatelessWidget {
  const CTASection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Start Building AI Today",
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {},
          child: const Text("Book a Free Consultation"),
        ),
      ],
    );
  }
}

class HoverCard extends StatefulWidget {
  final Widget child;
  const HoverCard({super.key, required this.child});

  @override
  State<HoverCard> createState() => _HoverCardState();
}

class _HoverCardState extends State<HoverCard> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hover = true),
      onExit: (_) => setState(() => hover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.translationValues(0, hover ? -8 : 0, 0),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(18),
          boxShadow: hover
              ? [
                  BoxShadow(
                    color: Colors.deepOrange.withOpacity(0.3),
                    blurRadius: 20,
                  )
                ]
              : [],
        ),
        child: widget.child,
      ),
    );
  }
}
