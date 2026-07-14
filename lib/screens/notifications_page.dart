part of '../main.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  int _filterIndex = 0;
  final List<_NotificationItemModel> _items = [
    _NotificationItemModel(title: 'Pago pendiente de matrícula', subtitle: 'El saldo vence en 4 días.', icon: Icons.payments_outlined, color: const Color(0xFFC03A2B), unread: true),
    _NotificationItemModel(title: 'Nueva calificación publicada', subtitle: 'Programación I: A en el último parcial.', icon: Icons.grade_outlined, color: const Color(0xFF1B7A4B), unread: true),
    _NotificationItemModel(title: 'Cambio de horario', subtitle: 'La clase de miércoles se movió a Aula 108.', icon: Icons.schedule_outlined, color: const Color(0xFF2458A6), unread: false),
    _NotificationItemModel(title: 'Evento institucional', subtitle: 'Graduación y feria académica este viernes.', icon: Icons.event_available_outlined, color: const Color(0xFF7A6A1C), unread: false),
  ];

  @override
  Widget build(BuildContext context) {
    final filtered = _items.where((item) {
      switch (_filterIndex) {
        case 1:
          return item.unread;
        case 2:
          return !item.unread;
        default:
          return true;
      }
    }).toList();

    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 118),
      children: [
        const _SectionHero(
          title: 'Notificaciones',
          subtitle: 'Pagos pendientes, calificaciones, eventos y avisos institucionales.',
          icon: Icons.notifications_outlined,
        ),
        const SizedBox(height: 16),
        _GlassCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Expanded(child: Text('Filtros', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Color(0xFF173726)))),
                  TextButton(
                    onPressed: () => setState(() {
                      for (final item in _items) {
                        item.unread = false;
                      }
                    }),
                    child: const Text('Marcar todo como leído'),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  ChoiceChip(label: const Text('Todas'), selected: _filterIndex == 0, onSelected: (_) => setState(() => _filterIndex = 0)),
                  ChoiceChip(label: const Text('No leídas'), selected: _filterIndex == 1, onSelected: (_) => setState(() => _filterIndex = 1)),
                  ChoiceChip(label: const Text('Leídas'), selected: _filterIndex == 2, onSelected: (_) => setState(() => _filterIndex = 2)),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),
        ...filtered
            .map(
              (item) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: _NotificationCard(
                  title: item.title,
                  subtitle: item.subtitle,
                  icon: item.icon,
                  color: item.color,
                ),
              ),
            )
            ,
        const SizedBox(height: 18),
        const _ChatSupportPreview(),
      ],
    );
  }
}

class _NotificationItemModel {
  _NotificationItemModel({required this.title, required this.subtitle, required this.icon, required this.color, required this.unread});

  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  bool unread;
}
