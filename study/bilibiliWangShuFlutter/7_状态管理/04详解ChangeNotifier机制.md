复习和巩固ChangeNotifier与刷新UI方面的知识点，

并且继续探讨一些Flutter框架的其他相关组件和概念，为这篇系列教程的下半部分内容打好基础。





ValueNotifier 

```dart
class CounterController extends ChangeNotifier{
    int _count = 0;
    int get count => _count;
    set count(value){
        _count = value;
        notifyListeners();
    }
}
```

可以替换为

```dart
class CounterController {
    ValueNotifier<int> count = ValueNotifier(0);
}
```

相应的，原本widget.controller.count    替换为widget.controller.count.value

相应的，原本listenable:widget.controller替换为widget.controller.count





监听多个

```dart
ListenableBuilder( listenable:widget.controller.count,),
```

替换为

```dart
ListenableBuilder( 
listenable:Listenable.merge([
widget.controller.count,
widget.controller.fontSize,]),
```





ValueListenableBuilder(

valueListenable:

)
