import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_demo/data/count_bloc.dart';

class CounterPage extends StatelessWidget {
  final initCount;

  CounterPage(this.initCount);

  @override
  Widget build(BuildContext context) {
    final bloc = CountBLoC();
    return Scaffold(
      appBar: AppBar(
        title: Text('BLoC Page'),
      ),
      body: Center(
        child: StreamBuilder<int>(
            stream: bloc.stream,
            initialData: bloc.value,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              return Text(
                'You hit me: ${initCount + snapshot.data} times',
                style: Theme.of(context).textTheme.display1,
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => bloc.increment(),
        child: Icon(Icons.add),
      ),
    );
  }
}
