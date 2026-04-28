import 'package:firebase_auth/firebase_auth.dart';
import '../repositories/auth_repository.dart';

class AuthController {
  final AuthRepository _repository = AuthRepository();

  User? get currentUser => _repository.currentUser;

  Future<String?> signIn(String email, String password) async {
    try {
      await _repository.signIn(email, password);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message ?? 'Lỗi đăng nhập';
    } catch (e) {
      return e.toString();
    }
  }

  Future<String?> signUp(String email, String password) async {
    try {
      await _repository.signUp(email, password);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message ?? 'Lỗi đăng ký';
    } catch (e) {
      return e.toString();
    }
  }

  Future<void> signOut() async {
    await _repository.signOut();
  }
}
