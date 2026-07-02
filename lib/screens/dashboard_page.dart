part of '../main.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _activeTab = 0;

  static const _tabs = ['General', 'Académico', 'Pagos', 'Trámites'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _TopAppBar(),
        const SizedBox(height: 4),
        _PillTabBar(
          tabs: _tabs,
          activeIndex: _activeTab,
          onTabSelected: (i) => setState(() => _activeTab = i),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 118),
            children: [
              const _DarkDashboardCard(),
              const SizedBox(height: 24),
              _QuickAccessSection(
                features: QuickFeature.values,
                onTap: (feature) => _openFeature(context, feature),
              ),
              const SizedBox(height: 24),
              const SectionTitle(title: 'Balance e historial'),
              const SizedBox(height: 12),
              const _BalanceOverviewCard(),
              const SizedBox(height: 24),
              const SectionTitle(title: 'Noticias y calendario'),
              const SizedBox(height: 12),
              const _NewsRail(),
              const SizedBox(height: 12),
              const _AcademicCalendarCard(),
              const SizedBox(height: 24),
              const SectionTitle(title: 'Soporte y campus'),
              const SizedBox(height: 12),
              const _CampusSupportRow(),
            ],
          ),
        ),
      ],
    );
  }
}
