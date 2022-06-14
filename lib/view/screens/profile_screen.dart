import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '/controller/stores/user_store.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  UserStore userStore = UserStore();

  @override
  void initState() {
    userStore.getProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Perfil',
          style: TextStyle(
            color: Colors.black,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Observer(builder: (context) {
        var sizeScreen = MediaQuery.of(context).size;
        return userStore.profile != null
            ? Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: const Color(0xFFEAEAEA).withOpacity(0.28),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          width: 1,
                          color: const Color(0xFF404040).withOpacity(0.28),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              foregroundImage:
                                  NetworkImage(userStore.profile!.avatar!),
                              maxRadius: 30,
                              minRadius: 20,
                            ),
                            const SizedBox(width: 20),
                            Text(
                              userStore.profile!.name,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    LogoutButton(sizeScreen: sizeScreen),
                  ],
                ),
              )
            : const Center(child: CircularProgressIndicator());
      }),
    );
  }
}

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    Key? key,
    required this.sizeScreen,
  }) : super(key: key);

  final Size sizeScreen;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: sizeScreen.height * 0.08,
        width: sizeScreen.width,
        decoration: BoxDecoration(
          color: const Color(0xFFEAEAEA).withOpacity(0.28),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            width: 1,
            color: const Color(0xFF404040).withOpacity(0.28),
          ),
        ),
        child: const Center(
            child: Text(
          'Fazer logout',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Color(0xFF5B4DA7),
          ),
        )),
      ),
    );
  }
}
