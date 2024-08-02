import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../model/post_response.dart';
import '../../repositry/UserRepository.dart';

part 'post_event.dart';
part 'post_state.dart';


class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository postRepository;

  PostBloc(this.postRepository) : super(PostInitial()) {
    // Handle LoadPosts event
    on<LoadPosts>((event, emit) async {
      emit(PostLoading()); // Set state to loading

      try {
        // Fetch posts from repository
        final posts = await postRepository.getPosts();
        emit(PostLoaded(posts)); // Set state to loaded with posts
      } catch (e) {
        emit(PostError(e.toString())); // Set state to error
      }
    });
  }
}