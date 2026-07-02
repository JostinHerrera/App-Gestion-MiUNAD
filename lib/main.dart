import 'dart:ui';
import 'package:flutter/material.dart';
import 'theme.dart';

part 'screens/dashboard_page.dart';
part 'screens/academic_page.dart';
part 'screens/payments_page.dart';
part 'screens/notifications_page.dart';
part 'screens/profile_page.dart';
part 'screens/feature_detail_page.dart';

void main() {
  runApp(const MiUnadApp());
}

class MiUnadApp extends StatelessWidget {
  const MiUnadApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mi UNAD',
      theme: MiUnadTheme.lightTheme,
      home: const AppShell(),
    );
  }
}

enum AppSection { home, academic, payments, notifications, profile }

enum QuickFeature {
  tuition,
  credits,
  services,
  balance,
  accountStatement,
  subjectSelection,
  schedule,
  academicRecord,
  academicScore,
  pensum,
  news,
  academicCalendar,
  virtualLibrary,
  campusVirtual,
  support,
}

extension QuickFeatureX on QuickFeature {
  String get title {
    switch (this) {
      case QuickFeature.tuition:
        return 'Pago de matrícula';
      case QuickFeature.credits:
        return 'Pago de créditos';
      case QuickFeature.services:
        return 'Pago de servicios';
      case QuickFeature.balance:
        return 'Balance actual';
      case QuickFeature.accountStatement:
        return 'Estado de cuenta';
      case QuickFeature.subjectSelection:
        return 'Selección de materias';
      case QuickFeature.schedule:
        return 'Horario';
      case QuickFeature.academicRecord:
        return 'Record académico';
      case QuickFeature.academicScore:
        return 'Score académico';
      case QuickFeature.pensum:
        return 'Pensum';
      case QuickFeature.news:
        return 'Noticias';
      case QuickFeature.academicCalendar:
        return 'Calendario académico';
      case QuickFeature.virtualLibrary:
        return 'Biblioteca Virtual';
      case QuickFeature.campusVirtual:
        return 'Campus Virtual';
      case QuickFeature.support:
        return 'Soporte';
    }
  }

  IconData get icon {
    switch (this) {
      case QuickFeature.tuition:
        return Icons.school_outlined;
      case QuickFeature.credits:
        return Icons.payments_outlined;
      case QuickFeature.services:
        return Icons.receipt_long_outlined;
      case QuickFeature.balance:
        return Icons.account_balance_wallet_outlined;
      case QuickFeature.accountStatement:
        return Icons.description_outlined;
      case QuickFeature.subjectSelection:
        return Icons.event_note_outlined;
      case QuickFeature.schedule:
        return Icons.calendar_month_outlined;
      case QuickFeature.academicRecord:
        return Icons.fact_check_outlined;
      case QuickFeature.academicScore:
        return Icons.emoji_events_outlined;
      case QuickFeature.pensum:
        return Icons.map_outlined;
      case QuickFeature.news:
        return Icons.campaign_outlined;
      case QuickFeature.academicCalendar:
        return Icons.event_available_outlined;
      case QuickFeature.virtualLibrary:
        return Icons.local_library_outlined;
      case QuickFeature.campusVirtual:
        return Icons.workspace_premium_outlined;
      case QuickFeature.support:
        return Icons.headset_mic_outlined;
    }
  }

  Color get color {
    switch (this) {
      case QuickFeature.tuition:
      case QuickFeature.balance:
        return const Color(0xFF0E5A38);
      case QuickFeature.credits:
      case QuickFeature.subjectSelection:
        return const Color(0xFF1B7A4B);
      case QuickFeature.services:
      case QuickFeature.accountStatement:
        return const Color(0xFF164D64);
      case QuickFeature.schedule:
      case QuickFeature.academicCalendar:
        return const Color(0xFF4D6B2F);
      case QuickFeature.academicRecord:
      case QuickFeature.academicScore:
        return const Color(0xFF2458A6);
      case QuickFeature.pensum:
      case QuickFeature.virtualLibrary:
        return const Color(0xFF6A4B1C);
      case QuickFeature.news:
      case QuickFeature.campusVirtual:
        return const Color(0xFF7E5B1A);
      case QuickFeature.support:
        return const Color(0xFF7A3E1C);
    }
  }

  Color get tint => color.withValues(alpha: 0.12);
}

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int _index = 0;

  final _pages = const <Widget>[
    DashboardPage(),
    AcademicPage(),
    PaymentsPage(),
    NotificationsPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          const _DashboardBackground(),
          Positioned.fill(
            child: SafeArea(
              bottom: false,
              child: IndexedStack(
                index: _index,
                children: _pages,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(28),
          child: NavigationBar(
            selectedIndex: _index,
            backgroundColor: const Color(0xFFF9F8F5).withValues(alpha: 0.96),
            elevation: 0,
            onDestinationSelected: (value) => setState(() => _index = value),
            destinations: const [
              NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Inicio'),
              NavigationDestination(icon: Icon(Icons.menu_book_outlined), selectedIcon: Icon(Icons.menu_book), label: 'Académico'),
              NavigationDestination(icon: Icon(Icons.payments_outlined), selectedIcon: Icon(Icons.payments), label: 'Pagos'),
              NavigationDestination(icon: Icon(Icons.notifications_none_outlined), selectedIcon: Icon(Icons.notifications), label: 'Notificaciones'),
              NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: 'Perfil'),
            ],
          ),
        ),
      ),
    );
  }
}

class _DashboardBackground extends StatelessWidget {
  const _DashboardBackground();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFF4F1EB), Color(0xFFF8F7F4), Color(0xFFE9EFE7)],
          stops: [0.0, 0.55, 1.0],
        ),
      ),
      child: CustomPaint(
        painter: _WavesPainter(),
        size: Size.infinite,
      ),
    );
  }
}

class _WavesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.05
      ..color = const Color(0xFFC9D0C7).withValues(alpha: 0.44);

    for (final factor in [0.12, 0.32, 0.55, 0.77]) {
      canvas.drawPath(_wavePath(size, factor), paint);
    }
  }

  Path _wavePath(Size size, double yFactor) {
    final path = Path();
    final startY = size.height * yFactor;
    path.moveTo(-size.width * 0.1, startY);
    for (double x = -size.width * 0.1; x <= size.width * 1.2; x += size.width * 0.23) {
      path.cubicTo(
        x + size.width * 0.08,
        startY - 24,
        x + size.width * 0.16,
        startY + 24,
        x + size.width * 0.24,
        startY,
      );
    }
    return path;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// ─── Top App Bar ──────────────────────────────────────────────────────────────
class _TopAppBar extends StatelessWidget {
  const _TopAppBar();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu_rounded),
            color: const Color(0xFF173726),
            iconSize: 26,
          ),
          const Spacer(),
          RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: 'MiUNAD',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF0E5A38),
                    letterSpacing: -0.5,
                  ),
                ),
                TextSpan(
                  text: '.',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 26,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF4ADE80),
                    letterSpacing: -0.5,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search_rounded),
            color: const Color(0xFF173726),
            iconSize: 26,
          ),
        ],
      ),
    );
  }
}

// ─── Pill Tab Bar ─────────────────────────────────────────────────────────────
class _PillTabBar extends StatelessWidget {
  const _PillTabBar({
    required this.tabs,
    required this.activeIndex,
    required this.onTabSelected,
  });

  final List<String> tabs;
  final int activeIndex;
  final ValueChanged<int> onTabSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: tabs.length,
        separatorBuilder: (_, _) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final isActive = index == activeIndex;
          return GestureDetector(
            onTap: () => onTabSelected(index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 220),
              curve: Curves.easeOutCubic,
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
              decoration: BoxDecoration(
                color: isActive ? const Color(0xFF082418) : Colors.transparent,
                borderRadius: BorderRadius.circular(999),
                border: Border.all(
                  color: isActive ? Colors.transparent : const Color(0xFFD4DDD6),
                  width: 1.2,
                ),
              ),
              child: Text(
                tabs[index],
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
                  color: isActive ? Colors.white : const Color(0xFF62716A),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// ─── Dark Dashboard Card ──────────────────────────────────────────────────────
class _DarkDashboardCard extends StatelessWidget {
  const _DarkDashboardCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF082418),
        borderRadius: BorderRadius.circular(28),
        boxShadow: const [
          BoxShadow(
            color: Color(0x400E5A38),
            blurRadius: 40,
            offset: Offset(0, 16),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header row
          Row(
            children: [
              const Text(
                'Tu Dashboard',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF6FCF97),
                  letterSpacing: 0.2,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.10),
                  borderRadius: BorderRadius.circular(999),
                  border: Border.all(color: Colors.white.withValues(alpha: 0.15)),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.circle, size: 7, color: Color(0xFF4ADE80)),
                    SizedBox(width: 5),
                    Text(
                      'Activo',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Balance label
          const Text(
            'Balance Pendiente',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 13,
              color: Color(0xFF9DB4A4),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 6),
          // Balance value
          const Text(
            'RD\$ 12,450',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 36,
              fontWeight: FontWeight.w900,
              color: Color(0xFF4ADE80),
              letterSpacing: -1.0,
            ),
          ),
          const SizedBox(height: 22),
          // Stats row
          Row(
            children: [
              _DarkStat(label: 'Índice', value: '3.72'),
              Container(
                width: 1,
                height: 36,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                color: Colors.white.withValues(alpha: 0.10),
              ),
              _DarkStat(label: 'Cuatrimestre', value: '6'),
              Container(
                width: 1,
                height: 36,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                color: Colors.white.withValues(alpha: 0.10),
              ),
              _DarkStat(label: 'Créditos', value: '72'),
            ],
          ),
          const SizedBox(height: 22),
          // Action buttons
          Row(
            children: [
              Expanded(child: _DarkActionButton(label: 'Pagar', icon: Icons.payments_outlined)),
              const SizedBox(width: 10),
              Expanded(child: _DarkActionButton(label: 'Historial', icon: Icons.receipt_long_outlined)),
              const SizedBox(width: 10),
              Expanded(child: _DarkActionButton(label: 'Perfil', icon: Icons.person_outline_rounded)),
            ],
          ),
        ],
      ),
    );
  }
}

class _DarkStat extends StatelessWidget {
  const _DarkStat({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'Inter',
            fontSize: 11,
            color: Color(0xFF9DB4A4),
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: const TextStyle(
            fontFamily: 'Inter',
            fontSize: 20,
            fontWeight: FontWeight.w800,
            color: Colors.white,
            letterSpacing: -0.5,
          ),
        ),
      ],
    );
  }
}

class _DarkActionButton extends StatelessWidget {
  const _DarkActionButton({required this.label, required this.icon});

  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white.withValues(alpha: 0.08),
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(14),
        splashColor: Colors.white.withValues(alpha: 0.08),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: Colors.white.withValues(alpha: 0.10)),
          ),
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: Colors.white, size: 20),
              const SizedBox(height: 4),
              Text(
                label,
                style: const TextStyle(
                  fontFamily: 'Inter',
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Quick Access Section ─────────────────────────────────────────────────────
class _QuickAccessSection extends StatelessWidget {
  const _QuickAccessSection({
    required this.features,
    required this.onTap,
  });

  final List<QuickFeature> features;
  final ValueChanged<QuickFeature> onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              'Accesos rápidos',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: Color(0xFF173726),
              ),
            ),
            const Spacer(),
            _ViewAllButton(onTap: () {}),
          ],
        ),
        const SizedBox(height: 14),
        _FeatureGrid(features: features, onTap: onTap),
      ],
    );
  }
}

class _ViewAllButton extends StatelessWidget {
  const _ViewAllButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: const Color(0xFFD4EEE0),
          borderRadius: BorderRadius.circular(999),
        ),
        child: const Text(
          'Ver Todos',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: Color(0xFF0E5A38),
          ),
        ),
      ),
    );
  }
}

// ─── Legacy Avatar (kept for profile page) ────────────────────────────────────
class _ProfileAvatar extends StatelessWidget {
  const _ProfileAvatar({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 72,
        height: 72,
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: const LinearGradient(colors: [Color(0xFFF6F2E8), Color(0xFFBFE7C9)]),
          boxShadow: const [
            BoxShadow(color: Color(0x33000000), blurRadius: 16, offset: Offset(0, 8)),
          ],
        ),
        child: const CircleAvatar(
          backgroundColor: Color(0xFFF7F3EC),
          child: Text(
            'B',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800, color: Color(0xFF0E5A38)),
          ),
        ),
      ),
    );
  }
}

class _StudentSummaryCard extends StatelessWidget {
  const _StudentSummaryCard();

  @override
  Widget build(BuildContext context) {
    return _GlassCard(
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Expanded(
                child: Text(
                  'Resumen del estudiante',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Color(0xFF173726)),
                ),
              ),
              _StatusPill(label: 'Activo', color: Color(0xFF1B7A4B), background: Color(0xFFE7F5EC)),
            ],
          ),
          const SizedBox(height: 16),
          LayoutBuilder(
            builder: (context, constraints) {
              final cardWidth = constraints.maxWidth > 640 ? (constraints.maxWidth - 12) / 2 : constraints.maxWidth;
              return Wrap(
                spacing: 12,
                runSpacing: 12,
                children: const [
                  _MiniStat(label: 'Carrera', value: 'Lic. en Administración', icon: Icons.apartment_outlined),
                  _MiniStat(label: 'Balance pendiente', value: 'RD\$ 12,450', icon: Icons.payments_outlined),
                  _MiniStat(label: 'Índice acumulado', value: '3.72', icon: Icons.trending_up_outlined),
                  _MiniStat(label: 'Cuatrimestre actual', value: '6', icon: Icons.school_outlined),
                ].map((item) => SizedBox(width: cardWidth, child: item)).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _FeatureGrid extends StatelessWidget {
  const _FeatureGrid({required this.features, required this.onTap});

  final List<QuickFeature> features;
  final ValueChanged<QuickFeature> onTap;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = constraints.maxWidth >= 1100
            ? 5
            : constraints.maxWidth >= 900
                ? 4
                : constraints.maxWidth >= 640
                    ? 3
                    : 2;

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: features.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1.15,
          ),
          itemBuilder: (context, index) {
            final feature = features[index];
            return _FeatureCard(feature: feature, onTap: () => onTap(feature));
          },
        );
      },
    );
  }
}

class _FeatureCard extends StatelessWidget {
  const _FeatureCard({required this.feature, required this.onTap});

  final QuickFeature feature;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final badge = _featureBadge(feature);
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(22),
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(color: Color(0x10000000), blurRadius: 12, offset: Offset(0, 4)),
            ],
            border: Border.all(color: const Color(0xFFF0F4F1), width: 1.2),
          ),
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon in a circular pale container
              Hero(
                tag: 'feature_icon_${feature.name}',
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: feature.tint,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(feature.icon, color: feature.color, size: 22),
                ),
              ),
              const Spacer(),
              Text(
                feature.title,
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF182A21),
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 5),
              // Status badge replacing subtitle
              Row(
                children: [
                  Icon(
                    badge.$3,
                    size: 11,
                    color: badge.$2,
                  ),
                  const SizedBox(width: 4),
                  Flexible(
                    child: Text(
                      badge.$1,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: badge.$2,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Returns (label, color, icon) for a feature badge
(String, Color, IconData) _featureBadge(QuickFeature feature) {
  switch (feature) {
    case QuickFeature.tuition:
      return ('Pendiente', const Color(0xFFD97706), Icons.warning_amber_rounded);
    case QuickFeature.credits:
      return ('Pendiente', const Color(0xFFD97706), Icons.warning_amber_rounded);
    case QuickFeature.balance:
      return ('Pendiente', const Color(0xFFD97706), Icons.warning_amber_rounded);
    case QuickFeature.services:
      return ('Al día', const Color(0xFF1B7A4B), Icons.check_circle_outline_rounded);
    case QuickFeature.accountStatement:
      return ('Ver movimientos', const Color(0xFF62716A), Icons.arrow_forward_ios_rounded);
    case QuickFeature.subjectSelection:
      return ('Al día', const Color(0xFF1B7A4B), Icons.check_circle_outline_rounded);
    case QuickFeature.schedule:
      return ('3 clases hoy', const Color(0xFF1B7A4B), Icons.check_circle_outline_rounded);
    case QuickFeature.academicRecord:
      return ('3.72 / 4.00', const Color(0xFF0E5A38), Icons.trending_up_rounded);
    case QuickFeature.academicScore:
      return ('82% avance', const Color(0xFF0E5A38), Icons.trending_up_rounded);
    case QuickFeature.pensum:
      return ('68% completo', const Color(0xFF0E5A38), Icons.trending_up_rounded);
    case QuickFeature.news:
      return ('2 nuevas', const Color(0xFF62716A), Icons.fiber_new_rounded);
    case QuickFeature.academicCalendar:
      return ('Inscripción: 1 ago', const Color(0xFF62716A), Icons.calendar_today_outlined);
    case QuickFeature.virtualLibrary:
      return ('Disponible', const Color(0xFF1B7A4B), Icons.check_circle_outline_rounded);
    case QuickFeature.campusVirtual:
      return ('4 plataformas', const Color(0xFF62716A), Icons.arrow_forward_ios_rounded);
    case QuickFeature.support:
      return ('En línea', const Color(0xFF1B7A4B), Icons.check_circle_outline_rounded);
  }
}

String _featureSubtitle(QuickFeature feature) {
  switch (feature) {
    case QuickFeature.tuition:
      return 'Cubre matrícula y genera comprobante.';
    case QuickFeature.credits:
      return 'Consulta créditos y estado de pago.';
    case QuickFeature.services:
      return 'Laboratorio, biblioteca y más.';
    case QuickFeature.balance:
      return 'Balance en verde o rojo según estado.';
    case QuickFeature.accountStatement:
      return 'Movimientos, filtros y exportación.';
    case QuickFeature.subjectSelection:
      return 'Calendario, choques y cupos disponibles.';
    case QuickFeature.schedule:
      return 'Vista semanal con aulas y profesores.';
    case QuickFeature.academicRecord:
      return 'Calificaciones, índices y PDF.';
    case QuickFeature.academicScore:
      return 'Progreso y gráficos de rendimiento.';
    case QuickFeature.pensum:
      return 'Mapa curricular por estado.';
    case QuickFeature.news:
      return 'Noticias institucionales y favoritos.';
    case QuickFeature.academicCalendar:
      return 'Inscripción, exámenes y feriados.';
    case QuickFeature.virtualLibrary:
      return 'Busca y guarda libros y PDF.';
    case QuickFeature.campusVirtual:
      return 'Moodle, Teams, Zoom y Classroom.';
    case QuickFeature.support:
      return 'Chat y seguimiento de casos.';
  }
}

class _GlassCard extends StatelessWidget {
  const _GlassCard({required this.child, this.padding = const EdgeInsets.all(16)});

  final Widget child;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: Colors.white.withValues(alpha: 0.65),
            boxShadow: const [
              BoxShadow(color: Color(0x1A000000), blurRadius: 24, offset: Offset(0, 12)),
            ],
            border: Border.all(color: Colors.white.withValues(alpha: 0.45), width: 1.2),
          ),
          child: child,
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle({super.key, required this.title, this.trailing});

  final String title;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Color(0xFF173726)),
        ),
        const Spacer(),
        ?trailing,
      ],
    );
  }
}

class _MiniStat extends StatelessWidget {
  const _MiniStat({required this.label, required this.value, required this.icon});

  final String label;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FBF8),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE2ECE4)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: const Color(0xFF0E5A38)),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: const TextStyle(fontSize: 12, color: Color(0xFF62716A))),
                const SizedBox(height: 4),
                Text(value, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Color(0xFF173726))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StatusPill extends StatelessWidget {
  const _StatusPill({required this.label, required this.color, required this.background});

  final String label;
  final Color color;
  final Color background;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(color: background, borderRadius: BorderRadius.circular(999)),
      child: Text(label, style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.w700)),
    );
  }
}

class _BalanceOverviewCard extends StatelessWidget {
  const _BalanceOverviewCard();

  @override
  Widget build(BuildContext context) {
    return _GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(child: Text('Balance actual', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Color(0xFF173726)))),
              _StatusPill(label: 'Al día', color: const Color(0xFF1B7A4B), background: const Color(0xFFE7F5EC)),
            ],
          ),
          const SizedBox(height: 10),
          const Text('RD\$ 0.00', style: TextStyle(fontSize: 34, fontWeight: FontWeight.w900, color: Color(0xFF0E5A38))),
          const SizedBox(height: 10),
          const SimpleLineChart(values: [0.2, 0.22, 0.19, 0.3, 0.28, 0.24, 0.12]),
          const SizedBox(height: 10),
          const Text('Historial de pagos de los últimos 6 períodos.', style: TextStyle(fontSize: 12, color: Color(0xFF62716A))),
        ],
      ),
    );
  }
}

class _NewsRail extends StatelessWidget {
  const _NewsRail();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        _NewsCard(
          title: 'Nueva convocatoria de becas',
          description: 'Abierta la solicitud para estudiantes de alto rendimiento con balance al día.',
          category: 'Académico',
          date: 'Hoy',
          accent: Color(0xFF0E5A38),
        ),
        SizedBox(height: 12),
        _NewsCard(
          title: 'Calendario de exámenes publicado',
          description: 'Consulta fechas por cuatrimestre y recordatorios del próximo período.',
          category: 'Eventos',
          date: 'Ayer',
          accent: Color(0xFF4D6B2F),
        ),
      ],
    );
  }
}

class _NewsCard extends StatelessWidget {
  const _NewsCard({required this.title, required this.description, required this.category, required this.date, required this.accent});

  final String title;
  final String description;
  final String category;
  final String date;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    return _GlassCard(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 92,
            height: 92,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              gradient: LinearGradient(colors: [accent.withValues(alpha: 0.9), accent.withValues(alpha: 0.55)]),
            ),
            child: const Icon(Icons.article_outlined, color: Colors.white, size: 36),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    _StatusPill(label: 'News', color: Colors.white, background: Colors.transparent),
                    const Spacer(),
                    Text(date, style: const TextStyle(fontSize: 12, color: Color(0xFF62716A))),
                  ],
                ),
                const SizedBox(height: 8),
                Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: Color(0xFF173726))),
                const SizedBox(height: 6),
                Text(description, style: const TextStyle(fontSize: 13, color: Color(0xFF62716A), height: 1.3)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AcademicCalendarCard extends StatelessWidget {
  const _AcademicCalendarCard();

  @override
  Widget build(BuildContext context) {
    return _GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Calendario académico', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Color(0xFF173726))),
          SizedBox(height: 12),
          _TimelineItem(title: 'Inscripción', subtitle: '1 - 5 de agosto', color: Color(0xFF0E5A38)),
          _TimelineItem(title: 'Retiros', subtitle: '10 - 12 de agosto', color: Color(0xFF4D6B2F)),
          _TimelineItem(title: 'Exámenes finales', subtitle: '28 - 31 de agosto', color: Color(0xFF164D64)),
        ],
      ),
    );
  }
}

class _TimelineItem extends StatelessWidget {
  const _TimelineItem({required this.title, required this.subtitle, required this.color});

  final String title;
  final String subtitle;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(width: 12, height: 12, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.w700, color: Color(0xFF173726))),
                const SizedBox(height: 2),
                Text(subtitle, style: const TextStyle(fontSize: 12, color: Color(0xFF62716A))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CampusSupportRow extends StatelessWidget {
  const _CampusSupportRow();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final childWidth = width > 620 ? (width - 12) / 2 : width;
        return Wrap(
          spacing: 12,
          runSpacing: 12,
          children: const [
            _CampusCard(),
            _SupportCard(),
          ].map((child) => SizedBox(width: childWidth, child: child)).toList(),
        );
      },
    );
  }
}

class _CampusCard extends StatelessWidget {
  const _CampusCard();

  @override
  Widget build(BuildContext context) {
    return _GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Campus Virtual', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Color(0xFF173726))),
          SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _ActionPill(label: 'Google Classroom', icon: Icons.class_outlined),
              _ActionPill(label: 'Moodle', icon: Icons.school_outlined),
              _ActionPill(label: 'Microsoft Teams', icon: Icons.groups_outlined),
              _ActionPill(label: 'Zoom', icon: Icons.videocam_outlined),
            ],
          ),
        ],
      ),
    );
  }
}

class _SupportCard extends StatelessWidget {
  const _SupportCard();

  @override
  Widget build(BuildContext context) {
    return _GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Soporte', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Color(0xFF173726))),
          SizedBox(height: 10),
          Text(
            'Chat en tiempo real con Registro, Caja, Finanzas, Tecnología, Coordinación académica y Biblioteca.',
            style: TextStyle(fontSize: 13, color: Color(0xFF62716A), height: 1.35),
          ),
          SizedBox(height: 12),
          _ActionPill(label: 'Abrir chat', icon: Icons.headset_mic_outlined),
        ],
      ),
    );
  }
}

class _SectionHero extends StatelessWidget {
  const _SectionHero({required this.title, required this.subtitle, required this.icon});

  final String title;
  final String subtitle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return _GlassCard(
      padding: const EdgeInsets.all(18),
      child: Row(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(colors: [Color(0xFF0E5A38), Color(0xFF3A7A45)]),
            ),
            child: Icon(icon, color: Colors.white, size: 30),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w900, color: Color(0xFF173726))),
                const SizedBox(height: 4),
                Text(subtitle, style: const TextStyle(fontSize: 13, color: Color(0xFF62716A), height: 1.35)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionMatrix extends StatelessWidget {
  const _ActionMatrix({required this.items, required this.onTap});

  final List<QuickFeature> items;
  final ValueChanged<QuickFeature> onTap;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = constraints.maxWidth >= 1000
            ? 3
            : constraints.maxWidth >= 640
                ? 2
                : 1;
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.28,
          ),
          itemBuilder: (context, index) {
            final feature = items[index];
            return _ActionTile(feature: feature, onTap: () => onTap(feature));
          },
        );
      },
    );
  }
}

class _ActionTile extends StatelessWidget {
  const _ActionTile({required this.feature, required this.onTap});

  final QuickFeature feature;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(22),
        child: _GlassCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: feature.tint,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(feature.icon, color: feature.color, size: 24),
              ),
              const Spacer(),
              Text(feature.title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Color(0xFF182A21)), maxLines: 2, overflow: TextOverflow.ellipsis),
              const SizedBox(height: 4),
              Text(_featureSubtitle(feature), style: const TextStyle(fontSize: 12, color: Color(0xFF61716A), height: 1.2), maxLines: 2, overflow: TextOverflow.ellipsis),
            ],
          ),
        ),
      ),
    );
  }
}

class _AcademicBlocks extends StatelessWidget {
  const _AcademicBlocks();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _WideBlockCard(
          title: 'Score académico',
          child: Row(
            children: [
              Expanded(
                child: SimpleCircularProgress(value: 0.82, label: 'Índice General', subtitle: '3.72 / 4.00'),
              ),
              SizedBox(width: 16),
              Expanded(
                child: _ScoreStats(),
              ),
            ],
          ),
        ),
        SizedBox(height: 12),
        _PensumCard(),
        SizedBox(height: 12),
        _ScheduleCard(),
        SizedBox(height: 12),
        _RecordsCard(),
        SizedBox(height: 12),
        _ReportCard(),
      ],
    );
  }
}

class _PaymentsBlocks extends StatelessWidget {
  const _PaymentsBlocks();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        _TuitionCard(),
        SizedBox(height: 12),
        _CreditsCard(),
        SizedBox(height: 12),
        _ServicesCard(),
        SizedBox(height: 12),
        _StatementCard(),
      ],
    );
  }
}

class _WideBlockCard extends StatelessWidget {
  const _WideBlockCard({required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return _GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Color(0xFF173726))),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }
}

class _ScoreStats extends StatelessWidget {
  const _ScoreStats();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        _MiniBar(label: 'Índice del cuatrimestre', value: '3.85', progress: 0.92),
        SizedBox(height: 10),
        _MiniBar(label: 'Créditos aprobados', value: '72 / 90', progress: 0.8),
        SizedBox(height: 10),
        _MiniBar(label: 'Porcentaje de avance', value: '84%', progress: 0.84),
      ],
    );
  }
}

class _MiniBar extends StatelessWidget {
  const _MiniBar({required this.label, required this.value, required this.progress});

  final String label;
  final String value;
  final double progress;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(child: Text(label, style: const TextStyle(color: Color(0xFF62716A), fontSize: 12))),
            Text(value, style: const TextStyle(fontWeight: FontWeight.w800, color: Color(0xFF173726))),
          ],
        ),
        const SizedBox(height: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(999),
          child: LinearProgressIndicator(
            minHeight: 10,
            value: progress,
            backgroundColor: const Color(0xFFE8EEE8),
            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF0E5A38)),
          ),
        ),
      ],
    );
  }
}

class _PensumCard extends StatelessWidget {
  const _PensumCard();

  @override
  Widget build(BuildContext context) {
    final statuses = [
      ('Aprobada', const Color(0xFF1B7A4B)),
      ('En curso', const Color(0xFF2458A6)),
      ('Pendiente', const Color(0xFF7A6A1C)),
      ('Bloqueada', const Color(0xFF7A3E1C)),
    ];

    return _GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(child: Text('Consultar Pensum', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Color(0xFF173726)))),
              _StatusPill(label: '68% completado', color: const Color(0xFF1B7A4B), background: const Color(0xFFE7F5EC)),
            ],
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: statuses
                .map(
                  (status) => _StatusPill(
                    label: status.$1,
                    color: status.$2,
                    background: status.$2.withValues(alpha: 0.12),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 12),
          const _PensumGrid(),
        ],
      ),
    );
  }
}

class _PensumGrid extends StatelessWidget {
  const _PensumGrid();

  @override
  Widget build(BuildContext context) {
    final entries = [
      ('Matemática Básica', 'Aprobada', const Color(0xFF1B7A4B)),
      ('Contabilidad I', 'En curso', const Color(0xFF2458A6)),
      ('Ética Profesional', 'Pendiente', const Color(0xFF7A6A1C)),
      ('Legislación', 'Bloqueada', const Color(0xFF7A3E1C)),
      ('Mercadeo Digital', 'Aprobada', const Color(0xFF1B7A4B)),
      ('Finanzas', 'En curso', const Color(0xFF2458A6)),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: entries.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1.4,
      ),
      itemBuilder: (context, index) {
        final entry = entries[index];
        return Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFFF8FBF8),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: const Color(0xFFE2ECE4)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(entry.$1, style: const TextStyle(fontWeight: FontWeight.w700, color: Color(0xFF173726))),
              _StatusPill(label: entry.$2, color: entry.$3, background: entry.$3.withValues(alpha: 0.12)),
            ],
          ),
        );
      },
    );
  }
}

class _ScheduleCard extends StatelessWidget {
  const _ScheduleCard();

  @override
  Widget build(BuildContext context) {
    return _GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Horario semanal', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Color(0xFF173726))),
          SizedBox(height: 12),
          _WeekStrip(),
          SizedBox(height: 12),
          _ScheduleTile(day: 'Lun', subject: 'Finanzas', time: '8:00 - 9:40', room: 'Aula 204', color: Color(0xFF0E5A38)),
          _ScheduleTile(day: 'Mié', subject: 'Mercadeo', time: '10:00 - 11:40', room: 'Aula 108', color: Color(0xFF2458A6)),
          _ScheduleTile(day: 'Vie', subject: 'Contabilidad', time: '1:00 - 2:40', room: 'Aula 312', color: Color(0xFF4D6B2F)),
        ],
      ),
    );
  }
}

class _WeekStrip extends StatelessWidget {
  const _WeekStrip();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        _DayChip(label: 'L'),
        _DayChip(label: 'M'),
        _DayChip(label: 'X', selected: true),
        _DayChip(label: 'J'),
        _DayChip(label: 'V'),
        _DayChip(label: 'S'),
      ],
    );
  }
}

class _DayChip extends StatelessWidget {
  const _DayChip({required this.label, this.selected = false});

  final String label;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Container(
          height: 42,
          decoration: BoxDecoration(
            color: selected ? const Color(0xFF0E5A38) : const Color(0xFFF2F5F2),
            borderRadius: BorderRadius.circular(14),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(color: selected ? Colors.white : const Color(0xFF173726), fontWeight: FontWeight.w800),
          ),
        ),
      ),
    );
  }
}

class _ScheduleTile extends StatelessWidget {
  const _ScheduleTile({required this.day, required this.subject, required this.time, required this.room, required this.color});

  final String day;
  final String subject;
  final String time;
  final String room;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFFF8FBF8),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: const Color(0xFFE2ECE4)),
        ),
        child: Row(
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(color: color.withValues(alpha: 0.12), shape: BoxShape.circle),
              alignment: Alignment.center,
              child: Text(day, style: TextStyle(color: color, fontWeight: FontWeight.w800)),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(subject, style: const TextStyle(fontWeight: FontWeight.w700, color: Color(0xFF173726))),
                  const SizedBox(height: 3),
                  Text('$time · $room', style: const TextStyle(fontSize: 12, color: Color(0xFF62716A))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RecordsCard extends StatelessWidget {
  const _RecordsCard();

  @override
  Widget build(BuildContext context) {
    return _GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Record académico', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Color(0xFF173726))),
          SizedBox(height: 12),
          _TableHeader(columns: ['Materia', 'Créditos', 'Calif.', 'Período']),
          _TableRowItem(values: ['Finanzas', '3', 'A', '2026-1']),
          _TableRowItem(values: ['Mercadeo', '4', 'B+', '2026-1']),
          _TableRowItem(values: ['Contabilidad', '3', 'A-', '2025-3']),
        ],
      ),
    );
  }
}

class _TableHeader extends StatelessWidget {
  const _TableHeader({required this.columns});

  final List<String> columns;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: BoxDecoration(color: const Color(0xFFEAF2EC), borderRadius: BorderRadius.circular(14)),
      child: Row(
        children: columns
            .map(
              (column) => Expanded(
                child: Text(column, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Color(0xFF173726))),
              ),
            )
            .toList(),
      ),
    );
  }
}

class _TableRowItem extends StatelessWidget {
  const _TableRowItem({required this.values});

  final List<String> values;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Color(0xFFE8EEE8)))),
      child: Row(
        children: values
            .map(
              (value) => Expanded(
                child: Text(value, style: const TextStyle(fontSize: 13, color: Color(0xFF27352E))),
              ),
            )
            .toList(),
      ),
    );
  }
}

class _ReportCard extends StatelessWidget {
  const _ReportCard();

  @override
  Widget build(BuildContext context) {
    return _GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Reportar situaciones con docentes', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Color(0xFF173726))),
          SizedBox(height: 10),
          Text(
            'Formulario con profesor, materia, tipo de situación, descripción y archivos adjuntos.',
            style: TextStyle(fontSize: 13, color: Color(0xFF62716A), height: 1.35),
          ),
          SizedBox(height: 12),
          _ActionPill(label: 'Enviar reporte', icon: Icons.send_outlined),
        ],
      ),
    );
  }
}

class _TuitionCard extends StatelessWidget {
  const _TuitionCard({
    this.paid = false,
    this.selectedMethods = const <String>{'Tarjeta'},
    this.onToggleMethod,
    this.onPay,
  });

  final bool paid;
  final Set<String> selectedMethods;
  final ValueChanged<String>? onToggleMethod;
  final VoidCallback? onPay;

  @override
  Widget build(BuildContext context) {
    return _GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(child: Text('Pago de matrícula', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Color(0xFF173726)))),
              _StatusPill(
                label: paid ? 'Pagado' : 'Pendiente',
                color: paid ? const Color(0xFF1B7A4B) : const Color(0xFFC03A2B),
                background: paid ? const Color(0xFFE7F5EC) : const Color(0xFFFCEAE8),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _SummaryLine(label: 'Balance pendiente', value: paid ? 'RD\$ 0.00' : 'RD\$ 12,450'),
          const _SummaryLine(label: 'Fecha límite', value: '15 Ago 2026'),
          const SizedBox(height: 12),
          SimpleLineChart(values: paid ? const [0.18, 0.22, 0.19, 0.16, 0.14, 0.12, 0.08] : const [0.18, 0.28, 0.35, 0.42, 0.39, 0.52, 0.18]),
          const SizedBox(height: 12),
          const Text(
            'Métodos de pago: Tarjeta, Transferencia, Apple Pay, Google Pay y Pago en línea.',
            style: TextStyle(fontSize: 13, color: Color(0xFF62716A), height: 1.35),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: ['Tarjeta', 'Transferencia', 'Apple Pay', 'Google Pay', 'Pago en línea']
                .map(
                  (method) => FilterChip(
                    label: Text(method),
                    selected: selectedMethods.contains(method),
                    onSelected: onToggleMethod == null ? null : (_) => onToggleMethod!(method),
                    selectedColor: const Color(0xFFE7F5EC),
                    checkmarkColor: const Color(0xFF0E5A38),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(child: _ActionPill(label: paid ? 'Pagado' : 'Pagar', icon: Icons.lock_open_outlined)),
              const SizedBox(width: 10),
              Expanded(
                child: FilledButton.tonalIcon(
                  onPressed: onPay,
                  icon: const Icon(Icons.picture_as_pdf_outlined),
                  label: const Text('Generar PDF'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PaymentMethodsCard extends StatelessWidget {
  const _PaymentMethodsCard();

  @override
  Widget build(BuildContext context) {
    return const _GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Métodos de pago', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Color(0xFF173726))),
          SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _StatusPill(label: 'Tarjeta', color: Color(0xFF0E5A38), background: Color(0xFFE7F5EC)),
              _StatusPill(label: 'Transferencia', color: Color(0xFF0E5A38), background: Color(0xFFE7F5EC)),
              _StatusPill(label: 'Apple Pay', color: Color(0xFF0E5A38), background: Color(0xFFE7F5EC)),
              _StatusPill(label: 'Google Pay', color: Color(0xFF0E5A38), background: Color(0xFFE7F5EC)),
              _StatusPill(label: 'Pago en línea', color: Color(0xFF0E5A38), background: Color(0xFFE7F5EC)),
            ],
          ),
        ],
      ),
    );
  }
}

class _CreditsCard extends StatelessWidget {
  const _CreditsCard();

  @override
  Widget build(BuildContext context) {
    return const _GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Pago de créditos', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Color(0xFF173726))),
          SizedBox(height: 12),
          _SummaryLine(label: 'Créditos inscritos', value: '15'),
          _SummaryLine(label: 'Precio por crédito', value: 'RD\$ 950'),
          _SummaryLine(label: 'Total', value: 'RD\$ 14,250'),
          _SummaryLine(label: 'Estado del pago', value: 'Pendiente parcial'),
        ],
      ),
    );
  }
}

class _CreditsBreakdownCard extends StatelessWidget {
  const _CreditsBreakdownCard();

  @override
  Widget build(BuildContext context) {
    return const _GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Detalle de créditos', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Color(0xFF173726))),
          SizedBox(height: 12),
          _SummaryLine(label: 'Total facturado', value: 'RD\$ 14,250'),
          _SummaryLine(label: 'Abonos realizados', value: 'RD\$ 5,000'),
          _SummaryLine(label: 'Balance restante', value: 'RD\$ 9,250'),
        ],
      ),
    );
  }
}

class _ServicesCard extends StatelessWidget {
  const _ServicesCard();

  @override
  Widget build(BuildContext context) {
    return const _GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Pago de servicios', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Color(0xFF173726))),
          SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _StatusPill(label: 'Laboratorio', color: Color(0xFF0E5A38), background: Color(0xFFE7F5EC)),
              _StatusPill(label: 'Biblioteca', color: Color(0xFF0E5A38), background: Color(0xFFE7F5EC)),
              _StatusPill(label: 'Carnet', color: Color(0xFF0E5A38), background: Color(0xFFE7F5EC)),
              _StatusPill(label: 'Graduación', color: Color(0xFF0E5A38), background: Color(0xFFE7F5EC)),
              _StatusPill(label: 'Constancias', color: Color(0xFF0E5A38), background: Color(0xFFE7F5EC)),
              _StatusPill(label: 'Certificaciones', color: Color(0xFF0E5A38), background: Color(0xFFE7F5EC)),
              _StatusPill(label: 'Reposición', color: Color(0xFF0E5A38), background: Color(0xFFE7F5EC)),
            ],
          ),
          SizedBox(height: 12),
          _ActionPill(label: 'Pagar servicios', icon: Icons.payments_outlined),
        ],
      ),
    );
  }
}

class _ServiceActionsCard extends StatelessWidget {
  const _ServiceActionsCard();

  @override
  Widget build(BuildContext context) {
    return const _GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Acciones', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Color(0xFF173726))),
          SizedBox(height: 12),
          _ActionPill(label: 'Pagar servicios', icon: Icons.payments_outlined),
        ],
      ),
    );
  }
}

class _StatementCard extends StatelessWidget {
  const _StatementCard();

  @override
  Widget build(BuildContext context) {
    return const _GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Estado de cuenta', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Color(0xFF173726))),
          SizedBox(height: 12),
          _TableHeader(columns: ['Fecha', 'Concepto', 'Cargo', 'Pago']),
          _TableRowItem(values: ['01/08', 'Matrícula', '14,250', '0']),
          _TableRowItem(values: ['03/08', 'Pago parcial', '0', '5,000']),
          _TableRowItem(values: ['07/08', 'Balance', '0', '9,250']),
          SizedBox(height: 10),
          _ActionPill(label: 'Exportar PDF', icon: Icons.picture_as_pdf_outlined),
        ],
      ),
    );
  }
}

class _FiltersCard extends StatelessWidget {
  const _FiltersCard({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return _GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Color(0xFF173726))),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: const [
              _StatusPill(label: 'Este mes', color: Color(0xFF0E5A38), background: Color(0xFFE7F5EC)),
              _StatusPill(label: 'Últimos 3 meses', color: Color(0xFF0E5A38), background: Color(0xFFE7F5EC)),
              _StatusPill(label: 'Exportar PDF', color: Color(0xFF0E5A38), background: Color(0xFFE7F5EC)),
            ],
          ),
        ],
      ),
    );
  }
}

class _NotificationStack extends StatelessWidget {
  const _NotificationStack();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        _NotificationCard(title: 'Pago pendiente de matrícula', subtitle: 'El saldo vence en 4 días.', icon: Icons.payments_outlined, color: Color(0xFFC03A2B)),
        SizedBox(height: 12),
        _NotificationCard(title: 'Nueva calificación publicada', subtitle: 'Finanzas: A en el último parcial.', icon: Icons.grade_outlined, color: Color(0xFF1B7A4B)),
        SizedBox(height: 12),
        _NotificationCard(title: 'Cambio de horario', subtitle: 'La clase de miércoles se movió a Aula 108.', icon: Icons.schedule_outlined, color: Color(0xFF2458A6)),
        SizedBox(height: 12),
        _NotificationCard(title: 'Evento institucional', subtitle: 'Graduación y feria académica este viernes.', icon: Icons.event_available_outlined, color: Color(0xFF7A6A1C)),
      ],
    );
  }
}

class _NotificationCard extends StatelessWidget {
  const _NotificationCard({required this.title, required this.subtitle, required this.icon, required this.color});

  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return _GlassCard(
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(color: color.withValues(alpha: 0.12), borderRadius: BorderRadius.circular(16)),
            child: Icon(icon, color: color),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.w800, color: Color(0xFF173726))),
                const SizedBox(height: 4),
                Text(subtitle, style: const TextStyle(fontSize: 13, color: Color(0xFF62716A), height: 1.35)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ChatSupportPreview extends StatelessWidget {
  const _ChatSupportPreview();

  @override
  Widget build(BuildContext context) {
    return _GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Chat de soporte', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Color(0xFF173726))),
          SizedBox(height: 10),
          Text(
            'Registro, Caja, Finanzas, Tecnología, Coordinación académica y Biblioteca.',
            style: TextStyle(fontSize: 13, color: Color(0xFF62716A), height: 1.35),
          ),
          SizedBox(height: 12),
          _ActionPill(label: 'Iniciar conversación', icon: Icons.chat_bubble_outline),
        ],
      ),
    );
  }
}

class _ProfileSummaryCard extends StatelessWidget {
  const _ProfileSummaryCard();

  @override
  Widget build(BuildContext context) {
    return _GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const _ProfileAvatar(onTap: nullAction),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Berny Alcántara', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Color(0xFF173726))),
                    SizedBox(height: 4),
                    Text('berny@miunad.edu.do', style: TextStyle(color: Color(0xFF62716A))),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const _SummaryLine(label: 'Matrícula', value: '2024-0315'),
          const _SummaryLine(label: 'Carrera', value: 'Lic. en Administración'),
          const _SummaryLine(label: 'Facultad', value: 'Ciencias Económicas y Empresariales'),
          const _SummaryLine(label: 'Teléfono', value: '+1 (809) 555-0134'),
        ],
      ),
    );
  }
}

class _SettingsGrid extends StatelessWidget {
  const _SettingsGrid();

  @override
  Widget build(BuildContext context) {
    final items = [
      ('Modo oscuro', Icons.dark_mode_outlined),
      ('Idioma', Icons.language_outlined),
      ('Notificaciones', Icons.notifications_active_outlined),
      ('Seguridad', Icons.security_outlined),
      ('Privacidad', Icons.privacy_tip_outlined),
      ('Acerca de', Icons.info_outline),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = constraints.maxWidth > 620 ? 3 : 2;
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1.2,
          ),
          itemBuilder: (context, index) {
            final item = items[index];
            return _SettingTile(label: item.$1, icon: item.$2);
          },
        );
      },
    );
  }
}

class _SettingTile extends StatelessWidget {
  const _SettingTile({required this.label, required this.icon});

  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return _GlassCard(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: const Color(0xFF0E5A38), size: 28),
          const SizedBox(height: 10),
          Text(label, textAlign: TextAlign.center, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: Color(0xFF173726))),
        ],
      ),
    );
  }
}

class _SupportContactsCard extends StatelessWidget {
  const _SupportContactsCard();

  @override
  Widget build(BuildContext context) {
    return _GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Ayuda y seguridad', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Color(0xFF173726))),
          SizedBox(height: 12),
          _ActionPill(label: 'Cambiar contraseña', icon: Icons.password_outlined),
          SizedBox(height: 10),
          _ActionPill(label: 'Biometría y privacidad', icon: Icons.fingerprint_outlined),
          SizedBox(height: 10),
          _ActionPill(label: 'Cerrar sesión', icon: Icons.logout_outlined),
        ],
      ),
    );
  }
}

class _SummaryLine extends StatelessWidget {
  const _SummaryLine({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Expanded(child: Text(label, style: const TextStyle(fontSize: 13, color: Color(0xFF62716A)))),
          Text(value, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w800, color: Color(0xFF173726))),
        ],
      ),
    );
  }
}

class _ActionPill extends StatelessWidget {
  const _ActionPill({required this.label, required this.icon, this.onTap});

  final String label;
  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: BoxDecoration(
            color: const Color(0xFFF3F7F4),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: const Color(0xFFE2ECE4)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 18, color: const Color(0xFF0E5A38)),
              const SizedBox(width: 8),
              Flexible(child: Text(label, style: const TextStyle(fontWeight: FontWeight.w700, color: Color(0xFF173726)))),
            ],
          ),
        ),
      ),
    );
  }
}

class SimpleCircularProgress extends StatelessWidget {
  const SimpleCircularProgress({super.key, required this.value, required this.label, required this.subtitle});

  final double value;
  final String label;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 140,
          height: 140,
          child: Stack(
            fit: StackFit.expand,
            children: [
              CircularProgressIndicator(
                value: value,
                strokeWidth: 12,
                backgroundColor: const Color(0xFFE7EFE9),
                valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF0E5A38)),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('${(value * 100).round()}%', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w900, color: Color(0xFF173726))),
                    const SizedBox(height: 4),
                    Text(label, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12, color: Color(0xFF62716A))),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Text(subtitle, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: Color(0xFF173726))),
      ],
    );
  }
}

class SimpleLineChart extends StatelessWidget {
  const SimpleLineChart({super.key, required this.values});

  final List<double> values;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 86,
      child: CustomPaint(
        painter: _LineChartPainter(values),
        child: const SizedBox.expand(),
      ),
    );
  }
}

class _LineChartPainter extends CustomPainter {
  _LineChartPainter(this.values);

  final List<double> values;

  @override
  void paint(Canvas canvas, Size size) {
    final axis = Paint()
      ..color = const Color(0xFFE2ECE4)
      ..strokeWidth = 1.2
      ..style = PaintingStyle.stroke;

    canvas.drawLine(Offset(0, size.height - 4), Offset(size.width, size.height - 4), axis);

    if (values.isEmpty) return;

    final path = Path();
    for (var index = 0; index < values.length; index++) {
      final x = (size.width / (values.length - 1)) * index;
      final y = size.height - 10 - (values[index] * (size.height - 18));
      if (index == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    final line = Paint()
      ..color = const Color(0xFF0E5A38)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    final fill = Paint()
      ..color = const Color(0xFF0E5A38).withValues(alpha: 0.10)
      ..style = PaintingStyle.fill;

    final fillPath = Path()
      ..addPath(path, Offset.zero)
      ..lineTo(size.width, size.height - 4)
      ..lineTo(0, size.height - 4)
      ..close();

    canvas.drawPath(fillPath, fill);
    canvas.drawPath(path, line);
  }

  @override
  bool shouldRepaint(covariant _LineChartPainter oldDelegate) => oldDelegate.values != values;
}

class _FeatureHero extends StatelessWidget {
  const _FeatureHero({required this.feature});

  final QuickFeature feature;

  @override
  Widget build(BuildContext context) {
    return _GlassCard(
      child: Row(
        children: [
          Hero(
            tag: 'feature_icon_${feature.name}',
            child: Container(
              width: 68,
              height: 68,
              decoration: BoxDecoration(color: feature.tint, borderRadius: BorderRadius.circular(20)),
              child: Icon(feature.icon, color: feature.color, size: 32),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(feature.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: Color(0xFF173726))),
                const SizedBox(height: 4),
                Text(_featureSubtitle(feature), style: const TextStyle(fontSize: 13, color: Color(0xFF62716A), height: 1.35)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

List<Widget> _featureSections(QuickFeature feature) {
  switch (feature) {
    case QuickFeature.tuition:
      return const [
        _TuitionCard(),
        SizedBox(height: 12),
        _PaymentMethodsCard(),
      ];
    case QuickFeature.credits:
      return const [
        _CreditsCard(),
        SizedBox(height: 12),
        _CreditsBreakdownCard(),
      ];
    case QuickFeature.services:
      return const [
        _ServicesCard(),
        SizedBox(height: 12),
        _ServiceActionsCard(),
      ];
    case QuickFeature.balance:
      return const [
        _BalanceOverviewCard(),
        SizedBox(height: 12),
        _BalanceLegendCard(),
      ];
    case QuickFeature.accountStatement:
      return const [
        _StatementCard(),
        SizedBox(height: 12),
        _FiltersCard(title: 'Filtros por fecha y exportación PDF'),
      ];
    case QuickFeature.subjectSelection:
      return const [_SelectionCard()];
    case QuickFeature.schedule:
      return const [_ScheduleCard()];
    case QuickFeature.academicRecord:
      return const [_RecordsCard()];
    case QuickFeature.academicScore:
      return const [_ScoreDetailCard()];
    case QuickFeature.pensum:
      return const [_PensumCard()];
    case QuickFeature.news:
      return const [_NewsRail()];
    case QuickFeature.academicCalendar:
      return const [_AcademicCalendarCard()];
    case QuickFeature.virtualLibrary:
      return const [_LibraryCard()];
    case QuickFeature.campusVirtual:
      return const [_CampusVirtualDetailCard()];
    case QuickFeature.support:
      return const [_SupportDetailCard()];
  }
}

class _BalanceLegendCard extends StatelessWidget {
  const _BalanceLegendCard();

  @override
  Widget build(BuildContext context) {
    return const _GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Interpretación', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Color(0xFF173726))),
          SizedBox(height: 12),
          _SummaryLine(label: 'En verde', value: 'Pagado'),
          _SummaryLine(label: 'En rojo', value: 'Deuda'),
        ],
      ),
    );
  }
}

class _SelectionCard extends StatelessWidget {
  const _SelectionCard();

  @override
  Widget build(BuildContext context) {
    return _GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Selección de materias', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Color(0xFF173726))),
          SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _StatusPill(label: 'Contabilidad Avanzada · 3 cr.', color: Color(0xFF0E5A38), background: Color(0xFFE7F5EC)),
              _StatusPill(label: 'Finanzas Corporativas · 4 cr.', color: Color(0xFF0E5A38), background: Color(0xFFE7F5EC)),
              _StatusPill(label: 'Mercadeo Estratégico · 3 cr.', color: Color(0xFF0E5A38), background: Color(0xFFE7F5EC)),
            ],
          ),
          SizedBox(height: 12),
          _SummaryLine(label: 'Total de créditos seleccionados', value: '10'),
          _SummaryLine(label: 'Validación de choques', value: 'Sin conflictos'),
          _ActionPill(label: 'Agregar / eliminar materias', icon: Icons.add_circle_outline),
        ],
      ),
    );
  }
}

class _RecordDetailCard extends StatelessWidget {
  const _RecordDetailCard();

  @override
  Widget build(BuildContext context) {
    return const _RecordsCard();
  }
}

class _ScoreDetailCard extends StatelessWidget {
  const _ScoreDetailCard();

  @override
  Widget build(BuildContext context) {
    return _GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Score académico', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Color(0xFF173726))),
          SizedBox(height: 12),
          SimpleCircularProgress(value: 0.82, label: 'Índice General', subtitle: '3.72 / 4.00'),
          SizedBox(height: 16),
          _SummaryLine(label: 'Créditos aprobados', value: '72'),
          _SummaryLine(label: 'Créditos pendientes', value: '18'),
          _SummaryLine(label: 'Porcentaje de avance', value: '84%'),
          SizedBox(height: 12),
          SimpleLineChart(values: [0.3, 0.45, 0.38, 0.6, 0.72, 0.78, 0.82]),
        ],
      ),
    );
  }
}

class _NewsDetailCard extends StatelessWidget {
  const _NewsDetailCard();

  @override
  Widget build(BuildContext context) {
    return const _NewsRail();
  }
}

class _AcademicCalendarDetailCard extends StatelessWidget {
  const _AcademicCalendarDetailCard();

  @override
  Widget build(BuildContext context) {
    return const _AcademicCalendarCard();
  }
}

class _LibraryCard extends StatelessWidget {
  const _LibraryCard();

  @override
  Widget build(BuildContext context) {
    return _GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Biblioteca Virtual', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Color(0xFF173726))),
          SizedBox(height: 12),
          _ActionPill(label: 'Buscar libros', icon: Icons.search_outlined),
          SizedBox(height: 10),
          _SummaryLine(label: 'Descargar PDF', value: 'Disponible'),
          _SummaryLine(label: 'Favoritos', value: '12 libros'),
          _SummaryLine(label: 'Historial', value: 'Últimas búsquedas'),
        ],
      ),
    );
  }
}

class _CampusVirtualDetailCard extends StatelessWidget {
  const _CampusVirtualDetailCard();

  @override
  Widget build(BuildContext context) {
    return const _GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Campus Virtual', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Color(0xFF173726))),
          SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _StatusPill(label: 'Google Classroom', color: Color(0xFF0E5A38), background: Color(0xFFE7F5EC)),
              _StatusPill(label: 'Moodle', color: Color(0xFF0E5A38), background: Color(0xFFE7F5EC)),
              _StatusPill(label: 'Teams', color: Color(0xFF0E5A38), background: Color(0xFFE7F5EC)),
              _StatusPill(label: 'Zoom', color: Color(0xFF0E5A38), background: Color(0xFFE7F5EC)),
            ],
          ),
        ],
      ),
    );
  }
}

class _SupportDetailCard extends StatelessWidget {
  const _SupportDetailCard();

  @override
  Widget build(BuildContext context) {
    return _GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Chat de Soporte', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Color(0xFF173726))),
          SizedBox(height: 12),
          _SummaryLine(label: 'Registro', value: 'Activo'),
          _SummaryLine(label: 'Caja', value: 'Activo'),
          _SummaryLine(label: 'Tecnología', value: 'Activo'),
          _SummaryLine(label: 'Biblioteca', value: 'Activo'),
          SizedBox(height: 12),
          _ActionPill(label: 'Abrir chat', icon: Icons.chat_bubble_outline),
        ],
      ),
    );
  }
}

void _openFeature(BuildContext context, QuickFeature feature) {
  Navigator.of(context).push(
    MaterialPageRoute<void>(builder: (_) => _FeatureDetailPage(feature: feature)),
  );
}

void nullAction() {}
