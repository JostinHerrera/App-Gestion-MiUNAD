part of '../main.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _darkMode = false;
  bool _notifications = true;
  bool _biometrics = true;
  bool _privacyMode = false;

  void _editProfile() {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Editar información'),
        content: const Text('Aquí luego puedes conectar el formulario de edición real con backend o base de datos.'),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Cerrar')),
        ],
      ),
    );
  }

  void _logout() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Sesión cerrada en el prototipo')));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 118),
      children: [
        const _SectionHero(
          title: 'Perfil',
          subtitle: 'Datos del estudiante, seguridad, ayuda y configuración.',
          icon: Icons.person_outline,
        ),
        const SizedBox(height: 16),
        const _ProfileSummaryCard(),
        const SizedBox(height: 18),
        _GlassCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Configuración rápida', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Color(0xFF173726))),
              SwitchListTile(value: _darkMode, onChanged: (value) => setState(() => _darkMode = value), title: const Text('Modo oscuro')),
              SwitchListTile(value: _notifications, onChanged: (value) => setState(() => _notifications = value), title: const Text('Notificaciones')),
              SwitchListTile(value: _biometrics, onChanged: (value) => setState(() => _biometrics = value), title: const Text('Biometría')),
              SwitchListTile(value: _privacyMode, onChanged: (value) => setState(() => _privacyMode = value), title: const Text('Privacidad')),
            ],
          ),
        ),
        const SizedBox(height: 18),
        _GlassCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Acciones de perfil', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Color(0xFF173726))),
              const SizedBox(height: 12),
              _ActionPill(label: 'Editar información', icon: Icons.edit_outlined, onTap: _editProfile),
              const SizedBox(height: 10),
              const _ActionPill(label: 'Cambiar contraseña', icon: Icons.password_outlined),
              const SizedBox(height: 10),
              _ActionPill(label: 'Cerrar sesión', icon: Icons.logout_outlined, onTap: _logout),
            ],
          ),
        ),
        const SizedBox(height: 18),
        _SupportContactsCard(),
      ],
    );
  }
}
