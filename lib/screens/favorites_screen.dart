import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  final List<FavoriteContact> favoriteContacts = [
    FavoriteContact(name: 'Alice', phone: '010-1234-5678'),
    FavoriteContact(name: 'Bob', phone: '010-9876-5432'),
    // 여기에 더 많은 즐겨찾기 연락처 추가
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('즐겨찾기'),
      ),
      body: ListView.builder(
        itemCount: favoriteContacts.length,
        itemBuilder: (context, index) {
          final favoriteContact = favoriteContacts[index];
          return ListTile(
            leading: Icon(Icons.star),
            title: Text(favoriteContact.name),
            subtitle: Text(favoriteContact.phone),
            onTap: () {
              // 즐겨찾기 연락처 상세 화면으로 이동하거나 다른 동작 수행
            },
          );
        },
      ),
    );
  }
}

class FavoriteContact {
  final String name;
  final String phone;

  FavoriteContact({required this.name, required this.phone});
}
