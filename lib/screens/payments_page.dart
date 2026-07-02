part of '../main.dart';

class PaymentsPage extends StatefulWidget {
  const PaymentsPage({super.key});

  @override
  State<PaymentsPage> createState() => _PaymentsPageState();
}

class _PaymentsPageState extends State<PaymentsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ── Dark green header ─────────────────────────────────────────────
        const _PaymentsHeader(),
        // ── Scrollable body ───────────────────────────────────────────────
        Expanded(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 118),
            children: [
              // "Mis pagos" section
              Row(
                children: [
                  const Text(
                    'Mis pagos',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF173726),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () => _openFeature(context, QuickFeature.accountStatement),
                    child: const Text(
                      'Ver todos',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF0E5A38),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              // Payment cards row
              const _PaymentCardsRow(),
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
              const _PaymentsQuickRow(),
              const SizedBox(height: 24),
              // Financial summary
              const _FinancialSummaryCard(),
              const SizedBox(height: 20),
              // Detailed blocks
              const _PaymentsBlocks(),
            ],
          ),
        ),
      ],
    );
  }
}

// ─── Payments Dark Header ──────────────────────────────────────────────────────
class _PaymentsHeader extends StatelessWidget {
  const _PaymentsHeader();

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
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Pagos',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 28,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        letterSpacing: -0.5,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      'Gestiona tus pagos y finanzas',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        color: Color(0xFFB0D4BC),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withValues(alpha: 0.12),
                  border: Border.all(color: Colors.white.withValues(alpha: 0.25)),
                ),
                child: const Icon(Icons.account_balance_wallet_outlined, color: Colors.white, size: 26),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Balance content directly in header (no inner container)
          const Text(
            'Balance actual',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 13,
              color: Color(0xFFB0D4BC),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 6),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Expanded(
                child: Text(
                  'RD\$ 12,450.00',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    letterSpacing: -1.0,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(Icons.account_balance_wallet_rounded, color: Colors.white, size: 26),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => _openFeature(context, QuickFeature.accountStatement),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.10),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.white.withValues(alpha: 0.20)),
                    ),
                    alignment: Alignment.center,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.description_outlined, color: Colors.white, size: 16),
                        SizedBox(width: 6),
                        Text(
                          'Ver estado de cuenta',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: GestureDetector(
                  onTap: () => _openFeature(context, QuickFeature.tuition),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      'Pagar ahora',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF0E5A38),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ─── Payment Cards Row ─────────────────────────────────────────────────────────
class _PaymentCardsRow extends StatelessWidget {
  const _PaymentCardsRow();

  static const _cards = [
    _PayCardData('Matrícula', Icons.school_outlined, 'RD\$ 8,500.00', 'Pendiente'),
    _PayCardData('Créditos', Icons.payments_outlined, 'RD\$ 3,450.00', 'Pendiente'),
    _PayCardData('Servicios', Icons.receipt_long_outlined, 'RD\$ 500.00', 'Pendiente'),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 2),
        itemCount: _cards.length,
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final card = _cards[index];
          return SizedBox(
            width: 150,
            child: _PaymentItemCard(data: card),
          );
        },
      ),
    );
  }
}

class _PayCardData {
  const _PayCardData(this.label, this.icon, this.amount, this.status);
  final String label;
  final IconData icon;
  final String amount;
  final String status;
}

class _PaymentItemCard extends StatelessWidget {
  const _PaymentItemCard({required this.data});

  final _PayCardData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(color: Color(0x0E000000), blurRadius: 10, offset: Offset(0, 4)),
        ],
        border: Border.all(color: const Color(0xFFF0F4F1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: const BoxDecoration(
              color: Color(0xFFE8F4EC),
              shape: BoxShape.circle,
            ),
            child: Icon(data.icon, color: const Color(0xFF0E5A38), size: 20),
          ),
          const SizedBox(height: 10),
          Text(
            data.label,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: Color(0xFF173726),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            data.amount,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 13,
              fontWeight: FontWeight.w800,
              color: Color(0xFFD97706),
            ),
          ),
          const SizedBox(height: 2),
          Text(
            data.status,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 11,
              color: Color(0xFF62716A),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Payments Quick Row ────────────────────────────────────────────────────────
class _PaymentsQuickRow extends StatelessWidget {
  const _PaymentsQuickRow();

  static const _items = [
    (QuickFeature.accountStatement, 'Estado de\ncuenta'),
    (QuickFeature.balance, 'Historial de\npagos'),
    (QuickFeature.services, 'Métodos de\npago'),
    (QuickFeature.tuition, 'Facturas y\ncomprobantes'),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: _items
          .map((item) => Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: item == _items.last ? 0 : 10),
                  child: _PaymentsQuickTile(
                    feature: item.$1,
                    label: item.$2,
                    onTap: () => _openFeature(context, item.$1),
                  ),
                ),
              ))
          .toList(),
    );
  }
}

class _PaymentsQuickTile extends StatelessWidget {
  const _PaymentsQuickTile({
    required this.feature,
    required this.label,
    required this.onTap,
  });

  final QuickFeature feature;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            boxShadow: const [
              BoxShadow(color: Color(0x0E000000), blurRadius: 8, offset: Offset(0, 3)),
            ],
            border: Border.all(color: const Color(0xFFF0F4F1)),
          ),
          child: Column(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: const BoxDecoration(
                  color: Color(0xFFE8F4EC),
                  shape: BoxShape.circle,
                ),
                child: Icon(feature.icon, color: const Color(0xFF0E5A38), size: 20),
              ),
              const SizedBox(height: 8),
              Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF173726),
                  height: 1.3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Financial Summary Card ────────────────────────────────────────────────────
class _FinancialSummaryCard extends StatelessWidget {
  const _FinancialSummaryCard();

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
          const Text(
            'Resumen financiero',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: Color(0xFF173726),
            ),
          ),
          const SizedBox(height: 16),
          _FinSummaryLine(
            label: 'Total adeudado',
            value: 'RD\$ 12,450.00',
            valueColor: const Color(0xFFD97706),
          ),
          const _FinDivider(),
          _FinSummaryLine(
            label: 'Último pago',
            value: 'RD\$ 8,500.00',
            valueColor: const Color(0xFFD97706),
          ),
          const _FinDivider(),
          _FinSummaryLine(
            label: 'Fecha límite',
            value: '15 de febrero, 2025',
            valueColor: const Color(0xFFD97706),
          ),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () => _openFeature(context, QuickFeature.accountStatement),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 14),
              decoration: BoxDecoration(
                color: const Color(0xFFF4FAF6),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: const Color(0xFFD4EEE0)),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Ver historial de pagos',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF0E5A38),
                    ),
                  ),
                  SizedBox(width: 6),
                  Icon(Icons.chevron_right_rounded, size: 18, color: Color(0xFF0E5A38)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FinSummaryLine extends StatelessWidget {
  const _FinSummaryLine({
    required this.label,
    required this.value,
    required this.valueColor,
  });

  final String label;
  final String value;
  final Color valueColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 14,
                color: Color(0xFF62716A),
              ),
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: valueColor,
            ),
          ),
        ],
      ),
    );
  }
}

class _FinDivider extends StatelessWidget {
  const _FinDivider();

  @override
  Widget build(BuildContext context) {
    return const Divider(color: Color(0xFFF0F4F1), height: 1, thickness: 1);
  }
}
