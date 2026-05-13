import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {

  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() =>
      _SettingsScreenState();
}

class _SettingsScreenState
    extends State<SettingsScreen> {

  bool soundEnabled = true;

  @override
  void initState() {

    super.initState();

    loadSettings();
  }

  Future<void> loadSettings() async {

    final prefs =
    await SharedPreferences.getInstance();

    setState(() {

      soundEnabled =
          prefs.getBool(
            'sound_enabled',
          ) ?? true;
    });
  }

  Future<void> saveSoundSetting(
      bool value,
      ) async {

    final prefs =
    await SharedPreferences.getInstance();

    await prefs.setBool(
      'sound_enabled',
      value,
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title:
        const Text('Settings'),
      ),

      body: ListView(

        padding:
        const EdgeInsets.all(16),

        children: [

          Container(

            decoration: BoxDecoration(

              color:
              Theme.of(context)
                  .cardColor,

              borderRadius:
              BorderRadius.circular(20),
            ),

            child: SwitchListTile(

              value: soundEnabled,

              onChanged:
                  (value) async {

                await saveSoundSetting(
                  value,
                );

                setState(() {
                  soundEnabled = value;
                });
              },

              secondary:
              const Icon(Icons.volume_up),

              title:
              const Text(
                'Sound Effects',
              ),

              subtitle:
              const Text(
                'Enable or disable sounds',
              ),
            ),
          ),

          const SizedBox(height: 20),

          Container(

            decoration: BoxDecoration(

              color:
              Theme.of(context)
                  .cardColor,

              borderRadius:
              BorderRadius.circular(20),
            ),

            child: const ListTile(

              leading:
              Icon(Icons.info_outline),

              title:
              Text('About App'),

              subtitle:
              Text(
                'English Quiz Learning App',
              ),
            ),
          ),

          const SizedBox(height: 20),

          Container(

            decoration: BoxDecoration(

              color:
              Theme.of(context)
                  .cardColor,

              borderRadius:
              BorderRadius.circular(20),
            ),

            child: const ListTile(

              leading:
              Icon(Icons.code),

              title:
              Text('Version'),

              subtitle:
              Text('1.0.0'),
            ),
          ),
        ],
      ),
    );
  }
}