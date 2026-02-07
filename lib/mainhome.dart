import 'package:flutter/material.dart';

class Mainhome extends StatefulWidget {
  const Mainhome({super.key});

  @override
  State<Mainhome> createState() => MainhomeState();
}

class MainhomeState extends State<Mainhome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const MainNavBar(),
            const HeroSection(),
            const MetricsSection(),
            const ServicesSection(),
            const BenefitsSection(),
            const PricingSection(),
            const AboutUsSection(),
            const FooterSection(),
          ],
        ),
      ),
      );
  }
}
class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
      builder: (context, isMobile, isTablet) {
        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 20 : 80,
            vertical: isMobile ? 60 : 120,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "AI That Powers\nYour Business",
                style: TextStyle(
                  fontSize: isMobile ? 32 : 52,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Automate workflows, analyze data and scale faster.",
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
                ),
                onPressed: () {},
                child: const Text("Get Started"),
              ),
              SizedBox(
                height: 340,
              )
            ],
          ),
        );
      },
    );
  }
}


class MetricsSection extends StatelessWidget {
  const MetricsSection({super.key});

  Widget metric(String value, String label) {
    return Column(
      children: [
        Text(value,
            style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange)),
        const SizedBox(height: 10),
        Text(label),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Responsive(
      builder: (context, isMobile, isTablet) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 80),
          child: Wrap(
            spacing: 80,
            runSpacing: 30,
            alignment: WrapAlignment.center,
            children: [
              metric("99%", "Accuracy"),
              metric("24/7", "Availability"),
              metric("10x", "Faster Results"),
            ],
          ),
        );
      },
    );
  }
}

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  Widget card(IconData icon, String title, String desc) {
    return HoverCard(
      child: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 40, color: Colors.deepOrange),
            const SizedBox(height: 16),
            Text(title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text(desc, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Responsive(
      builder: (context, isMobile, isTablet) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 100),
          child: Column(
            children: [
              const Text("Our Services",
                  style: TextStyle(
                      fontSize: 34, fontWeight: FontWeight.bold)),
              const SizedBox(height: 50),
              Wrap(
                spacing: 30,
                runSpacing: 30,
                alignment: WrapAlignment.center,
                children: [
                  SizedBox(width: 280, child: card(Icons.analytics, "AI Analytics", "Turn data into insights")),
                  SizedBox(width: 280, child: card(Icons.chat, "Chatbots", "Smart conversational AI")),
                  SizedBox(width: 280, child: card(Icons.settings, "Automation", "Optimize operations")),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}



class BenefitsSection extends StatelessWidget {
  const BenefitsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80),
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFFFE0C3),
            Color(0xFFFFF3E8),
          ],
        ),
      ),
      child: Column(
        children: const [
          Text(
            "Why Choose Us?",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 24),
          Text("• Secure & Reliable\n• Scalable AI\n• Easy Integration",
              textAlign: TextAlign.center, style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}

class PricingSection extends StatelessWidget {
  const PricingSection({super.key});

  Widget priceCard(String plan, String price) {
    return Container(
      padding: const EdgeInsets.all(32),
      width: 260,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.orangeAccent),
      ),
      child: Column(
        children: [
          Text(plan, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Text(price, style: const TextStyle(fontSize: 32, color: Colors.deepOrange)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 80),
      child: Column(
        children: [
          const Text(
            "Pricing",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              priceCard("Starter", "\$19/mo"),
              priceCard("Pro", "\$49/mo"),
              priceCard("Enterprise", "Custom"),
            ],
          ),
        ],
      ),
    );
  }
}

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      color: Colors.deepOrange,
      width: double.infinity,
      child: const Center(
        child: Text(
          "© 2026 AI Service. All rights reserved.",
          style: TextStyle(color: Colors.white70),
        ),
      ),
    );
  }
}


class MainNavBar extends StatelessWidget {
  const MainNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFFF7A18),
            Color(0xFFFFA24C),
          ],
        ),
      ),
      child: Row(
        children: [
          const Text(
            "AI Service",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const Spacer(),

          NavDropdownButton(
            title: "Home",
            items: const ["Hero", "Metrics", "Benefits"],
            onItemSelected: (value) {},
          ),

          NavDropdownButton(
            title: "Services",
            items: const ["AI Analytics", "Chatbots", "Automation"],
            onItemSelected: (value) {},
          ),

          NavDropdownButton(
            title: "Pricing",
            items: const ["Starter", "Pro", "Enterprise"],
            onItemSelected: (value) {},
          ),

          NavDropdownButton(
            title: "About Us",
            items: const ["Company", "Team", "Careers"],
            onItemSelected: (value) {},
          ),

          NavDropdownButton(
            title: "Contact",
            items: const ["Email", "Support", "Book a Demo"],
            onItemSelected: (value) {},
          ),
        ],
      ),
    );
  }
}

class NavDropdownButton extends StatefulWidget {
  final String title;
  final List<String> items;
  final Function(String) onItemSelected;

  const NavDropdownButton({
    super.key,
    required this.title,
    required this.items,
    required this.onItemSelected,
  });

  @override
  State<NavDropdownButton> createState() => _NavDropdownButtonState();
}

class _NavDropdownButtonState extends State<NavDropdownButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: Stack(
        clipBehavior: Clip.none, // 🔥 REQUIRED FOR DROPDOWNS
        alignment: Alignment.topCenter,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.deepOrange,
                elevation: isHovered ? 8 : 2,
              ),
              onPressed: () {},
              child: Text(widget.title),
            ),
          ),
          if (isHovered)
            Positioned(
              top: 48,
              child: Material(
                elevation: 8,
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  width: 180,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: widget.items.map((item) {
                      return InkWell(
                        onTap: () {
                          widget.onItemSelected(item);
                          setState(() => isHovered = false);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 16,
                          ),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(item),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}


class AboutUsSection extends StatelessWidget {
  const AboutUsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "About Us",
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 24),
          Text(
            "We are an AI-driven company focused on building intelligent, scalable, "
            "and secure solutions for modern businesses.\n\n"
            "Our mission is to simplify complex workflows using cutting-edge AI, "
            "helping teams move faster and smarter.",
            style: TextStyle(fontSize: 18, height: 1.6),
          ),
        ],
      ),
    );
  }
}


class Responsive extends StatelessWidget {
  final Widget Function(BuildContext, bool isMobile, bool isTablet) builder;

  const Responsive({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    bool isMobile = width < 700;
    bool isTablet = width >= 700 && width < 1100;

    return builder(context, isMobile, isTablet);
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
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(18),
          boxShadow: hover
              ? [
                  BoxShadow(
                    color: Colors.deepOrange.withOpacity(0.3),
                    blurRadius: 25,
                  )
                ]
              : [],
        ),
        child: widget.child,
      ),
    );
  }
}
