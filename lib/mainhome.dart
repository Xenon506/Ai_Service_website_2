import 'package:flutter/material.dart';

class Mainhome extends StatefulWidget {
  const Mainhome({super.key});

  @override
  State<Mainhome> createState() => _MainhomeState();
}

class _MainhomeState extends State<Mainhome> {
  final ScrollController scrollController = ScrollController();

  final heroKey = GlobalKey();
  final servicesKey = GlobalKey();
  final pricingKey = GlobalKey();
  final aboutKey = GlobalKey();

  void scrollTo(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                Section(key: heroKey, child: const HeroSection()),
                const MetricsSection(),
                Section(key: servicesKey, child: const ServicesSection()),
                Section(key: pricingKey, child: const PricingSection()),
                Section(key: aboutKey, child: const AboutUsSection()),
                const FooterSection(),
              ],
            ),
          ),
          Navbar(
            onHero: () => scrollTo(heroKey),
            onServices: () => scrollTo(servicesKey),
            onPricing: () => scrollTo(pricingKey),
            onAbout: () => scrollTo(aboutKey),
          ),
        ],
      ),
    );
  }
}

class Section extends StatelessWidget {
  final Widget child;

  const Section({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 24),
      width: double.infinity,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1300),
          child: child,
        ),
      ),
    );
  }
}

class Navbar extends StatelessWidget {
  final VoidCallback onHero;
  final VoidCallback onServices;
  final VoidCallback onPricing;
  final VoidCallback onAbout;

  const Navbar({
    super.key,
    required this.onHero,
    required this.onServices,
    required this.onPricing,
    required this.onAbout,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 40),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.7),
          border: const Border(
            bottom: BorderSide(color: Colors.white12),
          ),
        ),
        child: Row(
          children: [
            const Text(
              "AI SaaS",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            NavButton("Home", onHero),
            NavButton("Services", onServices),
            NavButton("Pricing", onPricing),
            NavButton("About", onAbout),
          ],
        ),
      ),
    );
  }
}

class NavButton extends StatefulWidget {
  final String title;
  final VoidCallback onTap;

  const NavButton(this.title, this.onTap, {super.key});

  @override
  State<NavButton> createState() => _NavButtonState();
}

class _NavButtonState extends State<NavButton> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hover = true),
      onExit: (_) => setState(() => hover = false),
      child: TextButton(
        onPressed: widget.onTap,
        child: Text(
          widget.title,
          style: TextStyle(
            color: hover ? Colors.deepOrange : Colors.white,
          ),
        ),
      ),
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
        transform: Matrix4.translationValues(0, hover ? -10 : 0, 0),
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(20),
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

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 80),
        const Text(
          "Build AI Products\n10x Faster",
          style: TextStyle(fontSize: 54, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        const Text(
          "Modern AI infrastructure for startups and enterprises.",
          style: TextStyle(fontSize: 18, color: Colors.white70),
        ),
        const SizedBox(height: 30),
        ElevatedButton(
          onPressed: () {},
          child: const Text("Get Started"),
        ),
      ],
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
                color: Colors.deepOrange,
                fontWeight: FontWeight.bold)),
        Text(label),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Section(
      child: Wrap(
        spacing: 80,
        runSpacing: 30,
        alignment: WrapAlignment.center,
        children: [
          metric("99%", "Accuracy"),
          metric("24/7", "Uptime"),
          metric("10x", "Performance"),
        ],
      ),
    );
  }
}

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Services",
            style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold)),
        const SizedBox(height: 50),
        Wrap(
          spacing: 30,
          runSpacing: 30,
          children: const [
            HoverCard(child: Text("AI Analytics")),
            HoverCard(child: Text("AI Chatbots")),
            HoverCard(child: Text("Automation")),
          ],
        )
      ],
    );
  }
}

class PricingSection extends StatelessWidget {
  const PricingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Pricing",
            style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold)),
        const SizedBox(height: 50),
        Wrap(
          spacing: 30,
          children: const [
            HoverCard(child: Text("Starter \$19")),
            HoverCard(child: Text("Pro \$49")),
            HoverCard(child: Text("Enterprise")),
          ],
        )
      ],
    );
  }
}

class AboutUsSection extends StatelessWidget {
  const AboutUsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      "We build modern AI solutions for next-gen businesses.",
      style: TextStyle(fontSize: 20),
    );
  }
}

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      child: const Center(
        child: Text("© 2026 AI SaaS"),
      ),
    );
  }
}
