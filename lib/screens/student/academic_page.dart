part of '../../main.dart';

class AcademicPage extends StatelessWidget {
  const AcademicPage({super.key});

  void _openOption(BuildContext context, String option) {
    // Navigate to appropriate page based on option
    switch (option) {
      case 'Mis Materias':
        _openFeature(context, QuickFeature.subjectSelection);
        break;
      case 'Matrícula':
        _openFeature(context, QuickFeature.tuition);
        break;
      case 'Calificaciones':
        _openFeature(context, QuickFeature.academicScore);
        break;
      case 'Expediente':
        _openFeature(context, QuickFeature.academicRecord);
        break;
      case 'Pensum':
        _openFeature(context, QuickFeature.pensum);
        break;
      case 'Asistencia':
        _openFeature(context, QuickFeature.academicCalendar);
        break;
      case 'Horario':
        _openFeature(context, QuickFeature.schedule);
        break;
      case 'Eval. Docente':
        _openFeature(context, QuickFeature.news);
        break;
      case 'Carnet Digital':
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (_) => const StudentCardPage(),
          ),
        );
        break;
      default:
        return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ── Green header ─────────────────────────────────────────────
        _AcademicHeader(onNotificationTap: () {}),
        // ── Scrollable body ───────────────────────────────────────────────
        Expanded(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 118),
            children: [
              // Progress card
              const _AcademicProgressCard(),
              // Academic options grid
              _AcademicOptionsGrid(
                onTap: (option) => _openOption(context, option),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ─── Academic Header ──────────────────────────────────────────────────────
class _AcademicHeader extends StatelessWidget {
  const _AcademicHeader({required this.onNotificationTap});

  final VoidCallback onNotificationTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF0E5A38), Color(0xFF1B7A4B)],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Académico',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 28,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            '5to Semestre • Ingeniería de Software',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
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
      margin: const EdgeInsets.fromLTRB(20, 16, 20, 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Progreso Académico',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF173726),
                ),
              ),
              const Text(
                'Créditos 78/180',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF62716A),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: 0.43,
              backgroundColor: const Color(0xFFE8F4EC),
              valueColor: const AlwaysStoppedAnimation<Color>(
                Color(0xFF0E5A38),
              ),
              minHeight: 8,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            '43%',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Color(0xFF0E5A38),
            ),
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

// ─── Academic Options Grid ─────────────────────────────────────────────────────
class _AcademicOptionsGrid extends StatelessWidget {
  const _AcademicOptionsGrid({required this.onTap});

  final ValueChanged<String> onTap;

  static const _options = [
    ('Mis Materias', 'Cursos actuales', Icons.book_outlined, Color(0xFF0E5A38)),
    ('Matrícula', 'Periodo abierto', Icons.edit_calendar_outlined, Color(0xFF2458A6)),
    ('Calificaciones', 'Notas del semestre', Icons.grade_outlined, Color(0xFF7C3AED)),
    ('Expediente', 'Historial académico', Icons.folder_open_outlined, Color(0xFFD97706)),
    ('Pensum', 'Plan de estudio', Icons.map_outlined, Color(0xFF0E5A38)),
    ('Asistencia', 'Registro de clases', Icons.check_circle_outline, Color(0xFF2458A6)),
    ('Horario', 'Semana actual', Icons.schedule_outlined, Color(0xFF7C3AED)),
    ('Eval. Docente', 'Encuesta profesores', Icons.rate_review_outlined, Color(0xFFD97706)),
    ('Carnet Digital', 'Identificación QR', Icons.qr_code_2_outlined, Color(0xFF0E5A38)),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: _options.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 0.9,
        ),
        itemBuilder: (context, i) {
          final option = _options[i];
          return _AcademicOptionCard(
            title: option.$1,
            subtitle: option.$2,
            icon: option.$3,
            color: option.$4,
            onTap: () => onTap(option.$1),
          );
        },
      ),
    );
  }
}

class _AcademicOptionCard extends StatelessWidget {
  const _AcademicOptionCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: color, size: 24),
              ),
              const Spacer(),
              Text(
                title,
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF173726),
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
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
