import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sidebar Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String currentPage = 'Halaman Utama';

  void updatePage(String newPage) {
    setState(() {
      currentPage = newPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sidebar Example'),
      ),
      body: Row(
        children: [
          // Sidebar
          Container(
            width: 200,
            color: Colors.grey[300],
            child: ListView(
              children: [
                ListTile(
                  title: Text('Halaman 1'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Page1(updatePage),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: Text('Halaman 2'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Page2(updatePage),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: Text('Halaman 3'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Page3(updatePage),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),

          // Konten halaman
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16),
              child: Text(currentPage),
            ),
          ),
        ],
      ),
    );
  }
}

// Implementasi Page1
class Page1 extends StatefulWidget {
  final Function updatePage;

  Page1(this.updatePage);

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman 1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Ini adalah Halaman 1'),
            ElevatedButton(
              child: Text('Kembali ke Halaman Utama'),
              onPressed: () {
                widget.updatePage('Halaman Utama');
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Implementasi Page2
class Page2 extends StatefulWidget {
  final Function updatePage;

  Page2(this.updatePage);

  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Ini adalah Halaman 2'),
            ElevatedButton(
              child: Text('Kembali ke Halaman Utama'),
              onPressed: () {
                widget.updatePage('Halaman Utama');
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Implementasi Page3
class Page3 extends StatefulWidget {
  final Function updatePage;

  Page3(this.updatePage);

  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman 3'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Ini adalah Halaman 3'),
            ElevatedButton(
              child: Text('Kembali ke Halaman Utama'),
              onPressed: () {
                widget.updatePage('Halaman Utama');
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
