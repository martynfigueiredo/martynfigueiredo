import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'martynfigueiredo.dev',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black,
          brightness: Brightness.light,
        ).copyWith(
          primary: Colors.black,
          secondary: Colors.blue,
          surface: Colors.white,
          onPrimary: Colors.black,
          onSecondary: Colors.white,
          onSurface: Colors.black,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent,
          textTheme: ButtonTextTheme.primary,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
          brightness: Brightness.dark,
        ).copyWith(
          primary: Colors.white,
          secondary: Colors.white,
          surface: Colors.black,
          onPrimary: Colors.white,
          onSecondary: Colors.black,
          onSurface: Colors.white,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent,
          textTheme: ButtonTextTheme.primary,
        ),
        useMaterial3: true,
      ),
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: MyHomePage(
        title: 'martynfigueiredo.dev',
        toggleTheme: toggleTheme,
      ),
    );
  }

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title, required this.toggleTheme});

  final String title;
  final VoidCallback toggleTheme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            icon: Icon(
              Theme.of(context).brightness == Brightness.dark
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
            onPressed: toggleTheme,
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Spacer(),
            const Text(
              'Welcome',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            SocialMediaLink(
              text: 'Resume',
              url: 'https://docs.google.com/document/d/1pm2WDLZXQQuIeK_DJAQIEH-t7DPEA6DgsR8d_QK62_g/edit?usp=sharing',
            ),
            const SizedBox(height: 10),
            SocialMediaLink(
              text: 'LinkedIn',
              url: 'https://www.linkedin.com/in/martyn-figueiredo-663b4b69',
            ),
            const SizedBox(height: 10),
            SocialMediaLink(
              text: 'GitHub',
              url: 'https://github.com/martynfigueiredo',
            ),
            const SizedBox(height: 10),
            SocialMediaLink(
              text: 'Beecrowd',
              url: 'https://judge.beecrowd.com/en/profile/1085164',
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'martynfigueiredo.dev 2024-${DateTime.now().year}',
                style: TextStyle(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,
                  fontSize: 10.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SocialMediaLink extends StatefulWidget {
  const SocialMediaLink({super.key, required this.text, required this.url});

  final String text;
  final String url;

  @override
  _SocialMediaLinkState createState() => _SocialMediaLinkState();
}

class _SocialMediaLinkState extends State<SocialMediaLink> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () async {
          if (await canLaunch(widget.url)) {
            await launch(widget.url);
          }
        },
        child: Text(
          widget.text,
          style: TextStyle(
            color: _isHovering ? Colors.blueAccent : Colors.blue,
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }
}
