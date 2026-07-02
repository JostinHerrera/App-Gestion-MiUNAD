part of '../main.dart';

class PaymentsPage extends StatefulWidget {
  const PaymentsPage({super.key});

  @override
  State<PaymentsPage> createState() => _PaymentsPageState();
}

class _PaymentsPageState extends State<PaymentsPage> {
  int _sectionIndex = 0;

  @override
  Widget build(BuildContext context) {
    final sections = [
      const _PaymentsBlocks(),
      const _TuitionCard(),
      const _CreditsCard(),
      const _ServicesCard(),
      const _StatementCard(),
    ];

    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 118),
      children: [
        const _SectionHero(
          title: 'Pagos',
          subtitle: 'Matrícula, créditos, servicios, balance y estado de cuenta.',
          icon: Icons.account_balance_wallet_outlined,
        ),
        const SizedBox(height: 16),
        _GlassCard(
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              ChoiceChip(label: const Text('Resumen'), selected: _sectionIndex == 0, onSelected: (_) => setState(() => _sectionIndex = 0)),
              ChoiceChip(label: const Text('Matrícula'), selected: _sectionIndex == 1, onSelected: (_) => setState(() => _sectionIndex = 1)),
              ChoiceChip(label: const Text('Créditos'), selected: _sectionIndex == 2, onSelected: (_) => setState(() => _sectionIndex = 2)),
              ChoiceChip(label: const Text('Servicios'), selected: _sectionIndex == 3, onSelected: (_) => setState(() => _sectionIndex = 3)),
              ChoiceChip(label: const Text('Cuenta'), selected: _sectionIndex == 4, onSelected: (_) => setState(() => _sectionIndex = 4)),
            ],
          ),
        ),
        const SizedBox(height: 18),
        sections[_sectionIndex],
      ],
    );
  }
}
