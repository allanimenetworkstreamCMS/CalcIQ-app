import 'package:flutter/material.dart';

void main() {
  runApp(const CalcIQApp());
}

class CalcIQApp extends StatelessWidget {
  const CalcIQApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CalcIQ',
      debugShowCheckedModeBanner: false,
      // Light Theme (Corporate Blue accents)
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
      ),
      // Dark Theme (Neon Blue accents)
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFF121212),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1E1E1E),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      themeMode: ThemeMode.system, // Auto-adapts to phone setting
      home: const MainNavigationScreen(),
    );
  }
}

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({Key? key}) : super(key: key);

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  // Placeholder lists for our 5 main tabs
  final List<Widget> _screens = [
    const Center(child: Text('Home Dashboard Screen (Coming Next)')),
    const Center(child: Text('EMI Calculator Screen')),
    const Center(child: Text('SIP Calculator Screen')),
    const Center(child: Text('GST Calculator Screen')),
    const Center(child: Text('Budget Tracker Screen')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.account_balance), label: 'EMI'),
          BottomNavigationBarItem(icon: Icon(Icons.trending_up), label: 'SIP'),
          BottomNavigationBarItem(icon: Icon(Icons.percent), label: 'GST'),
          BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet), label: 'Budget'),
        ],
      ),
    );
  }
}
