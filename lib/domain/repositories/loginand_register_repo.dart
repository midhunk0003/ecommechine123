import 'package:dartz/dartz.dart';
import 'package:globalecomersmachinetesting/data/core/failure.dart';
import 'package:globalecomersmachinetesting/data/core/success.dart';
import 'package:globalecomersmachinetesting/data/model/login_model/login_model.dart';
import 'package:globalecomersmachinetesting/data/model/registermodel.dart';

abstract class LoginandRegisterRepo {
  Future<Either<Failure, RegisterModel>> register(
    String? userName,
    String? email,
    String? password,
  );

  Future<Either<Failure, LoginModel>> login(String? username, String? password);
}
