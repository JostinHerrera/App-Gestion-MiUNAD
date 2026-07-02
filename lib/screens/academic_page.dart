part of '../main.dart';

class AcademicPage extends StatelessWidget {
  const AcademicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 118),
      children: [
        const _SectionHero(
          title: 'Académico',
          subtitle: 'Gestión de materias, rendimiento, pensum y horario.',
          icon: Icons.menu_book_outlined,
        ),
        const SizedBox(height: 16),
        _ActionMatrix(
          items: const [
            QuickFeature.subjectSelection,
            QuickFeature.academicRecord,
            QuickFeature.academicScore,
            QuickFeature.pensum,
            QuickFeature.schedule,
            QuickFeature.academicCalendar,
            QuickFeature.virtualLibrary,
            QuickFeature.campusVirtual,
            QuickFeature.support,
          ],
          onTap: (feature) => _openFeature(context, feature),
        ),
        const SizedBox(height: 18),
        const _AcademicBlocks(),
      ],
    );
  }
}
