part of '../../main.dart';

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
              const SizedBox(height: 16),
              _VirtualClassroomCard(),
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

// ─── Virtual Classroom Card ─────────────────────────────────────────────
class _VirtualClassroomCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (_) => const VirtualClassroomPage(),
            ),
          );
        },
        borderRadius: BorderRadius.circular(24),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF082418), Color(0xFF0E5A38), Color(0xFF1B7A4B)],
            ),
            borderRadius: BorderRadius.circular(24),
            boxShadow: const [
              BoxShadow(
                color: Color(0x400E5A38),
                blurRadius: 20,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(
                  Icons.class_outlined,
                  color: Colors.white,
                  size: 28,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Aula Virtual',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Accede a tus clases virtuales',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 13,
                        color: Colors.white.withValues(alpha: 0.8),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
