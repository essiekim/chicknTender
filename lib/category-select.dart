import 'package:flutter/material.dart';
import 'package:ChicknTender/home.dart';
// import 'package:toggle_switch/toggle_switch.dart';

class CategorySelect extends StatefulWidget {
  CategorySelect({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _CategorySelectState createState() => _CategorySelectState();
}

class _CategorySelectState extends State<CategorySelect> {
  bool _liked = false;
  bool _disliked = true;
  List<bool> isSelected = [false, true];

  List<bool> _counter = new List.filled(12, false, growable: false);
  List<bool> _preferences = new List.filled(12, false, growable: false);

  List _categories = [
    {
      'name': 'American',
      'imgUrl':
          'https://images.pexels.com/photos/70497/pexels-photo-70497.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260',
      'subtitle': 'Good ol\' fashioned burgers and fries.'
    },
    {
      'name': 'Korean',
      'imgUrl':
          'https://images.pexels.com/photos/2313686/pexels-photo-2313686.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
      'subtitle': 'Korean Barbeque counts.'
    },
    {
      'name': 'Chinese',
      'imgUrl':
          'https://images.askmen.com/1080x540/2017/01/25-043929-can_you_make_chinese_takeout_healthy.jpg',
      'subtitle': 'Try authentic Chinese food, not just take out.'
    },
    {
      'name': 'Fast Food',
      'imgUrl':
          'https://images.pexels.com/photos/2119758/pexels-photo-2119758.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
      'subtitle': 'It\'s okay to have some Mickey D\'s every now and then.'
    },
    {
      'name': 'Tacos',
      'imgUrl':
          'https://s23209.pcdn.co/wp-content/uploads/2019/08/Easy-Chicken-TacosIMG_9890.jpg',
      'subtitle': 'Mmm. Delish. Every day can be Taco Tuesday.'
    },
    {
      'name': 'Italian',
      'imgUrl':
          'https://www.englishclub.com/images/vocabulary/food/italian/italian-food-640.jpg',
      'subtitle': 'Carbs never tasted this good. Don\'t forget the cheese!'
    },
    {
      'name': 'Healthy',
      'imgUrl':
          'https://online.ahu.edu/wp-content/uploads/2019/03/Healthy-Food-Doesnt-Have-To-Be-Expensive.jpg',
      'subtitle': 'Munch on some leaves. It\'s good for you, I promise.'
    },
    {
      'name': 'Japanese',
      'imgUrl':
          'https://images.pexels.com/photos/2098085/pexels-photo-2098085.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
      'subtitle': '(Did someone say All-You-Can-Eat sushi?)'
    },
    {
      'name': 'Thai',
      'imgUrl':
          'https://images.pexels.com/photos/1437590/pexels-photo-1437590.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
      'subtitle': 'When was the last Thai\'me you had Thai food? (I\'m sorry).'
    },
    {
      'name': 'Anything Cheap',
      'imgUrl':
          'https://pics.me.me/im-hungry-i-dad-joke-papa-what-mean-da-d-35783140.png',
      'subtitle': 'I am proud of you.'
    },
    {
      'name': 'Pizza',
      'imgUrl':
          'https://images.pexels.com/photos/208537/pexels-photo-208537.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
      'subtitle': 'A classic option. You can\'t go wrong.'
    },
    {
      'name': 'Vietnamese',
      'imgUrl':
          'https://assets3.thrillist.com/v1/image/2834790/size/gn-gift_guide_variable_c.jpg',
      'subtitle': 'The answer is always Pho. Always.'
    }
  ];

  _pressedLike(index) {
    return this.setState(() {
      if (this._liked) {
        this._liked = false;
        this._preferences[index] = false;
      } else {
        this._liked = true;
        this._preferences[index] = true;
      }
      this._counter[index] = true;
    });
  }

  _pressedDislike(index) {
    return this.setState(() {
      if (this._disliked) {
        this._disliked = false;
        this._preferences[index] = false;
      } else {
        this._disliked = true;
        _preferences[index] = true;
      }
      this._counter[index] = true;
    });
  }

  _removeThings() {
    List updatedCategories = [];

    for (var i = 0; i < _preferences.length; i++) {
      if (_preferences[i] == true) {
        updatedCategories.add(_categories[i]);
      } else {
        continue;
      }
    }
    int counterLen = updatedCategories.length;
    this.setState(() {
      this._categories = updatedCategories;
      this._preferences = new List.filled(counterLen, false);
      this._counter = new List.filled(counterLen, false);
    });
  }

  Future navToNextPage(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MyHomePage(foodType: _categories[0]['name'],)));
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chickn\' Tender')),
      body: Center(
        child: ListView.builder(
          itemCount: _categories.length,
          itemBuilder: (context, int index) => Center(
              child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Padding(padding: const EdgeInsets.all(0.0)),
                Image(
                  image: NetworkImage(_categories[index]['imgUrl']),
                  height: 200,
                  width: 500,
                  fit: BoxFit.cover,
                ),
                ListTile(
                  title: Text(
                    '${_categories[index]['name']}',
                    style: Theme.of(context).textTheme.title,
                  ),
                  subtitle: Text('${_categories[index]['subtitle']}'),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      IconButton(
                        enableFeedback: true,
                        icon: (_preferences[index]
                            ? Icon(
                                Icons.favorite,
                              )
                            : Icon(Icons.favorite_border)),
                        iconSize: 30,
                        onPressed: (() {
                          _pressedLike(index);
                        }),
                        color: (_preferences[index]
                            ? Colors.red[300]
                            : Colors.red[100]),
                      ),
                      IconButton(
                          enableFeedback: true,
                          icon: Icon(Icons.clear),
                          iconSize: 30,
                          color: (_preferences[index]
                              ? Colors.black12
                              : Colors.black87),
                          onPressed: () {
                            _pressedDislike(index);
                          }),
                    ]),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0, bottom: 20.0),
                ),
              ],
            ),
          )),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (_categories.length == 1 && _counter[0] && _preferences[0]) {
            navToNextPage(context);
          } else {
            if (_counter.contains(false)) {
              _removeThings();
            } else {
              print('lol no.');
            }
          }
        },
        // tooltip: 'Increment',
        label: Text((_categories.length == 1 ? 'DONE' : 'NEXT')),
        // icon: Icon(Icons.check),
      ),
    );
  }
}
