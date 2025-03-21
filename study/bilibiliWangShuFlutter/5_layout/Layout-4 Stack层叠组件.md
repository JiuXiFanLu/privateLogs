Stack用来叠放一些组件children

叠放位置可以用stack内置参数

alignment：Alignment.center等等来修改

单独控制某一组件的位置，可以将其包进

Positioned(

left:某值,top:某值,

child: ...

)

stack的尺寸一般按最大部件计算，某一部件被包裹进Positioned则不算在内。其原理就像flex，flex是先计算没有弹性的，再计算有弹性的；stack是先计算没有位置的，再计算有位置的。如果都没有位置就越大越好。

stack的fit:stackFit.loose为默认值，如果为expand，会让其内部组件变得很大，匹配上级最大约束

如果为passthrough会直接传递上级约束



Positioned组件，如果left:0,right:0,即左右值都设置会强行拉伸，也就是位置间接固定了width，child的width就无效了。也可以设一个left和width，效果一样，等等。如果left、right、width都设置，会报错，不允许都设，即使计算正确也不行。

top、bottom、height也一样。1个、2个都行，3个不行，0个相当于Positioned不存在了。



stack的children默认超出范围会被裁掉

clipBehavior:Clip.hardEdge,

想允许溢出，clipBehavior:Clip.none,

(PS:overflow相同功能，已被弃用)

超出的部分虽然能显示，但是不能接受用户的点击事件。



虽然没有设clipBehavior，但Transform能让部件溢出

Positioned(

....

child:Transform.translate(

offset:Offset(-50,0),

child: .... ,

)

)弹幕说此bug现在已经被修复了