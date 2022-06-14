import 'package:flutter/material.dart';
import '/utils/colors/app_colors.dart';
import '/view/screens/cart_screen.dart';
import '/view/screens/profile_screen.dart';
import '/view/screens/store_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _controller = PageController(initialPage: 0);
  int _selectedItemIndex = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      body: PageView(
        onPageChanged: (index) {
          setState(() {
            _selectedItemIndex = index;
          });
        },
        controller: _controller,
        children: const [
          StoreScreen(),
          CartScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(top: 10),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 10,
              ),
            ]),
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildNavBarItem(
              index: 0,
              icon: Icons.store,
              label: 'Loja',
            ),
            buildNavBarItem(
              index: 1,
              icon: Icons.shopping_cart_outlined,
              label: 'Carrinho',
            ),
            buildNavBarItem(
              index: 2,
              icon: Icons.person,
              label: 'Perfil',
            ),
          ],
        ),
      ),
    );
  }

  Widget buildNavBarItem({
    required int index,
    required IconData icon,
    required String label,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedItemIndex = index;
        });
        _controller.jumpToPage(_selectedItemIndex);
      },
      child: SizedBox(
        child: Column(
          children: [
            Icon(
              icon,
              size: 27,
              color: index == _selectedItemIndex
                  ? AppColors.backgroundSignInColor
                  : Colors.grey,
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: index == _selectedItemIndex
                    ? AppColors.backgroundSignInColor
                    : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
