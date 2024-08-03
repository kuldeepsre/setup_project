import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/user/user_bloc.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Users')),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoading && (state as UserLoaded).users.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is UserLoad) {
            final users = state.users;
            final hasReachedMax = state.hasReachedMax;

            return NotificationListener<ScrollNotification>(
              onNotification: (scrollInfo) {
                if (!hasReachedMax &&
                    scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
                  context.read<UserBloc>().add(LoadUser(
                    page: (users.length ~/ 10) + 1,
                    perPage: 10,
                  ));
                }
                return false;
              },
              child: ListView.builder(
                itemCount: users.length + 1,
                itemBuilder: (context, index) {
                  if (index >= users.length) {
                    return hasReachedMax
                        ? const SizedBox.shrink()
                        : const Center(child: CircularProgressIndicator());
                  }
                  final user = users[index];
                  return ListTile(
                    title: Text(user.name),
                    subtitle: Text(user.email),
                  );
                },
              ),
            );
          }

          if (state is UserError) {
            return Center(child: Text('Error: ${state.message}'));
          }

          return const Center(child: Text('No data'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<UserBloc>().add(LoadUsers());
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}