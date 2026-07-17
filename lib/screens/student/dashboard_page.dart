part of '../../main.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _TopAppBar(),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 118),
            children: [
              const _DashboardSummary(),
              const _DashboardSummaryRow(),
              const _NextDeliveryCard(),
              const _FeatureNavigation(),
              const _PinnedCardsSection(),
            ],
          ),
        ),
      ],
    );
  }
}

