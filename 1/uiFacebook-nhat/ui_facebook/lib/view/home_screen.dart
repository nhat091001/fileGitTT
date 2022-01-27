import 'package:flutter/material.dart';
import 'package:ui_facebook/view/NotificationScreen.dart';
import 'package:ui_facebook/view/PageScreen.dart';
import 'package:ui_facebook/view/index_screen.dart';
import 'package:ui_facebook/view/menu_screen.dart';
import 'package:ui_facebook/view/watch_screen.dart';

import '../data/datafb.dart';
import '../model/post_model.dart';
import '../model/story_model.dart';
import '../model/user_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          title: Text(
            'facebook',
            style: const TextStyle(
              color: Colors.blue,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              letterSpacing: -1.2,
            ),
            ),
              centerTitle: false,
              floating: true,
              actions: [
                Container(
                  margin: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/icons/search.png',
                    width: 20,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/icons/messenger.png',
                    width: 20,
                  ),
                ),
              ],
            ),
            //-------------------------------------------
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          child: Stack(
                            children: [
                              CircleAvatar(
                                radius: 20.0,
                                backgroundColor: Colors.lightBlue,
                                child: CircleAvatar(
                                  backgroundColor: Colors.grey[200],
                                  backgroundImage: NetworkImage(
                                     'https://bloganh.net/wp-content/uploads/2021/03/chup-anh-dep-anh-sang-min.jpg'),
                                ),
                              ),

                            ],
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration.collapsed(
                              hintText: 'Bạn đang nghĩ gì?',
                            ),
                          ),
                        )
                      ],
                    ),
                    const Divider(height: 10.0, thickness: 0.5),
                    Container(
                      height: 40.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FlatButton.icon(
                            onPressed: () => print('Live'),
                            icon: const Icon(
                              Icons.videocam,
                              color: Colors.red,
                            ),
                            label: Text('Phát'),
                          ),
                          const VerticalDivider(width: 8.0),
                          FlatButton.icon(
                            onPressed: () => print('Ảnh'),
                            icon: const Icon(
                              Icons.photo_library,
                              color: Colors.green,
                            ),
                            label: Text('Ảnh'),
                          ),
                          const VerticalDivider(width: 8.0),
                          FlatButton.icon(
                            onPressed: () => print('Phòng họp '),
                            icon: const Icon(
                              Icons.video_call,
                              color: Colors.purpleAccent,
                            ),
                            label: Text('Phòng họp'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //------------------------------------------------------------------------------------

            //--------------------------------------------------------------------------------------
            SliverPadding(padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
            sliver: SliverToBoxAdapter(
              child: Container(
                height: 60.0,
                color: Colors.white,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 4.0,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: 1 ,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: _CreateRoomButton(),
                      );
                    }
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        child: Image.asset('assets/images/banner.jpg'),
                      )
                    );
                  },
                ),
              ),
            ),
            ),
            //-------------------------------------------------------------------------------------
            SliverPadding(padding:const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
            sliver: SliverToBoxAdapter(
              child: Container(
                height: 200.0,
                color: Colors.white,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 8.0,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: 1 + stories.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: _StoryCard(
                        ),
                      );
                    }
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: _StoryCard(),
                    );
                  },
                ),
              ),
            ),
            ),

            //-----------------------------------------------------------
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  final Post post = posts[index];
                  return Container();
                },
                childCount: posts.length,
              ),
            ),
          ],
          // child: Container(
          //   child: Container(
          //     child: DefaultTabController(
          //       length: 5,
          //       child: Scaffold(
          //         appBar: AppBar(
          //           backgroundColor: Colors.white,
          //           elevation: 0,
          //           title: Text(
          //             'FACEBOOK',
          //             style: TextStyle(
          //                 color: Colors.blue.shade700,
          //                 fontWeight: FontWeight.bold,
          //                 fontSize: 30),
          //           ),
          //           actions: [
          //             Row(
          //               children: [
          //                 Container(
          //                   child: Image.asset(
          //                     'assets/icons/search.png',
          //                     width: 25,
          //                   ),
          //                 ),
          //                 SizedBox(
          //                   width: 20,
          //                 ),
          //                 Container(
          //                   margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
          //                   child: Image.asset(
          //                     'assets/icons/messenger.png',
          //                     width: 25,
          //                   ),
          //                 ),
          //                 // Container(
          //                 //   child: CircleAvatar(
          //                 //     radius: 45,
          //                 //     backgroundImage: NetworkImage(
          //                 //         'https://bloganh.net/wp-content/uploads/2021/03/chup-anh-dep-anh-sang-min.jpg'),
          //                 //   ),
          //                 // ),
          //               ],
          //             )
          //           ],
          //           bottom: TabBar(
          //             tabs: [
          //               Tab(
          //                 icon: Icon(
          //                   Icons.home,
          //                   size: 30,
          //                   color: Colors.black,
          //                 ),
          //               ),
          //               Tab(
          //                   icon: Image.asset(
          //                 'assets/icons/watch-movie.png',
          //                 width: 30,
          //               )),
          //               Tab(
          //                 icon: Icon(
          //                   Icons.flag,
          //                   size: 30,
          //                   color: Colors.black,
          //                 ),
          //               ),
          //               Tab(
          //                 icon: Icon(
          //                   Icons.notifications_active,
          //                   size: 30,
          //                   color: Colors.black,
          //                 ),
          //               ),
          //               Tab(
          //                 icon: Icon(
          //                   Icons.menu,
          //                   size: 30,
          //                   color: Colors.black,
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //         body: Container(
          //           child: TabBarView(
          //             children: [
          //               Container(child: IndexScreen()),
          //               Container(
          //                 child: WatchScreen(),
          //               ),
          //               Container(
          //                 child: PageScreen(),
          //               ),
          //               Container(
          //                 child: NotificationScreen(),
          //               ),
          //               Container(
          //                 child: MenuScreen(),
          //               ),
          //             ],
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ),
      ),
    );
  }

}

class _CreateRoomButton extends StatelessWidget {
  static const LinearGradient createRoomGradient = LinearGradient(
    colors: [Color(0xFF496AE1), Color(0xFFCE48B1)],
  );
  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      onPressed: () => print('Create Room'),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      color: Colors.white,
      borderSide: BorderSide(
        width: 3.0,
        color: Colors.blueAccent,
      ),
      textColor: Colors.blue,
      child: Row(
        children: [
          ShaderMask(
            shaderCallback: (rect) =>
                createRoomGradient.createShader(rect),
            child: Icon(
              Icons.video_call,
              size: 35.0,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 4.0),
          Text('Tạo phòng'),
        ],
      ),
    );
  }
}

//-----------------------------------------------
class _StoryCard extends StatelessWidget {




  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: Image.asset('assets/images/banner.jpg',width: 100,fit: BoxFit.cover,height: double.infinity,)
        ),
        Container(
          height: double.infinity,
          width: 110.0,
          decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        Positioned(
          top: 8.0,
          left: 8.0,
          child:
               Container(
            height: 40.0,
            width: 40.0,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: const Icon(Icons.add),
              iconSize: 30.0,
              color: Colors.blue,
              onPressed: () => print('Tạo tin'),
            ),
          )
        ),
        Positioned(
          bottom: 8.0,
          left: 8.0,
          right: 8.0,
          child: Text(
           'Tạo tin' ,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
