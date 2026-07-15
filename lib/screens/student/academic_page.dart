part of '../../main.dart';

class AcademicPage extends StatelessWidget {
  const AcademicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ── Dark green header ─────────────────────────────────────────────
        _AcademicHeader(onNotificationTap: () {}),
        // ── Scrollable body ───────────────────────────────────────────────
        Expanded(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 118),
            children: [
              // Progress card
              const _AcademicProgressCard(),
              const SizedBox(height: 24),
              // Quick access
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
              _AcademicQuickGrid(
                onTap: (feature) => _openFeature(context, feature),
              ),
              const SizedBox(height: 24),
              // CTA Banner
              const _NextTermBanner(),
              const SizedBox(height: 20),
              // Detailed academic blocks (score, pensum, etc.)
              const _AcademicBlocks(),
            ],
          ),
        ),
      ],
    );
  }
}

// ─── Academic Dark Header ──────────────────────────────────────────────────────
class _AcademicHeader extends StatelessWidget {
  const _AcademicHeader({required this.onNotificationTap});

  final VoidCallback onNotificationTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF082418), Color(0xFF0E5A38), Color(0xFF156B42)],
        ),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(32)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Académico',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  letterSpacing: -0.5,
                ),
              ),
              const Spacer(),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  IconButton(
                    onPressed: onNotificationTap,
                    icon: const Icon(Icons.notifications_outlined),
                    color: Colors.white,
                    iconSize: 26,
                  ),
                  Positioned(
                    right: 8,
                    top: 8,
                    child: Container(
                      width: 18,
                      height: 18,
                      decoration: const BoxDecoration(
                        color: Color(0xFF4ADE80),
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        '3',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 10,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF082418),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Student info row
          Row(
            children: [
              // Avatar
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFF4ADE80),
                    width: 2.5,
                  ),
                  gradient: const LinearGradient(
                    colors: [Color(0xFF1B7A4B), Color(0xFF0E5A38)],
                  ),
                ),
                child: const CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: Text(
                    'B',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '¡Hola, Berny!',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 2),
                    const Text(
                      'Ing. en Software',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 13,
                        color: Color(0xFFB0D4BC),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: const Text(
                        '6to Cuatrimestre',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // UNAD logo badge
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withValues(alpha: 0.12),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.25),
                  ),
                ),
                child: const Icon(
                  Icons.school_outlined,
                  color: Colors.white,
                  size: 26,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ─── Progress Card ─────────────────────────────────────────────────────────────
class _AcademicProgressCard extends StatelessWidget {
  const _AcademicProgressCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0F000000),
            blurRadius: 16,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Tu progreso académico',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Color(0xFF173726),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              // Circular progress
              SizedBox(
                width: 90,
                height: 90,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    CircularProgressIndicator(
                      value: 0.68,
                      strokeWidth: 9,
                      backgroundColor: const Color(0xFFE8F4EC),
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        Color(0xFF0E5A38),
                      ),
                      strokeCap: StrokeCap.round,
                    ),
                    const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '68%',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                              color: Color(0xFF0E5A38),
                            ),
                          ),
                          Text(
                            'Avance',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 9,
                              color: Color(0xFF62716A),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 20),
              // Stats
              Expanded(
                child: Column(
                  children: [
                    _ProgressStatRow(
                      label: 'Créditos aprobados',
                      value: '72',
                      valueColor: const Color(0xFF0E5A38),
                      showArrow: false,
                    ),
                    const SizedBox(height: 12),
                    _ProgressStatRow(
                      label: 'Índice acumulado',
                      value: '3.72',
                      valueColor: const Color(0xFFD97706),
                      showArrow: true,
                    ),
                    const SizedBox(height: 12),
                    _ProgressStatRow(
                      label: 'Créditos pendientes',
                      value: '18',
                      valueColor: const Color(0xFFD97706),
                      showArrow: false,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ProgressStatRow extends StatelessWidget {
  const _ProgressStatRow({
    required this.label,
    required this.value,
    required this.valueColor,
    required this.showArrow,
  });

  final String label;
  final String value;
  final Color valueColor;
  final bool showArrow;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 13,
              color: Color(0xFF62716A),
            ),
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 15,
            fontWeight: FontWeight.w800,
            color: valueColor,
          ),
        ),
        if (showArrow) ...[
          const SizedBox(width: 4),
          Icon(Icons.chevron_right_rounded, size: 18, color: valueColor),
        ],
      ],
    );
  }
}

// ─── Academic Quick Grid ───────────────────────────────────────────────────────
class _AcademicQuickGrid extends StatelessWidget {
  const _AcademicQuickGrid({required this.onTap});

  final ValueChanged<QuickFeature> onTap;

  static const _items = [
    (
      QuickFeature.subjectSelection,
      'Selección de materias',
      'Inscripción y cupos',
    ),
    (QuickFeature.schedule, 'Horario de clases', 'Consulta tu horario'),
    (QuickFeature.academicRecord, 'Record académico', 'Notas e índices'),
    (QuickFeature.pensum, 'Pensum', 'Mapa curricular'),
    (QuickFeature.academicScore, 'Score académico', 'Tu rendimiento'),
    (QuickFeature.news, 'Tareas y proyectos', 'Actividades académicas'),
    (
      QuickFeature.academicCalendar,
      'Calendario académico',
      'Fechas importantes',
    ),
    (QuickFeature.virtualLibrary, 'Biblioteca virtual', 'Libros y recursos'),
    (QuickFeature.campusVirtual, 'Campus Virtual', 'Plataformas digitales'),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final cols = constraints.maxWidth >= 640 ? 4 : 3;
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _items.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: cols,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 0.85,
          ),
          itemBuilder: (context, i) {
            final item = _items[i];
            return _AcademicQuickCard(
              feature: item.$1,
              label: item.$2,
              subtitle: item.$3,
              onTap: () => onTap(item.$1),
            );
          },
        );
      },
    );
  }
}

class _AcademicQuickCard extends StatelessWidget {
  const _AcademicQuickCard({
    required this.feature,
    required this.label,
    required this.subtitle,
    required this.onTap,
  });

  final QuickFeature feature;
  final String label;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Color(0x0E000000),
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
            border: Border.all(color: const Color(0xFFF0F4F1), width: 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: 'feature_icon_${feature.name}',
                child: Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8F4EC),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Icon(
                    feature.icon,
                    color: const Color(0xFF0E5A38),
                    size: 22,
                  ),
                ),
              ),
              const Spacer(),
              Text(
                label,
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF173726),
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 3),
              Text(
                subtitle,
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 10,
                  color: Color(0xFF62716A),
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Next Term Banner ──────────────────────────────────────────────────────────
class _NextTermBanner extends StatelessWidget {
  const _NextTermBanner();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF082418), Color(0xFF0E5A38)],
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '¡Planifica tu próximo cuatrimestre!',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'La selección de materias para el próximo cuatrimestre ya está disponible.',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12,
                    color: Color(0xFFB0D4BC),
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 14),
                GestureDetector(
                  onTap: () =>
                      _openFeature(context, QuickFeature.subjectSelection),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF4ADE80),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Ir a la selección de materias',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF082418),
                          ),
                        ),
                        SizedBox(width: 6),
                        Icon(
                          Icons.arrow_forward_rounded,
                          size: 16,
                          color: Color(0xFF082418),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.10),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(
              Icons.school_rounded,
              color: Colors.white,
              size: 32,
            ),
          ),
        ],
      ),
    );
  }
}
