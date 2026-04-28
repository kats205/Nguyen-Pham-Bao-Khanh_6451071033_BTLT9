import 'package:flutter/material.dart';
import '../controllers/auth_controller.dart';
import 'login_view.dart';

class HomeAuthView extends StatelessWidget {
  const HomeAuthView({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController controller = AuthController();
    final user = controller.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home - MSSV: 6451071033'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await controller.signOut();
              if (context.mounted) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginView()),
                );
              }
            },
          )
        ],
      ),
      body: Center(
        child: Text('Xin chào, ${user?.email ?? "Không rõ"}!', style: const TextStyle(fontSize: 18)),
      ),
    );
  }
}
