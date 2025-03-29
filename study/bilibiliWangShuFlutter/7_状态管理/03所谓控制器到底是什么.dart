import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

//视频最后改DoubleHolder名称为FooController，就是控制器，
//dh就是一般的controller，可以改名为_controller,
class DoubleHolder extends ChangeNotifier {
  double _value;
  DoubleHolder(this._value);
  double get value => _value;

  ///每次改值会叫到set就会叫到notifyListeners
  set value(double newValue) {
    _value = newValue;
    notifyListeners();
  }

  void setMax() {
    _value = 1.0;
    notifyListeners();
  }
}
// class DoubleHolder {
//   double value ;
//   DoubleHolder(this.value);
// }

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  DoubleHolder dh = DoubleHolder(0.5);
  final TextEditingController _controller = TextEditingController();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Foo(dhh: dh),

            // ElevatedButton(onPressed: () {
            //   setState(() {       //setState 全局，范围很大。
            //     dh.value = 1.0;
            //   });
            // }, child: Text('set to 100%')),
            ElevatedButton(
              onPressed: () {
                // dh.value = 1.0;
                dh.setMax();//如果提前设置好，会简洁一些，类似上一行作用


/////The member 'notifyListeners' can only be used within instance members 
/////of subclasses of 'package:flutter/src/foundation/change_notifier.dart'
///
///只能函数自己叫，换成其内部的get和set
                // dh.notifyListeners(); 
              },
              child: Text('set to 100%'),
            ),
            TextField(controller: _controller),
            ElevatedButton(
              onPressed: () {
                _controller.clear();
              },
              child: Text('clear'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Foo extends StatefulWidget {
  const Foo({super.key, required this.dhh});

  final DoubleHolder dhh;

  @override
  State<Foo> createState() => _FooState();
}

class _FooState extends State<Foo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.withValues(alpha: 0.5),
      child: ListenableBuilder(
        listenable: widget.dhh,
        builder: (BuildContext context, Widget? child) {
          return Column(
            children: [
              FlutterLogo(size: 60 + widget.dhh.value * 100),
              // ///用stream也能实现，class DoubleHolder里不用double，而用stream
              // /// 使用时如slider ，写成streambuilder，实现自动监听，但大材小用
              Slider(
                value: widget.dhh.value,
                onChanged: (onchanged) {
                  setState(() {
                    widget.dhh.value = onchanged;
                  });
                },
              ),
              // Slider(
              //   value: widget.dhh.value,
              //   onChanged: (onchanged) {
              //     setState(() {
              //       widget.dhh.value = onchanged;
              //     });
              //   },
              // ),
            ],
          );
        },
      ),
    );
  }
}
