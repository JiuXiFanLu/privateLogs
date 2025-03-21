Container组件它如何确定自身的尺寸？

有child，就仅包裹child（除非上级紧约束）；没有就最大。

它的本质是什么？

Container集合了很多组件，有很多属性可以直接替代一些组件：

padding:...,替代Padding(padding:...,...)

alignment:Alignment.topLeft,替代Align(alignment:Alignment.topLeft,...)

color替代ColoredBox

decoration替代DecoratedBox

width,height替代SizeBox

BoxConstraints替代ConstrainedBox



Container可以避免太多组件，避免金字塔形。



有child，就仅包裹child（除非上级紧约束）；没有就最大（除非unbounded）。

LimitedBox，在unbounded情况下有效

Placeholder(fallbackHeight:200,),



最后看了Container的代码，就是根据是否有设定的参数不断地包裹了各种不同的组件