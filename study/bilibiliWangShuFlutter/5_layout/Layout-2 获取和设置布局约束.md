LayoutBuilder(

builder:(BuildContext context,BoxConstraints constraints){

print("constraints: $constraints");//查看当前约束

return FlutterLogo(size: 9000)

}

)

说到除了center、align，可以允许child组件小一点，还能用sizeBox，

但实际应用里看到，单用sizeBox并不能让紧约束，变成松约束

sizeBox.expand尽可能占满空间



FractionallySizedBox(

widthFactor:0.5,

heightFactor:0.5,

child: .....

)



ConstrainedBox(

constraints:BoxConstraints(

minWidth:60,

maxWidth:120,

minHeight:60,

maxHeight:120,

),		//如果是“).loosen(),”min就是0，即松约束

child: .....

)



如果最小与最大相等就是tightly

如果最小是0，就是loose

如果最小是0，最大是0，就即tightly也loose

有界bounded，无界unbounded（比如listview）

column、raw会假装自己是unbounded