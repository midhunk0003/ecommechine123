import 'package:flutter/material.dart';
import 'package:globalecomersmachinetesting/domain/repositories/loginand_register_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class Loginandregisterprovider extends ChangeNotifier {
  final LoginandRegisterRepo loginandRegisterRepo;

  Loginandregisterprovider({required this.loginandRegisterRepo});

  bool _isloading = false;
  String? _errorMessage;
  String? _messagerespons;

  // getter

  bool get isLoading => _isloading;
  String? get errorMessage => _errorMessage;
  String? get messagerespons => _messagerespons;

  Future<void> registerprovider(
    BuildContext context,
    String? userName,
    String? email,
    String? password,
  ) async {
    _isloading = true;
    _errorMessage = null;
    notifyListeners();

    final result = await loginandRegisterRepo.register(
      userName,
      email,
      password,
    );

    print("result : ${result}");

    result.fold((failure) {
      _errorMessage = failure.message;
      print("12345");
      _isloading = false;
      notifyListeners();
      // Display the error message in a snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(_errorMessage ?? 'An error occurred'),
          backgroundColor: Colors.red,
        ),
      );
    }, (successreg) {
      _messagerespons = successreg.message;
      _isloading = false;
      print("333333333");
      notifyListeners();
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(successreg.message ?? 'Registration successful'),
          backgroundColor: Colors.green,
        ),
      );
    });
  }

  Future<void> loginProvider(
    BuildContext context,
    String? userName,
    String? password,
  ) async {
    _isloading = true;
    _errorMessage = null;
    notifyListeners();

    final result = await loginandRegisterRepo.login(
      userName,
      password,
    );

    print("result : ${result}");

    result.fold((failure) {
      _errorMessage = failure.message;
      print("12345");
      _isloading = false;
      notifyListeners();
      // Display the error message in a snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(_errorMessage ?? 'An error occurred'),
          backgroundColor: Colors.red,
        ),
      );
    }, (successreg) {
      _messagerespons = successreg.message;
      _isloading = false;
      print("333333333");
      notifyListeners();
      Navigator.pushReplacementNamed(context, '/homescreen');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(successreg.message ?? 'login successful'),
          backgroundColor: Colors.green,
        ),
      );
    });
  }
}
