import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../component/app_loding.dart';
import '../component/user_list_row.dart';
import '../model/users_list_model.dart';
import '../view_model/users_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UsersViewModel usersViewModel = context.watch<UsersViewModel>();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 235, 235, 235),
      appBar: AppBar(
        title: const Text('Flutter Provider'),
      ),
      body: Container(
        child: _ui(usersViewModel),
      ),
    );
  }

  _ui(UsersViewModel usersViewModel) {
    if (usersViewModel.loading) {
      return AppLoading();
    }
    if (usersViewModel.userError != null) {
      return Container(
        child: Text(usersViewModel.userError!.message.toString()),
      );
    }
    return SingleChildScrollView(
      child: Column(
        children: [
          ...List.generate(
            usersViewModel.userListModel.length,
            (index) {
              UserModel userModel = usersViewModel.userListModel[index];
              return UserListRow(userModel: userModel, onTap: () async {});
            },
          )
        ],
      ),
    );
  }
}
