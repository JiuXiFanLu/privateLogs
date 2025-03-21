讲解Flex（包括Row和Column都是extends Flex） 

默认Demo的column用了mainAxisAlignment:MainAxisAlignment.center

除了.center还有.start	.end	.spaceEvenly	.spaceBetween	与spaceEvenly比去掉最上、下空白

.spaceAround	与spaceEvenly比有点区别说不上来

默认verticalDirection:VerticalDirection.down



crossAxisAlignment:CrossAxisAlignment.center

如果是.stretch就把上级的紧约束传递

视频里按钮变成了横条，但flutterlogo没变，弹幕有人说是因为只是横向变紧但竖直方向还照旧造成的 



Directionality(

textDirection:TextDirection.rtl,

child: .....

)可以更改阅读方向



container的width和height是tight

如果用constraints:BoxConstraints(

.....

),就是松



在children里用Expanded会填满所有剩余可用空间，如果有多个Expanded，可以用flex：值控制比例 



Flexible，其实Expanded extends Flexible, column在绘制布局的时候，会先看一下没有弹性的空间尺寸，然后再看有弹性的Flexible、Expanded的flex值，分配剩余空间



column包一个listview会报错，column会假装自己是无限的，结果listview是真的无限。为解决可以把listview包进一个Expanded，或其他有限空间。