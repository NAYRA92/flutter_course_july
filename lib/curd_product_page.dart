import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course_july/constant.dart';

class CurdProductPage extends StatefulWidget {
  const CurdProductPage({super.key});

  @override
  State<CurdProductPage> createState() => _CurdProductPageState();
}

class _CurdProductPageState extends State<CurdProductPage> {
  TextEditingController _imageUrl = TextEditingController();
  TextEditingController _proName = TextEditingController();
  TextEditingController _proPrice = TextEditingController();
  TextEditingController _proUnit = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Products"),
        centerTitle: true,
      ),

      //main content
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          addProductFormField(_imageUrl, "Image Url", "Add Product Image Url"),
          addProductFormField(_proName, "Product Name", "Product Name"),
          addProductFormField(_proPrice, "Product Price", "Product Price"),
          addProductFormField(_proUnit, "Product Unit", "Product Unit"),

          //submit button
          SizedBox(
            height: 30,
          ),
          app_ele_button("Add Product", () async {
            await FirebaseFirestore.instance
                .collection(
                    "products") //create products collection if not exisit
                .add({
              "image": _imageUrl.text,
              "name": _proName.text,
              "price": _proPrice.text,
              "unit": _proUnit.text
            }).then((value) {
              //after adding the product, clear the text field
              _imageUrl.clear();
              _proName.clear();
              _proPrice.clear();
              _proUnit.clear();

              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Product Added Successfully"),
                backgroundColor: Colors.green[300],
              ));
            }).onError((error, stackTrace) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Failed to add product: $error"),
                backgroundColor: Colors.red[300],
              ));
            });
          }),

          //displaying the products from firebase firestore
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection("products").snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Text("Some error occurred!"),
                  );
                }
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      var productData = snapshot.data!.docs[index];
                      return ListTile(
                        onTap: () {
                          
                        },
                        leading: Image.network(productData['image']),
                        title: Text(productData['name']),
                        subtitle: Text(
                            "\$${productData['price']} - ${productData['unit']}"),
                        trailing: SizedBox(
                          width: 100,
                          child: Row(
                            children: [
                              deleteAndEditButtons(Icons.delete, Colors.red,
                                  () async {
                                await FirebaseFirestore.instance
                                    .collection("products")
                                    .doc(productData.id) //get the document id
                                    .delete()
                                    .then((value) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text("Product Deleted"),
                                    backgroundColor: Colors.red[300],
                                  ));
                                }).onError((error, stackTrace) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(
                                        "Failed to delete product: $error"),
                                    backgroundColor: Colors.red[300],
                                  ));
                                });
                              }),

                              //edit button
                              deleteAndEditButtons(Icons.edit, Colors.orange,
                                  () async {
                                await FirebaseFirestore.instance
                                    .collection("products")
                                    .doc(productData.id) //get the document id
                                    .update({
                                  "name": _proName.text.isEmpty
                                      ? productData['name']
                                      : _proName.text,
                                  "price": _proPrice.text.isEmpty
                                      ? productData['price']
                                      : _proPrice.text,
                                  "unit": _proUnit.text.isEmpty
                                      ? productData['unit']
                                      : _proUnit.text,
                                  "image": _imageUrl.text.isEmpty
                                      ? productData['image']
                                      : _imageUrl.text,
                                }).then((value) {
                                  //after adding the product, clear the text field
                                  _imageUrl.clear();
                                  _proName.clear();
                                  _proPrice.clear();
                                  _proUnit.clear();
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text("Product Updated"),
                                    backgroundColor: Colors.orange[300],
                                  ));
                                }).onError((error, stackTrace) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(
                                        "Failed to update product: $error"),
                                    backgroundColor: Colors.red[300],
                                  ));
                                });
                              }),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
                return Center(
                  child: Text("No Products Found"),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  IconButton deleteAndEditButtons(
    IconData icn,
    Color clr,
    Function() fun,
  ) {
    return IconButton(
      icon: Icon(
        icn,
        color: clr,
      ),
      onPressed: fun,
    );
  }

  Widget addProductFormField(
      TextEditingController image_url, String label, String hint) {
    return Container(
      padding: EdgeInsets.only(left: 7, right: 7),
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: amberColor, borderRadius: BorderRadius.circular(25)),
      child: TextFormField(
        controller: image_url,
        decoration: InputDecoration(
            border: InputBorder.none, labelText: label, hintText: hint),
      ),
    );
  }
}
