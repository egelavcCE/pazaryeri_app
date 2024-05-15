
// common_widgets.dart

import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFFFFFFFF),
      title: Text(
        "PAZARYERİ",
        style: TextStyle(color: Color(0xFFF2BC8D), fontSize: 24),
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: IconButton(
            icon: Icon(
              Icons.notifications,
              color: Color(0xFFF2BC8D),
              size: 36,
            ),
            onPressed: () {
              // Bildirimler işlevini buraya ekle
            },
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class CustomBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Color(0xFFF2BC8D), // Navigasyon çubuğunun arka plan rengi
        ),
        child: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Ana Sayfa',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favoriler',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: 'Sepet',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: 'Profil',
              ),
            ],
            selectedItemColor: Color(0xFFBF4F36),
            unselectedItemColor: Colors.white,
            selectedLabelStyle: TextStyle(color: Color(0xFFBF4F36)),
        ),
    );
  }
}