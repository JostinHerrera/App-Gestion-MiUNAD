part of '../main.dart';

class VirtualClassroomPage extends StatelessWidget {
  const VirtualClassroomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ── Header ─────────────────────────────────────────────
        _VirtualClassroomHeader(),
        // ── Scrollable body ─────────────────────────────────────
        Expanded(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 118),
            children: [
              // Subject cards
              _SubjectCard(
                name: 'Programación II',
                professor: 'Ing. Carlos Rodríguez',
                day: 'Lunes',
                time: '8:00 - 9:40 AM',
                classroomUrl: 'https://classroom.google.com',
                meetUrl: 'https://meet.google.com',
                isLive: true,
              ),
              const SizedBox(height: 16),
              _SubjectCard(
                name: 'Sistemas Operativos',
                professor: 'Dra. María González',
                day: 'Miércoles',
                time: '10:00 - 11:40 AM',
                classroomUrl: 'https://classroom.google.com',
                meetUrl: 'https://meet.google.com',
                isLive: false,
              ),
              const SizedBox(height: 16),
              _SubjectCard(
                name: 'Ingeniería de Software',
                professor: 'Ing. Juan Pérez',
                day: 'Viernes',
                time: '1:00 - 2:40 PM',
                classroomUrl: 'https://classroom.google.com',
                meetUrl: 'https://meet.google.com',
                isLive: false,
              ),
              const SizedBox(height: 16),
              _SubjectCard(
                name: 'Redes de Computadoras',
                professor: 'Ing. Ana Martínez',
                day: 'Martes',
                time: '2:00 - 3:40 PM',
                classroomUrl: 'https://classroom.google.com',
                meetUrl: 'https://meet.google.com',
                isLive: false,
              ),
              const SizedBox(height: 16),
              _SubjectCard(
                name: 'Desarrollo Web',
                professor: 'Ing. Luis Sánchez',
                day: 'Jueves',
                time: '11:00 - 12:40 PM',
                classroomUrl: 'https://classroom.google.com',
                meetUrl: 'https://meet.google.com',
                isLive: false,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ─── Header ─────────────────────────────────────────────────────
class _VirtualClassroomHeader extends StatelessWidget {
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
          Row(
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(
                  Icons.class_outlined,
                  color: Colors.white,
                  size: 28,
                ),
              ),
              const SizedBox(width: 16),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Aula Virtual',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Accede a tus clases virtuales',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 13,
                        color: Color(0xFFB0D4BC),
                      ),
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

// ─── Subject Card ─────────────────────────────────────────────────
class _SubjectCard extends StatelessWidget {
  const _SubjectCard({
    required this.name,
    required this.professor,
    required this.day,
    required this.time,
    required this.classroomUrl,
    required this.meetUrl,
    required this.isLive,
  });

  final String name;
  final String professor;
  final String day;
  final String time;
  final String classroomUrl;
  final String meetUrl;
  final bool isLive;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(color: Color(0x0F000000), blurRadius: 16, offset: Offset(0, 6)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with name and live indicator
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF173726),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      professor,
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        color: Color(0xFF62716A),
                      ),
                    ),
                  ],
                ),
              ),
              if (isLive)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xFFC03A2B),
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.fiber_manual_record, size: 8, color: Colors.white),
                      SizedBox(width: 6),
                      Text(
                        'En vivo',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                )
              else
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8F4EC),
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: const Text(
                    'Sin iniciar',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF0E5A38),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 12),
          // Schedule info
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFF9F8F5),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const Icon(Icons.calendar_today_outlined, size: 16, color: Color(0xFF62716A)),
                const SizedBox(width: 8),
                Text(
                  '$day • $time',
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 13,
                    color: Color(0xFF62716A),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Action buttons
          Row(
            children: [
              Expanded(
                child: _ActionButton(
                  label: 'Entrar a Classroom',
                  icon: Icons.class_outlined,
                  color: const Color(0xFF0E5A38),
                  url: classroomUrl,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _ActionButton(
                  label: 'Unirse a Meet',
                  icon: Icons.videocam_outlined,
                  color: const Color(0xFF2458A6),
                  url: meetUrl,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ─── Action Button ─────────────────────────────────────────────────
class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.label,
    required this.icon,
    required this.color,
    required this.url,
  });

  final String label;
  final IconData icon;
  final Color color;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          // In a real app, you would use url_launcher to open the URL
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Abriendo $label...')),
          );
        },
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: color.withValues(alpha: 0.3)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 18, color: color),
              const SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
