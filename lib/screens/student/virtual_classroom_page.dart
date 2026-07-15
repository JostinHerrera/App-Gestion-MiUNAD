part of '../../main.dart';

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
                subject: Subject(
                  id: '1',
                  name: 'Programación II',
                  professor: 'Ing. Carlos Rodríguez',
                  day: 'Lunes',
                  time: '8:00 - 9:40 AM',
                  classroomUrl: 'https://classroom.google.com',
                  meetUrl: 'https://meet.google.com',
                  isLive: true,
                  code: '900001',
                  credits: 3,
                  description: 'Curso avanzado de programación orientada a objetos.',
                  nextPendingActivity: 'Tarea 1: Introducción - Vence en 2 días',
                  color: const Color(0xFF0E5A38),
                ),
              ),
              const SizedBox(height: 16),
              _SubjectCard(
                subject: Subject(
                  id: '2',
                  name: 'Sistemas Operativos',
                  professor: 'Dra. María González',
                  day: 'Miércoles',
                  time: '10:00 - 11:40 AM',
                  classroomUrl: 'https://classroom.google.com',
                  meetUrl: 'https://meet.google.com',
                  isLive: false,
                  code: '900002',
                  credits: 4,
                  description: 'Estudio de los sistemas operativos modernos.',
                  nextPendingActivity: 'Quiz 1 - Vence mañana',
                  color: const Color(0xFF2458A6),
                ),
              ),
              const SizedBox(height: 16),
              _SubjectCard(
                subject: Subject(
                  id: '3',
                  name: 'Ingeniería de Software',
                  professor: 'Ing. Juan Pérez',
                  day: 'Viernes',
                  time: '1:00 - 2:40 PM',
                  classroomUrl: 'https://classroom.google.com',
                  meetUrl: 'https://meet.google.com',
                  isLive: false,
                  code: '900003',
                  credits: 3,
                  description: 'Metodologías y procesos de ingeniería de software.',
                  nextPendingActivity: 'Proyecto Semestral - Vence en 1 semana',
                  color: const Color(0xFF7E5B1A),
                ),
              ),
              const SizedBox(height: 16),
              _SubjectCard(
                subject: Subject(
                  id: '4',
                  name: 'Redes de Computadoras',
                  professor: 'Ing. Ana Martínez',
                  day: 'Martes',
                  time: '2:00 - 3:40 PM',
                  classroomUrl: 'https://classroom.google.com',
                  meetUrl: 'https://meet.google.com',
                  isLive: false,
                  code: '900004',
                  credits: 4,
                  description: 'Fundamentos de redes y comunicaciones.',
                  nextPendingActivity: 'Laboratorio 3 - Vence en 3 días',
                  color: const Color(0xFF6A4B1C),
                ),
              ),
              const SizedBox(height: 16),
              _SubjectCard(
                subject: Subject(
                  id: '5',
                  name: 'Desarrollo Web',
                  professor: 'Ing. Luis Sánchez',
                  day: 'Jueves',
                  time: '11:00 - 12:40 PM',
                  classroomUrl: 'https://classroom.google.com',
                  meetUrl: 'https://meet.google.com',
                  isLive: false,
                  code: '900005',
                  credits: 3,
                  description: 'Desarrollo de aplicaciones web modernas.',
                  nextPendingActivity: 'Taller 2 - Vence en 5 días',
                  color: const Color(0xFF4D6B2F),
                ),
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
    required this.subject,
  });

  final Subject subject;

  @override
  Widget build(BuildContext context) {
    final cardColor = subject.color ?? const Color(0xFF0E5A38);
    
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => SubjectDetailPage(subject: subject),
          ),
        );
      },
      child: Container(
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
            // Header with color indicator and name
            Row(
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: cardColor.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(
                    Icons.class_outlined,
                    color: cardColor,
                    size: 28,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        subject.name,
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF173726),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subject.professor,
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          color: Color(0xFF62716A),
                        ),
                      ),
                    ],
                  ),
                ),
                if (subject.isLive)
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
                  ),
              ],
            ),
            const SizedBox(height: 16),
            // Next pending activity
            if (subject.nextPendingActivity != null)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF8E1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFFFE082)),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.assignment_outlined, size: 18, color: Color(0xFFF57C00)),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        subject.nextPendingActivity!,
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFE65100),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 16),
            // Enter classroom button
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SubjectDetailPage(subject: subject),
                    ),
                  );
                },
                style: FilledButton.styleFrom(
                  backgroundColor: cardColor,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.login_outlined, size: 18),
                    SizedBox(width: 8),
                    Text(
                      'Entrar al Aula',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
