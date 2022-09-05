import 'package:flutter/material.dart';
import 'package:insta_clone/create_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CreatePage()));
        },
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.add),
      ),
    );
  }

  _buildBody() {
    return GridView.builder(
        itemCount: 5,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.0,
          mainAxisSpacing: 1.0,
          crossAxisSpacing: 1.0,
        ),
        itemBuilder: _buildListItem);
  }

  Widget _buildListItem(BuildContext context, int index) {
    return Image.network(
        'https://t4.ftcdn.net/jpg/00/76/27/53/360_F_76275384_mRNrmAI89UPWoWeUJfCL9CptRxg3cEoF.jpg');
  }
}
