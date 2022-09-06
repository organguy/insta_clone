import 'package:flutter/material.dart';

class DetailPostPage extends StatelessWidget {
  final dynamic documnet;

  const DetailPostPage(this.documnet, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '둘러보기',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(documnet['userPhotoUrl']),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        documnet['email'],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(documnet['displayName'])
                    ],
                  ),
                ),
              ],
            ),
          ),
          Hero(
              tag: documnet['photoUrl'],
              child: Image.network(documnet['photoUrl'])),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(documnet['contents']),
          )
        ],
      ),
    ));
  }
}
