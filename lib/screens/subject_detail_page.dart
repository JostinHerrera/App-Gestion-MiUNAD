import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';
import '../models/virtual_classroom_models.dart';
import '../models/notification_models.dart';

class SubjectDetailPage extends StatefulWidget {
  final Subject subject;

  const SubjectDetailPage({super.key, required this.subject});

  @override
  State<SubjectDetailPage> createState() => _SubjectDetailPageState();
}

class _SubjectDetailPageState extends State<SubjectDetailPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Mock data - En producción esto vendría de una API
  late List<Announcement> _announcements;
  late List<Assignment> _assignments;
  late List<Grade> _grades;
  late List<MaterialUnit> _materialUnits;
  late List<VirtualClassroomNotification> _notifications;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _loadMockData();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _loadMockData() {
    _announcements = [
      Announcement(
        id: '1',
        subjectId: widget.subject.id,
        title: 'Bienvenidos al curso',
        content: 'Estimados estudiantes, bienvenidos al curso de ${widget.subject.name}. '
            'Les informo que las clases comenzarán el próximo lunes según el horario establecido.',
        date: DateTime.now().subtract(const Duration(days: 2)),
        professorName: widget.subject.professor,
        attachments: ['syllabus.pdf', 'guia_estudiante.pdf'],
        isPinned: true,
        imageUrls: [],
        videoUrls: [],
        links: ['https://unad.edu.do/recursos'],
        allowComments: true,
        comments: [
          PostComment(
            id: 'c1',
            postId: '1',
            authorName: 'María García',
            authorRole: 'student',
            content: '¡Gracias por la bienvenida! Estoy emocionado/a por comenzar.',
            date: DateTime.now().subtract(const Duration(days: 1)),
          ),
        ],
      ),
      Announcement(
        id: '2',
        subjectId: widget.subject.id,
        title: 'Recordatorio: Examen parcial',
        content: 'Recuerden que el examen parcial será el próximo viernes. '
            'Deben repasar los temas de las unidades 1 y 2.',
        date: DateTime.now().subtract(const Duration(days: 1)),
        professorName: widget.subject.professor,
        attachments: [],
        imageUrls: [],
        videoUrls: [],
        links: [],
        allowComments: true,
        comments: [],
      ),
      Announcement(
        id: '3',
        subjectId: widget.subject.id,
        title: 'Material adicional disponible',
        content: 'He subido videos complementarios y ejercicios prácticos en la sección de Material de clase.',
        date: DateTime.now().subtract(const Duration(hours: 5)),
        professorName: widget.subject.professor,
        attachments: [],
        imageUrls: [],
        videoUrls: ['https://example.com/video1.mp4', 'https://example.com/video2.mp4'],
        links: [],
        allowComments: true,
        comments: [],
      ),
    ];

    _assignments = [
      Assignment(
        id: '1',
        subjectId: widget.subject.id,
        title: 'Tarea 1: Introducción',
        description: 'Realizar un ensayo de 2 páginas sobre los conceptos fundamentales.',
        instructions: 'El ensayo debe incluir: 1) Definición de conceptos clave, 2) Ejemplos prácticos, 3) Conclusiones personales. Formato: Times New Roman, 12pts, interlineado 1.5.',
        dueDate: DateTime.now().add(const Duration(days: 7)),
        dueTime: '11:59 PM',
        postedDate: DateTime.now().subtract(const Duration(days: 3)),
        maxScore: 100,
        status: 'pending',
        attachments: ['instrucciones_tarea1.pdf', 'plantilla_ensayo.docx'],
        allowModifications: true,
        submission: null,
      ),
      Assignment(
        id: '2',
        subjectId: widget.subject.id,
        title: 'Proyecto Semestral',
        description: 'Desarrollar una aplicación completa utilizando los conceptos aprendidos.',
        instructions: 'El proyecto debe ser desarrollado en equipos de 3-4 personas. Debe incluir documentación completa y pruebas unitarias.',
        dueDate: DateTime.now().add(const Duration(days: 30)),
        dueTime: '11:59 PM',
        postedDate: DateTime.now().subtract(const Duration(days: 10)),
        maxScore: 200,
        status: 'pending',
        attachments: ['requisitos_proyecto.pdf', 'plantilla_proyecto.zip'],
        allowModifications: false,
        submission: null,
      ),
      Assignment(
        id: '3',
        subjectId: widget.subject.id,
        title: 'Quiz 1',
        description: 'Evaluación de conocimientos básicos.',
        instructions: 'El quiz consta de 20 preguntas de opción múltiple y tiene una duración de 45 minutos.',
        dueDate: DateTime.now().subtract(const Duration(days: 5)),
        dueTime: '10:00 AM',
        postedDate: DateTime.now().subtract(const Duration(days: 15)),
        maxScore: 50,
        obtainedScore: 42,
        feedback: 'Buen trabajo, pero repasa los conceptos de herencia y polimorfismo.',
        status: 'graded',
        attachments: [],
        allowModifications: false,
        submission: AssignmentSubmission(
          id: 's1',
          assignmentId: '3',
          files: ['quiz1_respuestas.pdf'],
          privateComment: 'Tuve dificultades con las preguntas de herencia.',
          submittedAt: DateTime.now().subtract(const Duration(days: 5)),
        ),
        gradedDate: DateTime.now().subtract(const Duration(days: 4)),
      ),
      Assignment(
        id: '4',
        subjectId: widget.subject.id,
        title: 'Laboratorio 2',
        description: 'Implementación de estructuras de datos.',
        instructions: 'Implementar lista enlazada, pila y cola con sus operaciones básicas.',
        dueDate: DateTime.now().subtract(const Duration(days: 2)),
        dueTime: '5:00 PM',
        postedDate: DateTime.now().subtract(const Duration(days: 10)),
        maxScore: 100,
        status: 'late',
        attachments: ['guia_laboratorio2.pdf'],
        allowModifications: false,
        submission: null,
      ),
    ];

    _grades = [
      Grade(
        id: '1',
        subjectId: widget.subject.id,
        assignmentId: '3',
        assignmentName: 'Quiz 1',
        score: 42,
        maxScore: 50,
        feedback: 'Buen trabajo, pero repasa los conceptos de herencia.',
        gradedDate: DateTime.now().subtract(const Duration(days: 4)),
        professorName: widget.subject.professor,
      ),
      Grade(
        id: '2',
        subjectId: widget.subject.id,
        assignmentId: '5',
        assignmentName: 'Taller 1',
        score: 85,
        maxScore: 100,
        feedback: 'Excelente trabajo en la implementación.',
        gradedDate: DateTime.now().subtract(const Duration(days: 10)),
        professorName: widget.subject.professor,
      ),
      Grade(
        id: '3',
        subjectId: widget.subject.id,
        assignmentId: '6',
        assignmentName: 'Participación Foro',
        score: 95,
        maxScore: 100,
        feedback: 'Muy buena participación y aportes constructivos.',
        gradedDate: DateTime.now().subtract(const Duration(days: 7)),
        professorName: widget.subject.professor,
      ),
    ];

    _materialUnits = [
      MaterialUnit(
        id: 'u1',
        subjectId: widget.subject.id,
        name: 'Unidad 1: Fundamentos',
        order: 1,
        materials: [
          CourseMaterial(
            id: 'm1',
            subjectId: widget.subject.id,
            title: 'Presentación Unidad 1',
            description: 'Diapositivas de la primera unidad del curso.',
            type: 'pdf',
            url: 'https://example.com/unidad1.pdf',
            uploadedDate: DateTime.now().subtract(const Duration(days: 15)),
            professorName: widget.subject.professor,
            size: 2500,
            unit: 'Unidad 1',
            topic: 'Fundamentos',
          ),
          CourseMaterial(
            id: 'm2',
            subjectId: widget.subject.id,
            title: 'Video introductorio',
            description: 'Video explicativo de los conceptos básicos.',
            type: 'video',
            url: 'https://example.com/intro.mp4',
            uploadedDate: DateTime.now().subtract(const Duration(days: 14)),
            professorName: widget.subject.professor,
            size: 45000,
            unit: 'Unidad 1',
            topic: 'Fundamentos',
          ),
          CourseMaterial(
            id: 'm3',
            subjectId: widget.subject.id,
            title: 'Guía práctica',
            description: 'Ejercicios prácticos para reforzar los conceptos.',
            type: 'pdf',
            url: 'https://example.com/guia.pdf',
            uploadedDate: DateTime.now().subtract(const Duration(days: 13)),
            professorName: widget.subject.professor,
            size: 800,
            unit: 'Unidad 1',
            topic: 'Fundamentos',
          ),
          CourseMaterial(
            id: 'm4',
            subjectId: widget.subject.id,
            title: 'Enlace externo - Recursos adicionales',
            description: 'Enlace a recursos complementarios en línea.',
            type: 'link',
            url: 'https://unad.edu.do/recursos',
            uploadedDate: DateTime.now().subtract(const Duration(days: 12)),
            professorName: widget.subject.professor,
            size: 0,
            unit: 'Unidad 1',
            topic: 'Fundamentos',
          ),
        ],
      ),
      MaterialUnit(
        id: 'u2',
        subjectId: widget.subject.id,
        name: 'Unidad 2: Estructuras de Datos',
        order: 2,
        materials: [
          CourseMaterial(
            id: 'm5',
            subjectId: widget.subject.id,
            title: 'Documento de teoría',
            description: 'Material teórico sobre estructuras de datos.',
            type: 'pdf',
            url: 'https://example.com/teoria.pdf',
            uploadedDate: DateTime.now().subtract(const Duration(days: 8)),
            professorName: widget.subject.professor,
            size: 1500,
            unit: 'Unidad 2',
            topic: 'Estructuras de Datos',
          ),
          CourseMaterial(
            id: 'm6',
            subjectId: widget.subject.id,
            title: 'Presentación práctica',
            description: 'Ejemplos prácticos de implementación.',
            type: 'pdf',
            url: 'https://example.com/practica.pdf',
            uploadedDate: DateTime.now().subtract(const Duration(days: 7)),
            professorName: widget.subject.professor,
            size: 1800,
            unit: 'Unidad 2',
            topic: 'Estructuras de Datos',
          ),
          CourseMaterial(
            id: 'm7',
            subjectId: widget.subject.id,
            title: 'Ejercicios resueltos',
            description: 'Colección de ejercicios con soluciones.',
            type: 'pdf',
            url: 'https://example.com/ejercicios.pdf',
            uploadedDate: DateTime.now().subtract(const Duration(days: 6)),
            professorName: widget.subject.professor,
            size: 2200,
            unit: 'Unidad 2',
            topic: 'Estructuras de Datos',
          ),
          CourseMaterial(
            id: 'm8',
            subjectId: widget.subject.id,
            title: 'Video tutorial - Listas',
            description: 'Tutorial sobre implementación de listas.',
            type: 'video',
            url: 'https://example.com/listas.mp4',
            uploadedDate: DateTime.now().subtract(const Duration(days: 5)),
            professorName: widget.subject.professor,
            size: 35000,
            unit: 'Unidad 2',
            topic: 'Estructuras de Datos',
          ),
        ],
      ),
    ];

    _notifications = [
      VirtualClassroomNotification(
        id: 'n1',
        subjectId: widget.subject.id,
        subjectName: widget.subject.name,
        type: NotificationType.announcement,
        title: 'Nuevo anuncio publicado',
        message: 'Bienvenidos al curso de ${widget.subject.name}.',
        date: DateTime.now().subtract(const Duration(hours: 2)),
        isRead: false,
      ),
      VirtualClassroomNotification(
        id: 'n2',
        subjectId: widget.subject.id,
        subjectName: widget.subject.name,
        type: NotificationType.assignment,
        title: 'Tarea creada',
        message: 'Se ha creado la Tarea 1: Introducción.',
        date: DateTime.now().subtract(const Duration(days: 3)),
        isRead: true,
      ),
    ];
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('No se pudo abrir $url')),
        );
      }
    }
  }

  void _showNotifications() {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
              ),
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 48,
                      height: 4,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE0E0E0),
                        borderRadius: BorderRadius.circular(999),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Notificaciones',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFF173726),
                        ),
                      ),
                      if (_notifications.any((n) => !n.isRead))
                        TextButton(
                          onPressed: () {
                            setState(() {
                              for (var n in _notifications) {
                                n.isRead = true;
                              }
                            });
                            setModalState(() {});
                          },
                          child: const Text(
                            'Marcar todo como leído',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF0E5A38),
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  if (_notifications.isEmpty)
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 32),
                      child: Center(
                        child: Text(
                          'No hay notificaciones',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            color: Color(0xFF62716A),
                          ),
                        ),
                      ),
                    )
                  else
                    Flexible(
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemCount: _notifications.length,
                        separatorBuilder: (context, index) => const Divider(height: 1),
                        itemBuilder: (context, index) {
                          final notification = _notifications[index];
                          return ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: notification.color.withValues(alpha: 0.12),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(notification.icon, color: notification.color, size: 20),
                            ),
                            title: Text(
                              notification.title,
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: notification.isRead ? FontWeight.w600 : FontWeight.w800,
                                color: const Color(0xFF173726),
                              ),
                            ),
                            subtitle: Text(
                              notification.message,
                              style: const TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 13,
                                color: Color(0xFF62716A),
                              ),
                            ),
                            trailing: !notification.isRead
                                ? Container(
                                    width: 8,
                                    height: 8,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFFC03A2B),
                                      shape: BoxShape.circle,
                                    ),
                                  )
                                : null,
                            onTap: () {
                              setState(() {
                                notification.isRead = true;
                              });
                              setModalState(() {});
                            },
                          );
                        },
                      ),
                    ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F8F5),
      body: Column(
        children: [
          // Header
          _buildHeader(),
          // Tabs
          _buildTabBar(),
          // Tab content
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildPostsTab(),
                _buildAssignmentsTab(),
                _buildMaterialsTab(),
                _buildGradesTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
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
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.subject.name,
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.subject.professor,
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        color: Color(0xFFB0D4BC),
                      ),
                    ),
                  ],
                ),
              ),
              Stack(
                children: [
                  IconButton(
                    onPressed: () => _showNotifications(),
                    icon: const Icon(Icons.notifications_outlined, color: Colors.white),
                  ),
                  if (_notifications.any((n) => !n.isRead))
                    Positioned(
                      right: 8,
                      top: 8,
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: Color(0xFFC03A2B),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _buildInfoChip('Código: ${widget.subject.code}'),
              const SizedBox(width: 8),
              _buildInfoChip('${widget.subject.credits} Créditos'),
              const SizedBox(width: 8),
              if (widget.subject.isLive)
                _buildLiveChip(),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildQuickButton(
                  icon: Icons.class_outlined,
                  label: 'Classroom',
                  color: const Color(0xFF0E5A38),
                  onTap: () => _launchUrl(widget.subject.classroomUrl),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildQuickButton(
                  icon: Icons.videocam_outlined,
                  label: 'Google Meet',
                  color: const Color(0xFF2458A6),
                  onTap: () => _launchUrl(widget.subject.meetUrl),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoChip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontFamily: 'Inter',
          fontSize: 12,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildLiveChip() {
    return Container(
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
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: color.withValues(alpha: 0.5)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 18, color: Colors.white),
              const SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      color: Colors.white,
      child: TabBar(
        controller: _tabController,
        isScrollable: true,
        labelColor: const Color(0xFF0E5A38),
        unselectedLabelColor: const Color(0xFF62716A),
        indicatorColor: const Color(0xFF0E5A38),
        tabs: const [
          Tab(text: 'Publicaciones'),
          Tab(text: 'Tareas'),
          Tab(text: 'Material de clase'),
          Tab(text: 'Calificaciones'),
        ],
      ),
    );
  }

  Widget _buildPostsTab() {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        ..._announcements.map((announcement) => _PostCard(
              announcement: announcement,
              onAddComment: () => _showAddCommentDialog(announcement),
            )),
      ],
    );
  }

  Widget _buildMaterialsTab() {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        ..._materialUnits.map((unit) => _MaterialUnitCard(
              unit: unit,
              onMaterialTap: (material) => _launchUrl(material.url),
            )),
      ],
    );
  }

  Widget _buildAssignmentsTab() {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        ..._assignments.map((assignment) => _AssignmentCard(
              assignment: assignment,
              onTap: () => _showAssignmentDetail(assignment),
            )),
      ],
    );
  }

  Widget _buildGradesTab() {
    final averageScore = _grades.isEmpty 
        ? 0.0 
        : _grades.map((g) => g.percentage).reduce((a, b) => a + b) / _grades.length;
    
    return Column(
      children: [
        // Summary card
        Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFF0E5A38),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              const Text(
                'Promedio General',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '${averageScore.toStringAsFixed(1)}%',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '${_grades.length} actividades calificadas',
                style: const TextStyle(
                  color: Color(0xFFB0D4BC),
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
        // Grades list
        Expanded(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            children: [
              ..._grades.map((grade) => _GradeCard(grade: grade)),
            ],
          ),
        ),
      ],
    );
  }

  void _showAddCommentDialog(Announcement announcement) {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Agregar comentario'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            hintText: 'Escribe tu comentario...',
            border: OutlineInputBorder(),
          ),
          maxLines: 3,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () {
              if (controller.text.isNotEmpty) {
                setState(() {
                  final newComment = PostComment(
                    id: DateTime.now().millisecondsSinceEpoch.toString(),
                    postId: announcement.id,
                    authorName: 'Estudiante',
                    authorRole: 'student',
                    content: controller.text,
                    date: DateTime.now(),
                  );
                  try {
                    announcement.comments.add(newComment);
                  } catch (e) {
                    debugPrint('No se pudo agregar comentario a la lista inmutable: $e');
                  }
                });
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Comentario agregado')),
                );
              }
            },
            style: FilledButton.styleFrom(
              backgroundColor: const Color(0xFF0E5A38),
            ),
            child: const Text('Publicar'),
          ),
        ],
      ),
    );
  }

  void _showAssignmentDetail(Assignment assignment) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => _AssignmentDetailPage(
          assignment: assignment,
          subject: widget.subject,
          onUpdate: () {
            setState(() {});
          },
        ),
      ),
    );
  }
}

// ─── Assignment Detail Page ─────────────────────────────────────────────

class _AssignmentDetailPage extends StatefulWidget {
  final Assignment assignment;
  final Subject subject;
  final VoidCallback onUpdate;

  const _AssignmentDetailPage({
    required this.assignment,
    required this.subject,
    required this.onUpdate,
  });

  @override
  State<_AssignmentDetailPage> createState() => _AssignmentDetailPageState();
}

class _AssignmentDetailPageState extends State<_AssignmentDetailPage> {
  final _commentController = TextEditingController();
  final List<String> _uploadedFiles = [];

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  String _getStatusText(String status) {
    switch (status) {
      case 'pending':
        return 'Pendiente';
      case 'submitted':
        return 'Entregada';
      case 'graded':
        return 'Calificada';
      case 'late':
        return 'Vencida';
      default:
        return status;
    }
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'pending':
        return const Color(0xFFF57C00);
      case 'submitted':
        return const Color(0xFF2458A6);
      case 'graded':
        return const Color(0xFF0E5A38);
      case 'late':
        return const Color(0xFFC03A2B);
      default:
        return const Color(0xFF62716A);
    }
  }

  void _submitAssignment() {
    setState(() {
      widget.assignment.status = 'submitted';
      widget.assignment.submission = AssignmentSubmission(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        assignmentId: widget.assignment.id,
        files: List.from(_uploadedFiles),
        privateComment: _commentController.text.isNotEmpty 
            ? _commentController.text 
            : null,
        submittedAt: DateTime.now(),
      );
    });
    widget.onUpdate();
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Tarea entregada exitosamente')),
    );
  }

  void _cancelSubmission() {
    setState(() {
      widget.assignment.status = 'pending';
      widget.assignment.submission = null;
      _uploadedFiles.clear();
      _commentController.clear();
    });
    widget.onUpdate();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Entrega cancelada')),
    );
  }

  void _addFile() {
    // In a real app, this would use file_picker
    setState(() {
      _uploadedFiles.add('archivo_${_uploadedFiles.length + 1}.pdf');
    });
  }

  void _removeFile(int index) {
    setState(() {
      _uploadedFiles.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F8F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0E5A38),
        title: Text(widget.assignment.title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Status badge
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: _getStatusColor(widget.assignment.status).withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    _getStatusIcon(widget.assignment.status),
                    size: 18,
                    color: _getStatusColor(widget.assignment.status),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    _getStatusText(widget.assignment.status),
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: _getStatusColor(widget.assignment.status),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Assignment info
            _buildInfoCard(),
            const SizedBox(height: 20),
            // Instructions
            if (widget.assignment.instructions != null) ...[
              _buildSectionCard(
                title: 'Instrucciones',
                icon: Icons.info_outline,
                content: widget.assignment.instructions!,
              ),
              const SizedBox(height: 20),
            ],
            // Attachments
            if (widget.assignment.attachments.isNotEmpty) ...[
              _buildAttachmentsCard(),
              const SizedBox(height: 20),
            ],
            // Submission section
            if (widget.assignment.status == 'graded')
              _buildGradedCard()
            else
              _buildSubmissionCard(),
          ],
        ),
      ),
    );
  }

  IconData _getStatusIcon(String status) {
    switch (status) {
      case 'pending':
        return Icons.pending;
      case 'submitted':
        return Icons.check_circle;
      case 'graded':
        return Icons.emoji_events;
      case 'late':
        return Icons.warning;
      default:
        return Icons.help;
    }
  }

  Widget _buildInfoCard() {
    return Container(
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
          const Text(
            'Información de la tarea',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF173726),
            ),
          ),
          const SizedBox(height: 16),
          _buildInfoRow('Descripción', widget.assignment.description),
          const SizedBox(height: 12),
          _buildInfoRow(
            'Fecha de entrega',
            DateFormat('dd/MM/yyyy').format(widget.assignment.dueDate),
          ),
          if (widget.assignment.dueTime != null) ...[
            const SizedBox(height: 12),
            _buildInfoRow('Hora límite', widget.assignment.dueTime!),
          ],
          const SizedBox(height: 12),
          _buildInfoRow(
            'Fecha de publicación',
            DateFormat('dd/MM/yyyy').format(widget.assignment.postedDate ?? DateTime.now()),
          ),
          const SizedBox(height: 12),
          _buildInfoRow(
            'Puntuación máxima',
            '${widget.assignment.maxScore} puntos',
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 120,
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              color: Color(0xFF62716A),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 13,
              color: Color(0xFF173726),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSectionCard({
    required String title,
    required IconData icon,
    required String content,
  }) {
    return Container(
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
            children: [
              Icon(icon, color: const Color(0xFF0E5A38)),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF173726),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            content,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF4A5568),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAttachmentsCard() {
    return Container(
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
          const Row(
            children: [
              Icon(Icons.attach_file, color: Color(0xFF0E5A38)),
              SizedBox(width: 8),
              Text(
                'Archivos proporcionados',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF173726),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...widget.assignment.attachments.map((file) => Container(
                margin: const EdgeInsets.only(bottom: 8),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFF9F8F5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.picture_as_pdf, size: 20, color: Color(0xFFC03A2B)),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        file,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF173726),
                        ),
                      ),
                    ),
                    const Icon(Icons.download, color: Color(0xFF0E5A38)),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildSubmissionCard() {
    final isSubmitted = widget.assignment.status == 'submitted';
    final submission = widget.assignment.submission;

    return Container(
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
          const Row(
            children: [
              Icon(Icons.upload_file, color: Color(0xFF0E5A38)),
              SizedBox(width: 8),
              Text(
                'Mi entrega',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF173726),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          if (isSubmitted && submission != null) ...[
            // Show submitted files
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFE8F4EC),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.check_circle, color: Color(0xFF0E5A38)),
                      const SizedBox(width: 8),
                      const Text(
                        'Entregada',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0E5A38),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        DateFormat('dd/MM/yyyy HH:mm').format(submission.submittedAt),
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF62716A),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  ...submission.files.map((file) => Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          children: [
                            const Icon(Icons.insert_drive_file, size: 18, color: Color(0xFF62716A)),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                file,
                                style: const TextStyle(fontSize: 13),
                              ),
                            ),
                          ],
                        ),
                      )),
                  if (submission.privateComment != null) ...[
                    const SizedBox(height: 12),
                    const Text(
                      'Comentario privado:',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF62716A),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      submission.privateComment!,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xFF173726),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 16),
            if (widget.assignment.allowModifications)
              OutlinedButton.icon(
                onPressed: _cancelSubmission,
                icon: const Icon(Icons.cancel),
                label: const Text('Cancelar entrega'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFFC03A2B),
                  side: const BorderSide(color: Color(0xFFC03A2B)),
                ),
              ),
          ] else ...[
            // Upload form
            if (_uploadedFiles.isEmpty) ...[
              InkWell(
                onTap: _addFile,
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF9F8F5),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: const Color(0xFFD4DDD6),
                      style: BorderStyle.solid,
                    ),
                  ),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.cloud_upload_outlined,
                        size: 48,
                        color: Color(0xFF62716A),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Subir archivos',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF173726),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'PDF, DOC, DOCX, ZIP',
                        style: TextStyle(
                          fontSize: 12,
                          color: const Color(0xFF62716A).withValues(alpha: 0.7),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ] else ...[
              // Show uploaded files
              ..._uploadedFiles.asMap().entries.map((entry) => Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE8F4EC),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.insert_drive_file, size: 18, color: Color(0xFF0E5A38)),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            entry.value,
                            style: const TextStyle(fontSize: 13),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close, size: 18),
                          onPressed: () => _removeFile(entry.key),
                          color: const Color(0xFFC03A2B),
                        ),
                      ],
                    ),
                  )),
              const SizedBox(height: 8),
              InkWell(
                onTap: _addFile,
                child: const Text(
                  '+ Agregar otro archivo',
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xFF0E5A38),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
            const SizedBox(height: 16),
            // Private comment
            TextField(
              controller: _commentController,
              decoration: InputDecoration(
                labelText: 'Comentario privado al profesor (opcional)',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                contentPadding: const EdgeInsets.all(16),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 16),
            // Submit button
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: _uploadedFiles.isEmpty ? null : _submitAssignment,
                style: FilledButton.styleFrom(
                  backgroundColor: const Color(0xFF0E5A38),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  disabledBackgroundColor: const Color(0xFF62716A).withValues(alpha: 0.3),
                ),
                child: const Text(
                  'Entregar tarea',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildGradedCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFE8F4EC),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF0E5A38)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.emoji_events, color: Color(0xFF0E5A38)),
              SizedBox(width: 8),
              Text(
                'Calificación',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0E5A38),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Text(
                  '${widget.assignment.obtainedScore}/${widget.assignment.maxScore}',
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF0E5A38),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '${((widget.assignment.obtainedScore! / widget.assignment.maxScore) * 100).toStringAsFixed(1)}%',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF62716A),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          if (widget.assignment.feedback != null) ...[
            const Text(
              'Retroalimentación:',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xFF173726),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.assignment.feedback!,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF4A5568),
                height: 1.5,
              ),
            ),
          ],
          const SizedBox(height: 16),
          if (widget.assignment.gradedDate != null)
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 16, color: Color(0xFF62716A)),
                const SizedBox(width: 8),
                Text(
                  'Calificada el ${DateFormat('dd/MM/yyyy').format(widget.assignment.gradedDate!)}',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF62716A),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

// ─── Card Widgets ─────────────────────────────────────────────────────

class _PostCard extends StatelessWidget {
  final Announcement announcement;
  final VoidCallback onAddComment;

  const _PostCard({
    required this.announcement,
    required this.onAddComment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
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
          // Header with author and date
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: const Color(0xFF0E5A38).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const Icon(Icons.person, color: Color(0xFF0E5A38)),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          announcement.professorName,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF173726),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: const Color(0xFF0E5A38),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Text(
                            'Profesor',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      DateFormat('dd MMM yyyy, HH:mm').format(announcement.date),
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF62716A),
                      ),
                    ),
                  ],
                ),
              ),
              if (announcement.isPinned)
                const Icon(Icons.push_pin, color: Color(0xFF0E5A38)),
            ],
          ),
          const SizedBox(height: 16),
          // Title
          Text(
            announcement.title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF173726),
            ),
          ),
          const SizedBox(height: 12),
          // Content
          Text(
            announcement.content,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF4A5568),
              height: 1.5,
            ),
          ),
          // Attachments
          if (announcement.attachments.isNotEmpty) ...[
            const SizedBox(height: 12),
            ...announcement.attachments.map((file) => Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF9F8F5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.attach_file, size: 18, color: Color(0xFF62716A)),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          file,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Color(0xFF173726),
                          ),
                        ),
                      ),
                      const Icon(Icons.download, size: 18, color: Color(0xFF0E5A38)),
                    ],
                  ),
                )),
          ],
          // Videos
          if (announcement.videoUrls.isNotEmpty) ...[
            const SizedBox(height: 12),
            ...announcement.videoUrls.map((url) => Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  height: 120,
                  decoration: BoxDecoration(
                    color: const Color(0xFF0E5A38).withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.play_circle_outline, size: 48, color: Color(0xFF0E5A38)),
                        SizedBox(width: 12),
                        Text(
                          'Video',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF0E5A38),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
          ],
          // Links
          if (announcement.links.isNotEmpty) ...[
            const SizedBox(height: 12),
            ...announcement.links.map((link) => Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE3F2FD),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.link, size: 18, color: Color(0xFF2458A6)),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          link,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Color(0xFF2458A6),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Icon(Icons.open_in_new, size: 16, color: Color(0xFF2458A6)),
                    ],
                  ),
                )),
          ],
          // Comments section
          if (announcement.allowComments) ...[
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 12),
            // Show existing comments
            if (announcement.comments.isNotEmpty) ...[
              ...announcement.comments.take(2).map((comment) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: _CommentItem(comment: comment),
                  )),
              if (announcement.comments.length > 2)
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Text(
                    'Ver ${announcement.comments.length - 2} comentarios más',
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFF2458A6),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
            ],
            // Add comment button
            InkWell(
              onTap: onAddComment,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: const Color(0xFFF9F8F5),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.comment_outlined, size: 20, color: Color(0xFF62716A)),
                    const SizedBox(width: 12),
                    const Text(
                      'Agregar un comentario...',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF62716A),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _CommentItem extends StatelessWidget {
  final PostComment comment;

  const _CommentItem({required this.comment});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF9F8F5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                comment.authorName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  color: Color(0xFF173726),
                ),
              ),
              const SizedBox(width: 8),
              if (comment.authorRole == 'professor')
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0E5A38),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    'Profesor',
                    style: TextStyle(
                      fontSize: 9,
                      color: Colors.white,
                    ),
                  ),
                ),
              const Spacer(),
              Text(
                DateFormat('dd MMM, HH:mm').format(comment.date),
                style: const TextStyle(
                  fontSize: 11,
                  color: Color(0xFF62716A),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            comment.content,
            style: const TextStyle(
              fontSize: 13,
              color: Color(0xFF4A5568),
            ),
          ),
        ],
      ),
    );
  }
}

class _MaterialUnitCard extends StatelessWidget {
  final MaterialUnit unit;
  final Function(CourseMaterial) onMaterialTap;

  const _MaterialUnitCard({
    required this.unit,
    required this.onMaterialTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
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
          // Unit header
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFF0E5A38),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.folder_open,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    unit.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '${unit.materials.length} recursos',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Materials list
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: unit.materials.map((material) => _MaterialItem(
                    material: material,
                    onTap: () => onMaterialTap(material),
                  )).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class _MaterialItem extends StatelessWidget {
  final CourseMaterial material;
  final VoidCallback onTap;

  const _MaterialItem({
    required this.material,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    IconData typeIcon;
    Color typeColor;
    
    switch (material.type) {
      case 'pdf':
        typeIcon = Icons.picture_as_pdf;
        typeColor = const Color(0xFFC03A2B);
        break;
      case 'video':
        typeIcon = Icons.play_circle;
        typeColor = const Color(0xFF2458A6);
        break;
      case 'link':
        typeIcon = Icons.link;
        typeColor = const Color(0xFF7E5B1A);
        break;
      default:
        typeIcon = Icons.insert_drive_file;
        typeColor = const Color(0xFF0E5A38);
    }

    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFF9F8F5),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: typeColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(typeIcon, color: typeColor, size: 24),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    material.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF173726),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    material.description,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF62716A),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (material.size > 0) ...[
                    const SizedBox(height: 4),
                    Text(
                      material.size > 1024 
                          ? "${(material.size / 1024).toStringAsFixed(1)} MB"
                          : "${material.size} KB",
                      style: const TextStyle(
                        fontSize: 11,
                        color: Color(0xFF62716A),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            const Icon(Icons.download, color: Color(0xFF0E5A38)),
          ],
        ),
      ),
    );
  }
}


class _AssignmentCard extends StatelessWidget {
  final Assignment assignment;
  final VoidCallback onTap;

  const _AssignmentCard({required this.assignment, required this.onTap});

  @override
  Widget build(BuildContext context) {
    Color statusColor;
    String statusText;

    switch (assignment.status) {
      case 'pending':
        statusColor = const Color(0xFFF57C00);
        statusText = 'Pendiente';
        break;
      case 'submitted':
        statusColor = const Color(0xFF2458A6);
        statusText = 'Entregada';
        break;
      case 'graded':
        statusColor = const Color(0xFF0E5A38);
        statusText = 'Calificada';
        break;
      case 'late':
        statusColor = const Color(0xFFC03A2B);
        statusText = 'Vencida';
        break;
      default:
        statusColor = const Color(0xFF62716A);
        statusText = assignment.status;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
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
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    assignment.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF173726),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: statusColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    statusText,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: statusColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              assignment.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Color(0xFF62716A)),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 14, color: Color(0xFF62716A)),
                const SizedBox(width: 4),
                Text(
                  'Entrega: ${DateFormat('dd/MM/yyyy').format(assignment.dueDate)}',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF62716A),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _GradeCard extends StatelessWidget {
  final Grade grade;

  const _GradeCard({required this.grade});

  @override
  Widget build(BuildContext context) {
    final percentage = grade.percentage;
    Color gradeColor;

    if (percentage >= 90) {
      gradeColor = const Color(0xFF0E5A38);
    } else if (percentage >= 70) {
      gradeColor = const Color(0xFF2458A6);
    } else if (percentage >= 60) {
      gradeColor = const Color(0xFFF57C00);
    } else {
      gradeColor = const Color(0xFFC03A2B);
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
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
          Row(
            children: [
              Expanded(
                child: Text(
                  grade.assignmentName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF173726),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: gradeColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '${grade.score}/${grade.maxScore}',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: gradeColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          if (grade.feedback != null)
            Text(
              grade.feedback!,
              style: const TextStyle(
                fontSize: 13,
                color: Color(0xFF62716A),
              ),
            ),
          const SizedBox(height: 8),
          Text(
            DateFormat('dd/MM/yyyy').format(grade.gradedDate),
            style: const TextStyle(
              fontSize: 11,
              color: Color(0xFF62716A),
            ),
          ),
        ],
      ),
    );
  }
}

