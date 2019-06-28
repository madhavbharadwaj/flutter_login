import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';

// import '../widgets/products/products.dart';
import '../scoped-models/main.dart';
import '../widgets/ui_elements/logout_list.dart';

class ProductsPage extends StatefulWidget {
  final MainModel model;

  ProductsPage(this.model);

  @override
  State<StatefulWidget> createState() {
    return _ProductsPageState();
  }
}

class _ProductsPageState extends State<ProductsPage> {
  // @override
  // initState() {
  //  // widget.model.fetchProducts();
  //   super.initState();
  // }

  Widget _buildSideDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            automaticallyImplyLeading: false,
            title: Text("Choose"),
          ),
          ListTile(
            leading: Icon(Icons.history),
            title: Text('History'),
            onTap: () {
              //Navigator.pushReplacementNamed(context, '/admin');
            },
          ),
          Divider(),
          LogoutListTile(),
        ],
      ),
    );
  }

  //  Widget _buildDrawerUser() {
  //   return ScopedModelDescendant(
  //     builder: (BuildContext context, Widget child, MainModel model) {
  //       Widget content = Text("Logged in as : "+ model.user.email);
  //       // if (model.displayedProducts.length > 0 && !model.isLoading) {
  //       //   content = Products();
  //       // } else if (model.isLoading) {
  //       //   content = Center(child: CircularProgressIndicator());
  //       // }
  //       return content ;
  //     },
  //   );
  // }

  Widget _buildProductsList() {
    return ScopedModelDescendant(
      builder: (BuildContext context, Widget child, MainModel model) {
        Widget content = Column(
          children: <Widget>[
            Center(
              child: Text(
                "Logged in as : " + model.user.email,
              ),
            ),
            Center(
              child: Text("ID :"+model.user.id),
            )
          ],
        );

        // if (model.displayedProducts.length > 0 && !model.isLoading) {
        //   content = Products();
        // } else if (model.isLoading) {
        //   content = Center(child: CircularProgressIndicator());
        // }
        return content;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildSideDrawer(context),
      appBar: AppBar(
        title: Text('DMS'),
        // actions: <Widget>[
        //   ScopedModelDescendant<MainModel>(
        //     builder: (BuildContext context, Widget child, MainModel model) {
        //       return IconButton(
        //         icon: Icon(model.displayFavoritesOnly
        //             ? Icons.favorite
        //             : Icons.favorite_border),
        //         onPressed: () {
        //           model.toggleDisplayMode();
        //         },
        //       );
        //     },
        //   )
        // ],
      ),
      body: _buildProductsList(),
    );
  }
}
