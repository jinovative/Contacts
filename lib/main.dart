import 'package:contact/providers/contacts_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/dialer_screen.dart';
import 'screens/contacts_screen.dart';
import 'screens/call_log_screen.dart';
import 'screens/favorites_screen.dart';
import 'screens/voicemail_screen.dart';

void main() => runApp(
  ChangeNotifierProvider(
    create: (context) => ContactsProvider(),
    child: MyApp(),
  ),
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 3;
  final List<Widget> _screens = [
    FavoritesScreen(),
    CallLogScreen(),
    ContactsScreen(),
    DialerScreen(),
    VoicemailScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.star), label: '즐겨찾기'),
          BottomNavigationBarItem(icon: Icon(Icons.call), label: '통화 기록'),
          BottomNavigationBarItem(icon: Icon(Icons.contacts), label: '연락처'),
          BottomNavigationBarItem(icon: Icon(Icons.dialpad), label: '다이얼'),
          BottomNavigationBarItem(icon: Icon(Icons.voicemail), label : '보이스메일')
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.lightBlue[700], // 선택된 아이템의 색상
        unselectedItemColor: Colors.grey, // 선택되지 않은 아이템의 색상
        onTap: _onItemTapped,
      ),
    );
  }
}
