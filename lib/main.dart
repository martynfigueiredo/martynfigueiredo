import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'martynfigueiredo.dev',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'martynfigueiredo.dev'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Welcome',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            SocialMediaLink(
              text: 'LinkedIn',
              url: 'https://www.linkedin.com/in/martynfigueiredo/',
            ),
            const SizedBox(height: 10),
            SocialMediaLink(
              text: 'GitHub',
              url: 'https://github.com/martynfigueiredo',
            ),
            const SizedBox(height: 10),
            SocialMediaLink(
              text: 'Google Developers',
              url: 'https://g.dev/martynfigueiredo',
            ),
            const SizedBox(height: 10),
            SocialMediaLink(
              text: 'Resume',
              url:
                  'https://docs.google.com/document/d/1pm2WDLZXQQuIeK_DJAQIEH-t7DPEA6DgsR8d_QK62_g/edit?usp=sharing',
            ),
          ],
        ),
      ),
    );
  }
}

class SocialMediaLink extends StatelessWidget {
  final String text;
  final String url;

  const SocialMediaLink({
    Key? key,
    required this.text,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        // Handle link tap here (e.g., show a dialog with the link)
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(text),
            content: Text('Open in browser?'),
            actions: [
              TextButton(
                onPressed: () {
                  // You can use `launch()` from `package:url_launcher` if you want to
                  // launch the URL, but it's not essential for this simplified approach.
                  // launch(url);
                  Navigator.of(context).pop();
                },
                child: const Text('Open'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel'),
              ),
            ],
          ),
        );
      },
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
