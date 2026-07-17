part of '../../main.dart';

class PaymentsPage extends StatefulWidget {
  const PaymentsPage({super.key});

  @override
  State<PaymentsPage> createState() => _PaymentsPageState();
}

class _PaymentsPageState extends State<PaymentsPage> {
  void _handlePayNow() {
    // Navigate to payment page or show payment dialog
    _openFeature(context, QuickFeature.tuition);
  }

  void _handleViewReceipts() {
    // Navigate to receipts page or show receipts dialog
    _openFeature(context, QuickFeature.accountStatement);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ── Green header ─────────────────────────────────────────────
        const _PaymentsHeader(),
        // ── Scrollable body ───────────────────────────────────────────────
        Expanded(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 118),
            children: [
              // Pending balance card
              _PendingBalanceCard(
                onPayNow: _handlePayNow,
                onViewReceipts: _handleViewReceipts,
              ),
              // Semester breakdown
              const _SemesterBreakdown(),
              // Payments per month chart
              const _PaymentsPerMonthChart(),
            ],
          ),
        ),
      ],
    );
  }
}

// ─── Payments Header ──────────────────────────────────────────────────────
class _PaymentsHeader extends StatelessWidget {
  const _PaymentsHeader();

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
            'Finanzas',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 28,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Estado de cuenta • 2025-I',
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

// ─── Pending Balance Card ─────────────────────────────────────────────────────
class _PendingBalanceCard extends StatelessWidget {
  const _PendingBalanceCard({
    required this.onPayNow,
    required this.onViewReceipts,
  });

  final VoidCallback onPayNow;
  final VoidCallback onViewReceipts;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 16, 20, 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFF97316), Color(0xFFEA580C)],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFF97316).withValues(alpha: 0.3),
            blurRadius: 15,
            offset: const Offset(0, 4),
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
                'Saldo Pendiente',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  '17 días vencido',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            'RD\$ 2400',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 32,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: onPayNow,
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        'Pagar Ahora',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFF97316),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: onViewReceipts,
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.3),
                        ),
                      ),
                      child: const Text(
                        'Ver Recibos',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
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

// ─── Semester Breakdown Section ───────────────────────────────────────────────
class _SemesterBreakdown extends StatelessWidget {
  const _SemesterBreakdown();

  static const _items = [
    ('Matrícula', 'RD\$ 3500', 'Pagado', true),
    ('Créditos (16 cr. x RD\$400)', 'RD\$ 6400', 'Pagado', true),
    ('Laboratorio Informática', 'RD\$ 800', 'Pagado', true),
    ('Servicios Estudiantiles', 'RD\$ 350', 'Pagado', true),
    ('Cuotas mensuales', 'RD\$ 2400', 'Pendiente', false),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 12),
          child: Text(
            'DESGLOSE DEL SEMESTRE',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Color(0xFF62716A),
              letterSpacing: 1,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
          child: Container(
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
              children: [
                for (int i = 0; i < _items.length; i++) ...[
                  _BreakdownItem(
                    label: _items[i].$1,
                    amount: _items[i].$2,
                    status: _items[i].$3,
                    isPaid: _items[i].$4,
                  ),
                  if (i < _items.length - 1)
                    const Divider(
                      color: Color(0xFFF0F4F1),
                      height: 1,
                      thickness: 1,
                    ),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _BreakdownItem extends StatelessWidget {
  const _BreakdownItem({
    required this.label,
    required this.amount,
    required this.status,
    required this.isPaid,
  });

  final String label;
  final String amount;
  final String status;
  final bool isPaid;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF173726),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  amount,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF62716A),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: isPaid
                  ? const Color(0xFFE7F5EC)
                  : const Color(0xFFFEE2E2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              status,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: isPaid
                    ? const Color(0xFF0E5A38)
                    : const Color(0xFFDC2626),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Payments Per Month Chart ─────────────────────────────────────────────────
class _PaymentsPerMonthChart extends StatelessWidget {
  const _PaymentsPerMonthChart();

  static const _months = ['Oct', 'Nov', 'Dec', 'Ene', 'Feb', 'Mar'];
  static const _values = [0.4, 0.6, 0.2, 1.0, 0.7, 0.3];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 12),
          child: Text(
            'PAGOS POR MES',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Color(0xFF62716A),
              letterSpacing: 1,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
          child: Container(
            padding: const EdgeInsets.all(20),
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
            child: SizedBox(
              height: 120,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  for (int i = 0; i < _months.length; i++)
                    _MonthBar(
                      month: _months[i],
                      value: _values[i],
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _MonthBar extends StatelessWidget {
  const _MonthBar({
    required this.month,
    required this.value,
  });

  final String month;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 24,
          height: 80 * value,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Color(0xFF0E5A38), Color(0xFF1B7A4B)],
            ),
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          month,
          style: const TextStyle(
            fontFamily: 'Inter',
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: Color(0xFF62716A),
          ),
        ),
      ],
    );
  }
}

// ─── Payment Cards Row ─────────────────────────────────────────────────────────
class _PaymentCardsRow extends StatelessWidget {
  const _PaymentCardsRow();

  static const _cards = [
    _PayCardData(
      'Matrícula',
      Icons.school_outlined,
      'RD\$ 8,500.00',
      'Pendiente',
    ),
    _PayCardData(
      'Créditos',
      Icons.payments_outlined,
      'RD\$ 3,450.00',
      'Pendiente',
    ),
    _PayCardData(
      'Servicios',
      Icons.receipt_long_outlined,
      'RD\$ 500.00',
      'Pendiente',
    ),
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
          return SizedBox(width: 150, child: _PaymentItemCard(data: card));
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
          BoxShadow(
            color: Color(0x0E000000),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
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
          .map(
            (item) => Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: item == _items.last ? 0 : 10),
                child: _PaymentsQuickTile(
                  feature: item.$1,
                  label: item.$2,
                  onTap: () => _openFeature(context, item.$1),
                ),
              ),
            ),
          )
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
              BoxShadow(
                color: Color(0x0E000000),
                blurRadius: 8,
                offset: Offset(0, 3),
              ),
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
                child: Icon(
                  feature.icon,
                  color: const Color(0xFF0E5A38),
                  size: 20,
                ),
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
                  Icon(
                    Icons.chevron_right_rounded,
                    size: 18,
                    color: Color(0xFF0E5A38),
                  ),
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
