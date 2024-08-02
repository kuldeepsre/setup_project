import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../api/api_services.dart';
import '../bloc/post_data/post_bloc.dart';
import '../repositry/UserRepository.dart';

class PostListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Posts')),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state is PostLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is PostLoaded) {
            return ListView.builder(
              itemCount: state.posts.length,
              itemBuilder: (context, index) {
                final post = state.posts[index];
                return ListTile(
                  title: Text(post.title),
                  subtitle: Text(post.body),
                );
              },
            );
          } else if (state is PostError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          return Center(child: Text('No data'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<PostBloc>().add(LoadPosts());
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}

