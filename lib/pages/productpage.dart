import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/product.dart';
import 'package:flutter_application_1/widgets/menu.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;


class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List<Course>? course = [];
  bool isLoading = true;

  Future<void> _getdata() async{
    var url = Uri.parse('https://noraphat.dev/ComSciSiamU/Nattanon/get_product/');
    var response = await http.get(url);
    if(response.statusCode == 200){
      final Product product = Product.fromJson(convert.jsonDecode(response.body));
      setState(() {
        course = product.course;
        isLoading = false;
      });
    }else{
      print('Error from backend ${response.statusCode}');
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getdata();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //ALT+Shift+F to auto realigntment the copy code
      drawer: Menu(),
      appBar: AppBar(
        
        title: Text('Product Page'),
      ),
      body: isLoading == true 
      ? Center(
        child: CircularProgressIndicator(),
      )
      : ListView.separated(
        itemBuilder: (BuildContext context,int index){
          return ListTile(
            leading: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(
                  image: NetworkImage(course![index].images!),
                  fit: BoxFit.cover
                  )
              ),
            ),
            title: Text('${course![index].pdName}'),
            subtitle: Text('Price : ${course![index].price} .-'),
            trailing: Icon(Icons.arrow_right),
          );
        },
        separatorBuilder: (BuildContext context,int index) => Divider(), 
        itemCount: course!.length),
      
    );
  }
}