part of '../../main.dart';

class _FeatureDetailPage extends StatefulWidget {
  const _FeatureDetailPage({required this.feature});

  final QuickFeature feature;

  @override
  State<_FeatureDetailPage> createState() => _FeatureDetailPageState();
}

class _FeatureDetailPageState extends State<_FeatureDetailPage> {
  final Set<String> _selectedPaymentMethods = {'Tarjeta'};
  final Set<String> _selectedServices = {'Laboratorio', 'Biblioteca'};
  final Set<String> _selectedSubjects = {
    'Programación II',
    'Sistemas Operativos',
  };
  final Set<String> _favoriteNews = {'Nueva convocatoria de becas'};
  final TextEditingController _chatController = TextEditingController();
  final TextEditingController _libraryController = TextEditingController();
  final TextEditingController _recordSearchController = TextEditingController();
  final TextEditingController _reportController = TextEditingController();

  bool _tuitionPaid = false;
  bool _showDebtView = false;
  bool _showStatementExport = false;
  bool _weeklyReminder = true;
  bool _autoSearch = false;
  bool _isLoading = false;
  int _selectedCredits = 15;
  int _statementRangeIndex = 0;
  int _calendarFilterIndex = 0;
  double _scoreProgress = 0.82;

  final List<_SelectableSubject> _availableSubjects = const [
    _SelectableSubject('Programación II', 4, 'Lab 204', 'Lun 8:00'),
    _SelectableSubject('Sistemas Operativos', 3, 'Lab 108', 'Mié 10:00'),
    _SelectableSubject('Ingeniería de Software', 3, 'Aula 312', 'Vie 1:00'),
    _SelectableSubject('Redes de Computadoras', 4, 'Lab 204', 'Mar 2:00'),
    _SelectableSubject('Desarrollo Web', 2, 'Lab 301', 'Jue 11:00'),
  ];

  final List<_ChatMessage> _messages = [
    _ChatMessage(author: 'Soporte', text: 'Hola, ¿en qué podemos ayudarte?'),
    _ChatMessage(
      author: 'Berny',
      text: 'Necesito ayuda con un pago pendiente.',
    ),
  ];

  @override
  void dispose() {
    _chatController.dispose();
    _libraryController.dispose();
    _recordSearchController.dispose();
    _reportController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const _DashboardBackground(),
          SafeArea(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
              children: [
                Row(
                  children: [
                    IconButton.filledTonal(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.arrow_back),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        widget.feature.title,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFF173726),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                _FeatureHero(feature: widget.feature),
                const SizedBox(height: 16),
                ..._buildSections(context),
              ],
            ),
          ),
          if (_isLoading)
            Container(
              color: Colors.white.withValues(alpha: 0.6),
              child: const Center(
                child: CircularProgressIndicator(color: Color(0xFF0E5A38)),
              ),
            ),
        ],
      ),
    );
  }

  List<Widget> _buildSections(BuildContext context) {
    switch (widget.feature) {
      case QuickFeature.tuition:
        return [
          _TuitionSection(
            paid: _tuitionPaid,
            selectedMethods: _selectedPaymentMethods,
            onToggleMethod: _togglePaymentMethod,
            onPay: () => _mockAction(() => setState(() => _tuitionPaid = true)),
          ),
          const SizedBox(height: 12),
          const _PaymentMethodsCard(),
        ];
      case QuickFeature.credits:
        return [
          _CreditsInteractiveSection(
            selectedCredits: _selectedCredits,
            onChanged: (value) => setState(() => _selectedCredits = value),
          ),
        ];
      case QuickFeature.services:
        return [
          _ServicesInteractiveSection(
            selectedServices: _selectedServices,
            onToggle: _toggleService,
            onPay: () =>
                _mockAction(() => _showSnackBar('Servicios pagados con éxito')),
          ),
        ];
      case QuickFeature.balance:
        return [
          _BalanceInteractiveSection(
            showDebtView: _showDebtView,
            onToggleView: (value) => setState(() => _showDebtView = value),
          ),
        ];
      case QuickFeature.accountStatement:
        return [
          _StatementInteractiveSection(
            rangeIndex: _statementRangeIndex,
            onRangeChanged: (index) =>
                setState(() => _statementRangeIndex = index),
            exported: _showStatementExport,
            onExport: () =>
                _mockAction(() => setState(() => _showStatementExport = true)),
          ),
        ];
      case QuickFeature.subjectSelection:
        return [
          _SubjectSelectionSection(
            availableSubjects: _availableSubjects,
            selectedSubjects: _selectedSubjects,
            onToggle: _toggleSubject,
          ),
        ];
      case QuickFeature.schedule:
        return [
          _ScheduleInteractiveSection(
            reminderEnabled: _weeklyReminder,
            onToggleReminder: (value) =>
                setState(() => _weeklyReminder = value),
          ),
        ];
      case QuickFeature.academicRecord:
        return [
          _RecordInteractiveSection(
            controller: _recordSearchController,
            onSearch: () => setState(() {}),
          ),
        ];
      case QuickFeature.academicScore:
        return [
          _ScoreInteractiveSection(
            progress: _scoreProgress,
            onProgressChanged: (value) =>
                setState(() => _scoreProgress = value),
          ),
        ];
      case QuickFeature.pensum:
        return const [_PensumCard()];
      case QuickFeature.news:
        return [
          _NewsInteractiveSection(
            favoriteNews: _favoriteNews,
            onToggleFavorite: _toggleFavoriteNews,
          ),
        ];
      case QuickFeature.academicCalendar:
        return [
          _CalendarInteractiveSection(
            filterIndex: _calendarFilterIndex,
            onFilterChanged: (index) =>
                setState(() => _calendarFilterIndex = index),
          ),
        ];
      case QuickFeature.virtualLibrary:
        return [
          _LibraryInteractiveSection(
            controller: _libraryController,
            autoSearch: _autoSearch,
            onToggleAutoSearch: (value) => setState(() => _autoSearch = value),
            onSearch: () => _showSnackBar('Búsqueda lista en biblioteca'),
          ),
        ];
      case QuickFeature.campusVirtual:
        return [_CampusVirtualInteractiveSection(onLaunch: _showSnackBar)];
      case QuickFeature.support:
        return [
          _SupportInteractiveSection(
            controller: _chatController,
            messages: _messages,
            onSend: _sendMessage,
          ),
        ];
    }
  }

  void _togglePaymentMethod(String method) {
    setState(() {
      if (_selectedPaymentMethods.contains(method)) {
        _selectedPaymentMethods.remove(method);
      } else {
        _selectedPaymentMethods.add(method);
      }
    });
  }

  void _toggleService(String service) {
    setState(() {
      if (_selectedServices.contains(service)) {
        _selectedServices.remove(service);
      } else {
        _selectedServices.add(service);
      }
    });
  }

  void _toggleSubject(String subject) {
    setState(() {
      if (_selectedSubjects.contains(subject)) {
        _selectedSubjects.remove(subject);
      } else {
        _selectedSubjects.add(subject);
      }
    });
  }

  void _toggleFavoriteNews(String title) {
    setState(() {
      if (_favoriteNews.contains(title)) {
        _favoriteNews.remove(title);
      } else {
        _favoriteNews.add(title);
      }
    });
  }

  void _sendMessage() {
    final message = _chatController.text.trim();
    if (message.isEmpty) {
      return;
    }
    _mockAction(() {
      setState(() {
        _messages.add(_ChatMessage(author: 'Berny', text: message));
        _chatController.clear();
      });
    });
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> _mockAction(void Function() action) async {
    setState(() => _isLoading = true);
    await Future<void>.delayed(const Duration(milliseconds: 1200));
    action();
    if (mounted) {
      setState(() => _isLoading = false);
    }
  }
}

class _TuitionSection extends StatelessWidget {
  const _TuitionSection({
    required this.paid,
    required this.selectedMethods,
    required this.onToggleMethod,
    required this.onPay,
  });

  final bool paid;
  final Set<String> selectedMethods;
  final ValueChanged<String> onToggleMethod;
  final VoidCallback onPay;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TuitionCard(
          paid: paid,
          onPay: onPay,
          selectedMethods: selectedMethods,
          onToggleMethod: onToggleMethod,
        ),
        const SizedBox(height: 12),
        const _PaymentMethodsCard(),
      ],
    );
  }
}

class _CreditsInteractiveSection extends StatelessWidget {
  const _CreditsInteractiveSection({
    required this.selectedCredits,
    required this.onChanged,
  });

  final int selectedCredits;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    final total = selectedCredits * 950;
    return _GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Pago de créditos',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Color(0xFF173726),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Créditos inscritos: $selectedCredits',
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              color: Color(0xFF173726),
            ),
          ),
          Slider(
            min: 0,
            max: 20,
            divisions: 20,
            value: selectedCredits.toDouble(),
            activeColor: const Color(0xFF0E5A38),
            onChanged: (value) => onChanged(value.round()),
          ),
          _SummaryLine(label: 'Precio por crédito', value: 'RD\$ 950'),
          _SummaryLine(label: 'Total', value: 'RD\$ $total'),
          const _SummaryLine(
            label: 'Estado del pago',
            value: 'Pendiente parcial',
          ),
          const SizedBox(height: 8),
          _ActionPill(label: 'Generar factura', icon: Icons.receipt_outlined),
        ],
      ),
    );
  }
}

class _ServicesInteractiveSection extends StatelessWidget {
  const _ServicesInteractiveSection({
    required this.selectedServices,
    required this.onToggle,
    required this.onPay,
  });

  final Set<String> selectedServices;
  final ValueChanged<String> onToggle;
  final VoidCallback onPay;

  @override
  Widget build(BuildContext context) {
    final options = [
      'Laboratorio',
      'Biblioteca',
      'Carnet',
      'Graduación',
      'Constancias',
      'Certificaciones',
      'Reposición de carnet',
    ];
    final total = selectedServices.length * 350;
    return _GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Pago de servicios',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Color(0xFF173726),
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: options
                .map(
                  (service) => FilterChip(
                    label: Text(service),
                    selected: selectedServices.contains(service),
                    onSelected: (_) => onToggle(service),
                    selectedColor: const Color(0xFFE7F5EC),
                    checkmarkColor: const Color(0xFF0E5A38),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 12),
          Text(
            'Servicios seleccionados: ${selectedServices.length}',
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
          _SummaryLine(label: 'Total estimado', value: 'RD\$ $total'),
          const SizedBox(height: 8),
          _ActionPill(label: 'Pagar servicios', icon: Icons.payments_outlined),
          const SizedBox(height: 10),
          FilledButton(onPressed: onPay, child: const Text('Confirmar pago')),
        ],
      ),
    );
  }
}

class _BalanceInteractiveSection extends StatelessWidget {
  const _BalanceInteractiveSection({
    required this.showDebtView,
    required this.onToggleView,
  });

  final bool showDebtView;
  final ValueChanged<bool> onToggleView;

  @override
  Widget build(BuildContext context) {
    return _GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Balance actual',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF173726),
                  ),
                ),
              ),
              Switch(value: showDebtView, onChanged: onToggleView),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            showDebtView ? 'RD\$ 12,450' : 'RD\$ 0.00',
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.w900,
              color: showDebtView
                  ? const Color(0xFFC03A2B)
                  : const Color(0xFF0E5A38),
            ),
          ),
          const SizedBox(height: 10),
          SimpleLineChart(
            values: showDebtView
                ? const [0.7, 0.68, 0.72, 0.74, 0.8, 0.88, 0.92]
                : const [0.2, 0.22, 0.19, 0.3, 0.28, 0.24, 0.12],
          ),
          const SizedBox(height: 10),
          Text(
            showDebtView
                ? 'Estado con deuda pendiente.'
                : 'Cuenta al día y sin balance pendiente.',
            style: const TextStyle(fontSize: 12, color: Color(0xFF62716A)),
          ),
        ],
      ),
    );
  }
}

class _StatementInteractiveSection extends StatelessWidget {
  const _StatementInteractiveSection({
    required this.rangeIndex,
    required this.onRangeChanged,
    required this.exported,
    required this.onExport,
  });

  final int rangeIndex;
  final ValueChanged<int> onRangeChanged;
  final bool exported;
  final VoidCallback onExport;

  @override
  Widget build(BuildContext context) {
    final ranges = ['Este mes', 'Últimos 3 meses', 'Último año'];
    return _GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Estado de cuenta',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Color(0xFF173726),
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: List.generate(ranges.length, (index) {
              final selected = rangeIndex == index;
              return ChoiceChip(
                label: Text(ranges[index]),
                selected: selected,
                onSelected: (_) => onRangeChanged(index),
                selectedColor: const Color(0xFFE7F5EC),
              );
            }),
          ),
          const SizedBox(height: 12),
          const _TableHeader(columns: ['Fecha', 'Concepto', 'Cargo', 'Pago']),
          const _TableRowItem(values: ['01/08', 'Matrícula', '14,250', '0']),
          const _TableRowItem(values: ['03/08', 'Pago parcial', '0', '5,000']),
          const _TableRowItem(values: ['07/08', 'Balance', '0', '9,250']),
          if (exported) ...[
            const SizedBox(height: 12),
            const _StatusPill(
              label: 'PDF exportado',
              color: Color(0xFF1B7A4B),
              background: Color(0xFFE7F5EC),
            ),
          ],
          const SizedBox(height: 12),
          FilledButton.icon(
            onPressed: onExport,
            icon: const Icon(Icons.picture_as_pdf_outlined),
            label: const Text('Exportar PDF'),
          ),
        ],
      ),
    );
  }
}

class _SubjectSelectionSection extends StatelessWidget {
  const _SubjectSelectionSection({
    required this.availableSubjects,
    required this.selectedSubjects,
    required this.onToggle,
  });

  final List<_SelectableSubject> availableSubjects;
  final Set<String> selectedSubjects;
  final ValueChanged<String> onToggle;

  @override
  Widget build(BuildContext context) {
    final totalCredits = availableSubjects
        .where((subject) => selectedSubjects.contains(subject.name))
        .fold<int>(0, (sum, subject) => sum + subject.credits);
    final hasConflict = selectedSubjects.length > 3;

    return _GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Selección de materias',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Color(0xFF173726),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Total de créditos seleccionados: $totalCredits',
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 8),
          if (hasConflict)
            const _StatusPill(
              label: 'Validación: posible choque de horario',
              color: Color(0xFFC03A2B),
              background: Color(0xFFFCEAE8),
            )
          else
            const _StatusPill(
              label: 'Validación: sin conflictos',
              color: Color(0xFF1B7A4B),
              background: Color(0xFFE7F5EC),
            ),
          const SizedBox(height: 12),
          ...availableSubjects.map((subject) {
            final selected = selectedSubjects.contains(subject.name);
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: _SelectableSubjectCard(
                subject: subject,
                selected: selected,
                onToggle: () => onToggle(subject.name),
              ),
            );
          }),
          const SizedBox(height: 8),
          _ActionPill(
            label: 'Inscribir materias',
            icon: Icons.playlist_add_check_outlined,
          ),
        ],
      ),
    );
  }
}

class _SelectableSubjectCard extends StatelessWidget {
  const _SelectableSubjectCard({
    required this.subject,
    required this.selected,
    required this.onToggle,
  });

  final _SelectableSubject subject;
  final bool selected;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: selected ? const Color(0xFFE7F5EC) : const Color(0xFFF8FBF8),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: selected ? const Color(0xFF1B7A4B) : const Color(0xFFE2ECE4),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subject.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF173726),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${subject.credits} créditos · ${subject.time} · ${subject.room}',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF62716A),
                  ),
                ),
              ],
            ),
          ),
          FilledButton.tonal(
            onPressed: onToggle,
            child: Text(selected ? 'Quitar' : 'Agregar'),
          ),
        ],
      ),
    );
  }
}

class _ScheduleInteractiveSection extends StatelessWidget {
  const _ScheduleInteractiveSection({
    required this.reminderEnabled,
    required this.onToggleReminder,
  });

  final bool reminderEnabled;
  final ValueChanged<bool> onToggleReminder;

  @override
  Widget build(BuildContext context) {
    return _GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Horario semanal',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF173726),
                  ),
                ),
              ),
              Switch(value: reminderEnabled, onChanged: onToggleReminder),
            ],
          ),
          const SizedBox(height: 8),
          const _WeekStrip(),
          const SizedBox(height: 12),
          const _ScheduleTile(
            day: 'Lun',
            subject: 'Programación II',
            time: '8:00 - 9:40',
            room: 'Lab 204',
            color: Color(0xFF0E5A38),
          ),
          const _ScheduleTile(
            day: 'Mié',
            subject: 'Sistemas Operativos',
            time: '10:00 - 11:40',
            room: 'Lab 108',
            color: Color(0xFF2458A6),
          ),
          const _ScheduleTile(
            day: 'Vie',
            subject: 'Ingeniería de Software',
            time: '1:00 - 2:40',
            room: 'Aula 312',
            color: Color(0xFF4D6B2F),
          ),
          const SizedBox(height: 8),
          _StatusPill(
            label: reminderEnabled
                ? 'Recordatorios activos'
                : 'Recordatorios desactivados',
            color: const Color(0xFF0E5A38),
            background: const Color(0xFFE7F5EC),
          ),
        ],
      ),
    );
  }
}

class _RecordInteractiveSection extends StatelessWidget {
  const _RecordInteractiveSection({
    required this.controller,
    required this.onSearch,
  });

  final TextEditingController controller;
  final VoidCallback onSearch;

  @override
  Widget build(BuildContext context) {
    return _GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Record académico',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Color(0xFF173726),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: controller,
            decoration: const InputDecoration(
              hintText: 'Buscar materia, profesor o período',
              prefixIcon: Icon(Icons.search),
            ),
            onSubmitted: (_) => onSearch(),
          ),
          const SizedBox(height: 12),
          const _TableHeader(
            columns: ['Materia', 'Créditos', 'Calif.', 'Período'],
          ),
          const _TableRowItem(values: ['Programación I', '3', 'A', '2026-1']),
          const _TableRowItem(
            values: ['Estructuras de Datos', '4', 'B+', '2026-1'],
          ),
          const _TableRowItem(values: ['Bases de Datos', '3', 'A-', '2025-3']),
          const SizedBox(height: 12),
          FilledButton.icon(
            onPressed: onSearch,
            icon: const Icon(Icons.picture_as_pdf_outlined),
            label: const Text('Exportar PDF'),
          ),
        ],
      ),
    );
  }
}

class _ScoreInteractiveSection extends StatelessWidget {
  const _ScoreInteractiveSection({
    required this.progress,
    required this.onProgressChanged,
  });

  final double progress;
  final ValueChanged<double> onProgressChanged;

  @override
  Widget build(BuildContext context) {
    return _GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Score académico',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Color(0xFF173726),
            ),
          ),
          const SizedBox(height: 12),
          SimpleCircularProgress(
            value: progress,
            label: 'Índice General',
            subtitle: '3.72 / 4.00',
          ),
          const SizedBox(height: 12),
          Slider(
            value: progress,
            min: 0.0,
            max: 1.0,
            onChanged: onProgressChanged,
          ),
          const _SummaryLine(label: 'Créditos aprobados', value: '72'),
          const _SummaryLine(label: 'Créditos pendientes', value: '18'),
          const _SummaryLine(label: 'Porcentaje de avance', value: '84%'),
          const SizedBox(height: 12),
          SimpleLineChart(values: [0.3, 0.45, 0.38, 0.6, 0.72, 0.78, progress]),
        ],
      ),
    );
  }
}

class _NewsInteractiveSection extends StatelessWidget {
  const _NewsInteractiveSection({
    required this.favoriteNews,
    required this.onToggleFavorite,
  });

  final Set<String> favoriteNews;
  final ValueChanged<String> onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    const news = [
      (
        'Nueva convocatoria de becas',
        'Abierta la solicitud para estudiantes de alto rendimiento con balance al día.',
        'Académico',
        'Hoy',
        Color(0xFF0E5A38),
      ),
      (
        'Calendario de exámenes publicado',
        'Consulta fechas por cuatrimestre y recordatorios del próximo período.',
        'Eventos',
        'Ayer',
        Color(0xFF4D6B2F),
      ),
    ];

    return Column(
      children: news
          .map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _GlassCard(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 92,
                      height: 92,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        gradient: LinearGradient(
                          colors: [
                            item.$5.withValues(alpha: 0.9),
                            item.$5.withValues(alpha: 0.55),
                          ],
                        ),
                      ),
                      child: const Icon(
                        Icons.article_outlined,
                        color: Colors.white,
                        size: 36,
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              _StatusPill(
                                label: item.$3,
                                color: item.$5,
                                background: item.$5.withValues(alpha: 0.12),
                              ),
                              const Spacer(),
                              IconButton(
                                onPressed: () => onToggleFavorite(item.$1),
                                icon: Icon(
                                  favoriteNews.contains(item.$1)
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: Colors.redAccent,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            item.$1,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF173726),
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            item.$2,
                            style: const TextStyle(
                              fontSize: 13,
                              color: Color(0xFF62716A),
                              height: 1.3,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            item.$4,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color(0xFF62716A),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}

class _CalendarInteractiveSection extends StatelessWidget {
  const _CalendarInteractiveSection({
    required this.filterIndex,
    required this.onFilterChanged,
  });

  final int filterIndex;
  final ValueChanged<int> onFilterChanged;

  @override
  Widget build(BuildContext context) {
    const filters = ['Inscripción', 'Retiros', 'Exámenes', 'Vacaciones'];
    final selectedFilter = filters[filterIndex.clamp(0, filters.length - 1)];
    return _GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Calendario académico',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Color(0xFF173726),
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: List.generate(
              filters.length,
              (index) => ChoiceChip(
                label: Text(filters[index]),
                selected: filterIndex == index,
                onSelected: (_) => onFilterChanged(index),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Filtro actual: $selectedFilter',
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 12),
          const _TimelineItem(
            title: 'Inscripción',
            subtitle: '1 - 5 de agosto',
            color: Color(0xFF0E5A38),
          ),
          const _TimelineItem(
            title: 'Retiros',
            subtitle: '10 - 12 de agosto',
            color: Color(0xFF4D6B2F),
          ),
          const _TimelineItem(
            title: 'Exámenes finales',
            subtitle: '28 - 31 de agosto',
            color: Color(0xFF164D64),
          ),
        ],
      ),
    );
  }
}

class _LibraryInteractiveSection extends StatelessWidget {
  const _LibraryInteractiveSection({
    required this.controller,
    required this.autoSearch,
    required this.onToggleAutoSearch,
    required this.onSearch,
  });

  final TextEditingController controller;
  final bool autoSearch;
  final ValueChanged<bool> onToggleAutoSearch;
  final VoidCallback onSearch;

  @override
  Widget build(BuildContext context) {
    return _GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Biblioteca Virtual',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Color(0xFF173726),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: controller,
            decoration: const InputDecoration(
              hintText: 'Buscar libros',
              prefixIcon: Icon(Icons.search),
            ),
            onSubmitted: (_) => onSearch(),
          ),
          const SizedBox(height: 12),
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('Buscar automáticamente'),
            value: autoSearch,
            onChanged: onToggleAutoSearch,
          ),
          const SizedBox(height: 8),
          const _SummaryLine(label: 'Descargar PDF', value: 'Disponible'),
          const _SummaryLine(label: 'Favoritos', value: '12 libros'),
          const _SummaryLine(label: 'Historial', value: 'Últimas búsquedas'),
          const SizedBox(height: 12),
          FilledButton(onPressed: onSearch, child: const Text('Buscar')),
        ],
      ),
    );
  }
}

class _CampusVirtualInteractiveSection extends StatelessWidget {
  const _CampusVirtualInteractiveSection({required this.onLaunch});

  final void Function(String message) onLaunch;

  @override
  Widget build(BuildContext context) {
    return _GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Campus Virtual',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Color(0xFF173726),
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              FilledButton.tonal(
                onPressed: () => onLaunch('Abriendo Google Classroom'),
                child: const Text('Google Classroom'),
              ),
              FilledButton.tonal(
                onPressed: () => onLaunch('Abriendo Moodle'),
                child: const Text('Moodle'),
              ),
              FilledButton.tonal(
                onPressed: () => onLaunch('Abriendo Teams'),
                child: const Text('Teams'),
              ),
              FilledButton.tonal(
                onPressed: () => onLaunch('Abriendo Zoom'),
                child: const Text('Zoom'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SupportInteractiveSection extends StatelessWidget {
  const _SupportInteractiveSection({
    required this.controller,
    required this.messages,
    required this.onSend,
  });

  final TextEditingController controller;
  final List<_ChatMessage> messages;
  final VoidCallback onSend;

  @override
  Widget build(BuildContext context) {
    return _GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Chat de soporte',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Color(0xFF173726),
            ),
          ),
          const SizedBox(height: 12),
          ...messages.map(
            (message) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Align(
                alignment: message.author == 'Berny'
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 320),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: message.author == 'Berny'
                        ? const Color(0xFFE7F5EC)
                        : const Color(0xFFF8FBF8),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: const Color(0xFFE2ECE4)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        message.author,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF62716A),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        message.text,
                        style: const TextStyle(color: Color(0xFF173726)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          TextField(
            controller: controller,
            decoration: const InputDecoration(
              hintText: 'Escribe tu mensaje',
              prefixIcon: Icon(Icons.chat_bubble_outline),
            ),
            onSubmitted: (_) => onSend(),
          ),
          const SizedBox(height: 12),
          FilledButton.icon(
            onPressed: onSend,
            icon: const Icon(Icons.send_outlined),
            label: const Text('Enviar'),
          ),
        ],
      ),
    );
  }
}

class _ChatMessage {
  const _ChatMessage({required this.author, required this.text});

  final String author;
  final String text;
}

class _SelectableSubject {
  const _SelectableSubject(this.name, this.credits, this.room, this.time);

  final String name;
  final int credits;
  final String room;
  final String time;
}
