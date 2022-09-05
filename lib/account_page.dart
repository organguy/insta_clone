import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.exit_to_app,
              color: Colors.black,
            ))
      ],
    );
  }

  _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Stack(
                children: [
                  const SizedBox(
                    width: 80.0,
                    height: 80.0,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://t4.ftcdn.net/jpg/00/76/27/53/360_F_76275384_mRNrmAI89UPWoWeUJfCL9CptRxg3cEoF.jpg'),
                    ),
                  ),
                  Container(
                    width: 80.0,
                    height: 80.0,
                    alignment: Alignment.bottomRight,
                    child: Stack(
                      alignment: Alignment.center,
                      children: const [
                        SizedBox(
                          width: 28.0,
                          height: 28.0,
                          child: FloatingActionButton(
                            onPressed: null,
                            backgroundColor: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 25.0,
                          height: 25.0,
                          child: FloatingActionButton(
                            onPressed: null,
                            backgroundColor: Colors.blue,
                            child: Icon(Icons.add),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const Padding(padding: EdgeInsets.all(4.0)),
              const Text(
                '이름',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              )
            ],
          ),
          const Text(
            '4\n게시물',
            style: TextStyle(fontSize: 18.0),
            textAlign: TextAlign.center,
          ),
          const Text(
            '0\n팔로워',
            style: TextStyle(fontSize: 18.0),
            textAlign: TextAlign.center,
          ),
          const Text(
            '0\n팔로잉',
            style: TextStyle(fontSize: 18.0),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
