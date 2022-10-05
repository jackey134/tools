void main(){
  var V = new Video('Dart Video','http://123213213');
  print(V._tittle);
  print(V._url);


  var Jack = new Boy("jack",15);
  print(People("jack",10).introduce());
  print(Jack.introduce());

  var coder = new Flutter("Liu", 22);
  print(coder.introduce());
  print(coder.android());
  print(coder.ios());
  
  f().then((value) => print(value));
  f().whenComplete(() => print("Done"));

}
class Video{
  String _tittle;
  String _url;
  // String? _tittle;
  // String? _url;

  Video(this._tittle,this._url);//建構子 dart內建縮寫 不然就要改寫這樣

  //Video(String _tittle,String _url){
  // this._tittle = _tittle;
  // this._url = _url;
  // }
}
class People{
  String name;
  int age;
  People(this.name,this.age);

  String introduce() => "I'm ${name}. Nice to meet you.";//方法
}

class Boy extends People{
  Boy(String name,int age):
        super(name,age);//super：存取 父類別 的成員（資料成員、函數成員、建構元）
}

mixin Android {                       //可以直接使用class內的功能，關鍵字with
  String android() => "I'm android.";//方法
}
mixin IOS {
  String ios() => "I'm IOS.";
}
class Flutter extends People with Android,IOS{ //with = 引導mixin
  Flutter(String name,int age):super(name,age);
}
Future f(){
  return Future.value(5);
}

