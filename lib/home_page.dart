import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatelessWidget {

  final User user;

  const HomePage(this.user, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Instagram Clone',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const Text(
                  'Instagram에 오신 것을 환영합니다.',
                  style: TextStyle(fontSize: 24.0),
                ),
                const Padding(padding: EdgeInsets.all(8.0)),
                const Text('사진과 동영상을 보려면 팔로우 하세요.'),
                const Padding(padding: EdgeInsets.all(16.0)),
                SizedBox(
                  width: 260.0,
                  child: Card(
                    elevation: 4.0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          SizedBox(
                            width: 80.0,
                            height: 80.0,
                            child: CircleAvatar(backgroundImage: NetworkImage(user.photoURL!),),
                          ),
                          const Padding(padding: EdgeInsets.all(8.0)),
                          Text(user.email!, style: const TextStyle(fontWeight: FontWeight.bold),),
                          Text(user.displayName!),
                          const Padding(padding: EdgeInsets.all(8.0)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 70.0,
                                height: 70.0,
                                child: Image.network(
                                    'https://t4.ftcdn.net/jpg/00/76/27/53/360_F_76275384_mRNrmAI89UPWoWeUJfCL9CptRxg3cEoF.jpg',
                                    fit: BoxFit.cover,
                                ),
                              ),
                              const Padding(padding: EdgeInsets.all(1.0)),
                              SizedBox(
                                width: 70.0,
                                height: 70.0,
                                child: Image.network(
                                  'https://t4.ftcdn.net/jpg/00/76/27/53/360_F_76275384_mRNrmAI89UPWoWeUJfCL9CptRxg3cEoF.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const Padding(padding: EdgeInsets.all(1.0)),
                              SizedBox(
                                width: 70.0,
                                height: 70.0,
                                child: Image.network(
                                  'https://t4.ftcdn.net/jpg/00/76/27/53/360_F_76275384_mRNrmAI89UPWoWeUJfCL9CptRxg3cEoF.jpg',
                                  fit: BoxFit.cover,
                                ),
                              )
                            ],
                          ),
                          const Padding(padding: EdgeInsets.all(4.0)),
                          const Text('Facebook 친구'),
                          const Padding(padding: EdgeInsets.all(4.0)),
                          ElevatedButton(
                            onPressed: () {},
                            style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  Colors.blueAccent),
                            ),
                            child: const Text(
                              '팔로우',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          const Padding(padding: EdgeInsets.all(4.0)),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
