import 'package:flutter/material.dart';

void main() => runApp(const ExpansionTileApp());

class ExpansionTileApp extends StatelessWidget {
  const ExpansionTileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: const Color(0xFF6750A4),
        useMaterial3: true,
      ),
      home: const ExpansionTileDemo(),
    );
  }
}

class ExpansionTileDemo extends StatefulWidget {
  const ExpansionTileDemo({super.key});

  @override
  State<ExpansionTileDemo> createState() => _ExpansionTileDemoState();
}

class _ExpansionTileDemoState extends State<ExpansionTileDemo> {
  bool _customExpanded = false;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('ExpansionTile Widget'),
        centerTitle: true,
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // 1 - Basic default usage
          Card(
            clipBehavior: Clip.antiAlias,
            child: ExpansionTile(
              leading: Icon(Icons.star_rounded, color: cs.primary),
              title: const Text('Default Trailing Arrow'),
              subtitle: const Text('The simplest ExpansionTile'),
              children: const [
                ListTile(
                  title: Text('Just provide a title and children!'),
                  subtitle: Text('The arrow rotates automatically'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),

          // 2 - Custom trailing icon with onExpansionChanged
          Card(
            clipBehavior: Clip.antiAlias,
            child: ExpansionTile(
              leading: Icon(Icons.tune_rounded, color: cs.tertiary),
              title: const Text('Custom Trailing Icon'),
              subtitle: const Text('onExpansionChanged callback'),
              trailing: AnimatedRotation(
                turns: _customExpanded ? 0.5 : 0,
                duration: const Duration(milliseconds: 300),
                child: Icon(
                  Icons.expand_circle_down_rounded,
                  color: _customExpanded ? cs.tertiary : cs.outline,
                ),
              ),
              onExpansionChanged: (expanded) {
                setState(() => _customExpanded = expanded);
              },
              children: const [
                ListTile(
                  title: Text('Use onExpansionChanged to react'),
                  subtitle: Text('Swap icons, track state, trigger actions'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),

          // 3 - Leading control affinity
          Card(
            clipBehavior: Clip.antiAlias,
            child: ExpansionTile(
              controlAffinity: ListTileControlAffinity.leading,
              title: const Text('Leading Arrow Position'),
              subtitle: const Text('controlAffinity: leading'),
              trailing: Icon(Icons.folder_rounded, color: cs.secondary),
              children: const [
                ListTile(title: Text('Documents')),
                ListTile(title: Text('Photos')),
                ListTile(title: Text('Downloads')),
              ],
            ),
          ),
          const SizedBox(height: 12),

          // 4 - Custom styling + initially expanded
          Card(
            clipBehavior: Clip.antiAlias,
            child: ExpansionTile(
              initiallyExpanded: true,
              backgroundColor: cs.primaryContainer.withValues(alpha: 0.3),
              iconColor: cs.primary,
              textColor: cs.primary,
              leading: Icon(Icons.palette_rounded, color: cs.primary),
              title: const Text('Styled & Initially Expanded'),
              subtitle: const Text('Custom colors + initiallyExpanded: true'),
              children: const [
                ListTile(
                  title: Text('backgroundColor, textColor, iconColor'),
                  subtitle: Text('All customizable per state'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
