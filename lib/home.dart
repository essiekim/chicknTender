import 'package:flutter/material.dart';
import 'business.dart';
import 'repository.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.foodType}) : super(key: key);
  final String foodType;
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Repository repository;


  @override
  void initState() {
    super.initState();
    repository = Repository.get();
    print(widget.foodType);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Your Options')),
        body: Center(
            child: FutureBuilder<List<Business>>(
          future: repository.getBusinesses('${widget.foodType}'),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return Center(
                            child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Padding(padding: const EdgeInsets.all(0.0)),
                              Image(
                                image:
                                    NetworkImage(snapshot.data[index].imageUrl),
                                height: 200,
                                width: 500,
                                fit: BoxFit.cover,
                              ),
                              ListTile(
                                  title: Text('${snapshot.data[index].name}'),
                                  subtitle: Text(
                                      '${snapshot.data[index].categories} \n${snapshot.data[index].displayAddress}')),
                            ],
                          ),
                        ));
                      }));
            } else if (snapshot.hasError) {
              return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text("${snapshot.error}"));
            }
            return CircularProgressIndicator();
          },
        )));
  }
}
