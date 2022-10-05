import 'base.dart';
import 'package:mongo_dart/mongo_dart.dart';

var collection = db.collection('authors');

await collection.insertMany([
{
'name': 'William Shakespeare',
'email': 'william@shakespeare.com',
'age': 587
},
{'name': 'Jorge Luis Borges', 'email': 'jorge@borges.com', 'age': 123}
]
);