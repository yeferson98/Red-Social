import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'class/people.dart';

class DetailPeople extends StatefulWidget {
  final People people;
  const DetailPeople({Key? key, required this.people}) : super(key: key);

  @override
  State<DetailPeople> createState() => _DetailPeopleState();
}

class _DetailPeopleState extends State<DetailPeople> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: size.width,
            height: size.height * .8,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(widget.people.urlImage), fit: BoxFit.fill),
            ),
          ),
          Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(color: Colors.grey.withOpacity(0.3)),
          ),
          Align(
            alignment: Alignment.topRight,
            child: InkWell(
              child: Padding(
                padding: EdgeInsets.only(top: size.height * .06, right: 20),
                child: const Icon(
                  Icons.close_fullscreen,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: size.width,
              height: size.height * .5,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: Column(
                  children: [
                    headerUser(),
                    SizedBox(
                      height: 80,
                      width: double.infinity,
                      child: detailUser(),
                    ),
                    const Divider(height: 40, color: Colors.grey),
                    Expanded(
                      child: ListView(
                        children: [
                          comments(
                            userName: 'Michael Rojas',
                            hour: '10:30 AM',
                            description: 'Great! Love it',
                          ),
                          comments(
                            userName: 'Lucía Williams',
                            hour: '10:30 PM',
                            description: 'Have a nice day!',
                          ),
                          comments(
                            userName: 'Mike Barnard',
                            hour: '3:30 PM',
                            description: 'You are very beautiful',
                          ),
                          comments(
                            userName: 'George Miller',
                            hour: '5:30 PM',
                            description: 'Every day look better',
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Padding headerUser() {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: CircleAvatar(
                  radius: 36,
                  backgroundImage: AssetImage(widget.people.urlImage),
                ),
              ),
              Column(
                children: [
                  Text(
                    '${widget.people.name.split('\n')[0]}${widget.people.name.split('\n')[1]}',
                    style: Theme.of(context).textTheme.headline4!.merge(
                          const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                          ),
                        ),
                  ),
                  Text(
                    '25k+ followers',
                    style: Theme.of(context).textTheme.caption!.merge(
                          const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                  ),
                ],
              ),
            ],
          ),
          const Chip(
            label: Text(
              'Live',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.greenAccent,
          )
        ],
      ),
    );
  }

  Padding detailUser() {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 5),
                  child: Icon(
                    Icons.comment,
                    color: Colors.grey,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Text(
                    '165',
                    style: Theme.of(context).textTheme.headline4!.merge(
                          const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                  ),
                ),
                Text(
                  'comments',
                  style: Theme.of(context).textTheme.headline4!.merge(
                        const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 2),
                  child: Column(
                    children: [
                      Text(
                        '162 Peoples',
                        style: Theme.of(context).textTheme.headline4!.merge(
                              const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                      ),
                      Text(
                        'followings',
                        style: Theme.of(context).textTheme.headline4!.merge(
                              const TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: getAvatars(),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget getAvatars() {
    int countPeople = 0;
    int countIndex = 0;
    if (widget.people.followers.length > 3) {
      countIndex = 3;
    }
    return Stack(
      children: [
        ...List.generate(
          countIndex,
          (index) {
            countPeople++;
            return Positioned(
              left: (17 * index).toDouble(),
              child: buildPeople(widget.people.followers[index].urlImage),
            );
          },
        ),
        if (widget.people.followers.length > 3)
          Positioned(
            left: (17 * countPeople).toDouble(),
            child: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.all(
                  Radius.circular(40),
                ),
              ),
              child: Center(
                child: Text(
                  "+${widget.people.followers.length - countIndex}",
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          )
      ],
    );
  }

  Container buildPeople(String img) {
    return Container(
      height: 40,
      width: 40,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(40),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: ClipOval(
          child: Image.asset(
            img,
            height: 40,
            width: 40,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Padding comments({
    required String userName,
    required String hour,
    required description,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                userName,
                style: Theme.of(context).textTheme.headline4!.merge(
                      const TextStyle(
                        color: Colors.greenAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
              ),
              Text(
                hour,
                style: Theme.of(context).textTheme.caption!.merge(
                      const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 10),
            child: Text(
              description,
              style: Theme.of(context).textTheme.headline4!.merge(
                    const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
            ),
          ),
          const Divider(
            height: 10,
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}
