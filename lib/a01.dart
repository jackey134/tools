//import 'package:flutter/material.dart';    //有這行的話就是要開啟相關介面才能執行 ex. android emulator

void main() {
  var a; //未指派所以自動視為dynamic型態
  a = 1;
  print(a);

  List x = const[1,'123', true]; //const是固定list內容
  List c = [1,'123', false];
  print(x[2]);
  print(c);
  c.add("value");
  print(c);

  var map = {
    'key1' : 'num1',
    'key2' : 'num2',
    'key3' : 'num3',
  };
  //map[鍵(key),值]

  print(map['key1']);

  print(map.length);

  print(map.containsKey('num1')); //contain=存在 所以這邊意思是確認keyelements是否存在
  print(map.containsKey('key1'));

  print(map.entries);
  map['key4'] = 'num4';
  print(map.entries);

  print(map.values);


  var n = 10;
  a_birthday(n);//Funtion call
  b_birthday(n);
  print(c_birthday(n));
  print(d_birthday(name: "Liu",month: 11,day: 6));

  var nums = [1,2,3,4,5];
  iterNums(nums);
  //itermaps(maps);

  var mymaps = {"name" : "jin","old" : 15};
  mymaps.forEach((x,y) => print("$x: $y"));

  if_else();
  ages();
  FOR();
  var s = [1,2,3,4,5];
  LIST_FOR(s);

  TRY_ON_CATCH_FINALLY();
}


a_birthday(int number){
  print("the number is ${number}.");//$錢字號為在字串裡穿插引用變數
}
b_birthday(int number)=>print("the number is $number.");//"=>" 等同於return縮寫
c_birthday(int number)=>("the number is $number.");
d_birthday({String name='Amy', var month, var day}) => "${name}'s birthday is $month/$day.";
//將funtion設定為map資料結構樣子，可以隨時更改value裡的值

//匿名函式
void iterNums(List nums){
  nums.forEach((x)=>print("Num is $x"));
}

void if_else() {
  var a = 5;
  if (a > 5) {
    print("a = $a is bigger than 1");
  }
  else if (a < 10 && a > 0) {
    print("a = $a 介於0~10之間");
  }
  else {
    print("Error");
  }
}
//三元運算式
void ages(){
  var x = 20;
  //宣告型態    判斷   滿足條件  未滿足條件
  String age = x>=18 ? "滿18" : "未滿18";
  print(age);
}

void FOR(){
  for(var h = 0;h < 10;h++){
    print("數字:$h");
  }
}

void LIST_FOR(List l){
  print("list裡有$l");
  for(var num in l){
    print("我是從list中取出的數字:$num");
  }
}

void TRY_ON_CATCH_FINALLY(){
  int a = 10;
  int b = 0;
  dynamic result;
  try{
    result = count(a, b);
  }catch(e){
    print(e);
  }finally{
    print(result);
  }
}
double count(int a,int b){
  if(b == 0){
    throw new IntegerDivisionByZeroException();
  }
  return a/b;
}

class video{
  video(){

  }
}
