import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_http/services/post.service.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  void initState() {
    super.initState();
    final postService = context.read<PostService>();
    postService.fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    final posts = context.watch<PostService>().posts;
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Posts"),
        ),
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListTile(
              style: ListTileStyle.list,
              title: Text(post.title),
              subtitle: Text(post.tags.toString()),
            ),
          );
        },
      ),
    );
  }
}
