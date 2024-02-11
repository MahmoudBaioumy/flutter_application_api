import 'package:flutter/material.dart';
import 'package:flutter_application_api/Api_sevise.dart';
import 'package:flutter_application_api/post_model/post_model.dart';

class postView extends StatefulWidget {
  const postView({super.key});

  @override
  State<postView> createState() => _postViewState();
}

class _postViewState extends State<postView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'posts',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        //fac of get
        future: ApiServices.getposts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
                itemBuilder: (context, index) {
                  // to around the list of post model
                  PostModel post = snapshot.data![index];
                  ///// to post posts
                  return ListTile(
                    leading: Text(post.id.toString()),
                    title: Text(post.title.toString()),
                    subtitle: Text(post.body.toString()),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemCount: snapshot.data!.length);
          } else if (snapshot.hasError) {
            return const Text('errrror');
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
