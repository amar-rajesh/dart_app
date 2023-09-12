import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum Language { English, French, Swahili }

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notificationsEnabled = true;
  Language _selectedLanguage = Language.English;
  ThemeMode _selectedTheme = ThemeMode.system;

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      _notificationsEnabled = prefs.getBool('notificationsEnabled') ?? true;
      _selectedLanguage =
          Language.values[prefs.getInt('selectedLanguage') ?? 0];
      _selectedTheme = ThemeMode
          .values[prefs.getInt('selectedTheme') ?? ThemeMode.system.index];
    });
  }

  Future<void> _savePreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('notificationsEnabled', _notificationsEnabled);
    await prefs.setInt('selectedLanguage', _selectedLanguage.index);
    await prefs.setInt('selectedTheme', _selectedTheme.index);

    // Apply the selected theme.
    // You can use the Builder widget to access the context.
    // Ensure you've defined ThemeData for light and dark themes.
    final themeData =
        _selectedTheme == ThemeMode.dark ? ThemeData.dark() : ThemeData.light();

    Builder(
      builder: (context) {
        return MaterialApp(
          theme: ThemeData.light(), // Define your light theme here
          darkTheme: ThemeData.dark(), // Define your dark theme here
          themeMode: _selectedTheme,
          home: SettingsPage(), // Replace with your home page widget
          // ... Other MaterialApp configurations
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Theme",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            ListTile(
              title: Text("System Default"),
              leading: Radio(
                value: ThemeMode.system,
                groupValue: _selectedTheme,
                onChanged: (value) {
                  setState(() {
                    _selectedTheme = value as ThemeMode;
                  });
                },
              ),
            ),
            ListTile(
              title: Text("Light"),
              leading: Radio(
                value: ThemeMode.light,
                groupValue: _selectedTheme,
                onChanged: (value) {
                  setState(() {
                    _selectedTheme = value as ThemeMode;
                  });
                },
              ),
            ),
            ListTile(
              title: Text("Dark"),
              leading: Radio(
                value: ThemeMode.dark,
                groupValue: _selectedTheme,
                onChanged: (value) {
                  setState(() {
                    _selectedTheme = value as ThemeMode;
                  });
                },
              ),
            ),
            Divider(),
            Text(
              "Language",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            ListTile(
              title: Text("English"),
              leading: Radio(
                value: Language.English,
                groupValue: _selectedLanguage,
                onChanged: (value) {
                  setState(() {
                    _selectedLanguage = value as Language;
                  });
                },
              ),
            ),
            ListTile(
              title: Text("French"),
              leading: Radio(
                value: Language.French,
                groupValue: _selectedLanguage,
                onChanged: (value) {
                  setState(() {
                    _selectedLanguage = value as Language;
                  });
                },
              ),
            ),
            ListTile(
              title: Text("Swahili"),
              leading: Radio(
                value: Language.Swahili,
                groupValue: _selectedLanguage,
                onChanged: (value) {
                  setState(() {
                    _selectedLanguage = value as Language;
                  });
                },
              ),
            ),
            Divider(),
            Text(
              "Notifications",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            ListTile(
              title: Text("Enable Notifications"),
              trailing: Switch(
                value: _notificationsEnabled,
                onChanged: (value) {
                  setState(() {
                    _notificationsEnabled = value;
                  });
                },
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  _savePreferences();
                },
                child: Text("Save"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
