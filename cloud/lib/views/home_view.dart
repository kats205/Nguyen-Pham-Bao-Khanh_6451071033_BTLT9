import 'package:flutter/material.dart';
import 'exercise_one_view.dart';
import 'login_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh sách bài tập'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildExerciseTile(
            context,
            title: 'Bài 1: Quản lý công việc (To-do List)',
            subtitle: 'Firestore CRUD (Real-time)',
            target: const ExerciseOneView(),
          ),
          _buildExerciseTile(
            context,
            title: 'Bài 2: Đăng ký / Đăng nhập',
            subtitle: 'Firebase Authentication',
            target: const LoginView(),
          ),
          _buildExerciseTile(
            context,
            title: 'Bài 3: (Đang cập nhật)',
            subtitle: 'Sắp ra mắt...',
            target: null,
          ),
        ],
      ),
    );
  }

  Widget _buildExerciseTile(
    BuildContext context, {
    required String title,
    required String subtitle,
    Widget? target,
  }) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: target != null
            ? () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => target),
                )
            : () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Bài tập này chưa được triển khai.')),
                );
              },
      ),
    );
  }
}
