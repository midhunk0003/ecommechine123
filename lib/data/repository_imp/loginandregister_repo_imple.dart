import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:globalecomersmachinetesting/data/core/failure.dart';
import 'package:globalecomersmachinetesting/data/core/success.dart';
import 'package:globalecomersmachinetesting/data/model/login_model/login_model.dart';
import 'package:globalecomersmachinetesting/data/model/registermodel.dart';
import 'package:globalecomersmachinetesting/domain/repositories/loginand_register_repo.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@LazySingleton(as: LoginandRegisterRepo)
class LoginandregisterRepoImple implements LoginandRegisterRepo {
  @override
  Future<Either<Failure, RegisterModel>> register(
    String? userName,
    String? email,
    String? password,
  ) async {
    final client = http.Client();

    try {
      final response = await client.post(
          Uri.parse(
              "https://globosoft.co.uk/ecommerce-api/api/auth/register.php"),
          // headers: {
          //   'Content-Type': 'application/json'
          // },

          body: {
            'username': userName,
            'email': email,
            'password': password,
          });

      print("register repoimplimetation ${response.body}");

      if (response.statusCode == 200) {
        print("222222222222222");

        var responseData = response.body;
        print("rrrrrrrrrrr : ${responseData.toString()}");
        final String regRes = responseData;
        print("444444444444444");
        // final successMessage = responseData;
        print("Success message: $regRes");
        return Right(RegisterModel(message: regRes));
      } else {
        return Left(ServerFailure('Server error: ${response.statusCode}'));
      }
    } on SocketException {
      return Left(
        NetworkFailure('No internet connection'),
      );
    } catch (e) {
      print("dddddddd : ${e.toString()}");
      return Left(
        ServerFailure(
          e.toString(),
        ),
      );
    } finally {
      client.close();
    }
  }

  @override
  Future<Either<Failure, LoginModel>> login(
      String? username, String? password) async {
    final client = http.Client();
    try {
      final response = await client.post(
          Uri.parse("https://globosoft.co.uk/ecommerce-api/api/auth/login.php"),
          // headers: {
          //   'Content-Type': 'application/json'
          // },
          body: {
            'username': username,
            'password': password,
          });

      print("login repoimplimetation ${response.body}");

      if (response.statusCode == 200) {
        print("222222222222222");
        // LoginModel loginModel = LoginModel.fromJson(jsonDecode(response.body));
        final responseData = response.body;
        print("444444444444444");
        final successMessage = responseData;
        print("Success message: $successMessage");
        return Right(LoginModel(message: successMessage));
      } else {
        return Left(
          ServerFailure(
            'Server error: ${response.statusCode}',
          ),
        );
      }
    } on SocketException {
      return Left(
        NetworkFailure('No internet connection'),
      );
    } catch (e) {
      print("dddd${e.toString()}");
      return Left(
        ServerFailure(
          e.toString(),
        ),
      );
    } finally {
      client.close();
    }
  }
}
