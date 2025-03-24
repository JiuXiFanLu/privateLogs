SliverList(delegate:

SliverChildBuilderDelegate(

(context,index){

return Container(

height:50,color:Colors.primaries[index % 18]);

},childCount:8,

),

最普通的sliver，有点像listview

SliverChildBuilderDelegate有点像listview.build

SliverGrid(delegate:

SliverChildBuilderDelegate(

(context,index){

return Container(

height:50,color:Colors.primaries[index % 18]);

},childCount:8,

),gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(

crossAxisCount:3,),

),

对应gridview

listview.build可以不用build，直接用listview，

对应delegate：sliverChildListDelegate(

[FlutterLogo(),FlutterLogo(),FlutterLogo(),]),

listview里有一个itemExtent属性，固定大小，

强行固定列表元素在主轴方向的尺寸，

sliverList里没有对应的参数，类似的功能由另一个sliver实现，SliverFixedExtentList。

SliverFixedExtentList(

itemExtent:200,

delegate：sliverChildListDelegate(

[FlutterLogo(),FlutterLogo(),FlutterLogo(),]),

),

SliverPrototypeExtentList(

prototypeItem:Flutterlogo(size:48),

delegate：sliverChildListDelegate(

[FlutterLogo(),FlutterLogo(),FlutterLogo(),]),

),

Prototype原型的意思，在实际中，想知道元素的高度是比较困难的事情，元素通常是比较复杂的，一些外在原因也能改变元素的大小。通过prototypeItem传入一个原型，不会真正出现在屏幕上，flutter会先把他布局出来， 布局出来得到他的尺寸了，之后并不会把他绘制在屏幕上，所以并看不到他。

后面三个logo会匹配前面原型的尺寸。



SliverFillViewport(

delegate:sliverChildListDelegate(

[FlutterLogo(),FlutterLogo(),FlutterLogo(),]),),

每个元素都会填满整个视窗，类似pageview
