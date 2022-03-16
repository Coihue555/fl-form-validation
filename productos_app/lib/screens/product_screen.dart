import 'package:flutter/material.dart';
import 'package:productos_app/providers/product_form_provider.dart';
import 'package:productos_app/services/services.dart';
import 'package:productos_app/ui/input_decorations.dart';
import 'package:productos_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatelessWidget {
   
  const ProductScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final productService = Provider.of<ProductsService>(context);

    return ChangeNotifierProvider(
      create: ( _ ) => ProductFormProvider(productService.selectedProduct)
      )
    
    return _ProductScreenBody(productService: productService);
  }
}

class _ProductScreenBody extends StatelessWidget {
  const _ProductScreenBody({
    Key? key,
    required this.productService,
  }) : super(key: key);

  final ProductsService productService;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            
            Stack(
              children: [
                ProductImage(url: productService.selectedProduct!.picture,),
                Positioned(
                  top: 60,
                  left: 20,
                  child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.arrow_back_ios_new, size: 50, color: Colors.white38),
                  ),
                ),
                Positioned(
                  top: 60,
                  right: 45,
                  child: IconButton(
                    onPressed: () {
                        //TODO
                    },
                    icon: const Icon(Icons.camera_alt_outlined, size: 50, color: Colors.white38),
                  ),
                )
              ],
            ),
            _ProductForm(),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.save_outlined),
        onPressed: ( ) { },
      ),
    );
  }
}

class _ProductForm extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        decoration: _buildBoxDecoration(),
        child: Form(
          child: Column(
            children: [
              const SizedBox(height: 10,),
              TextFormField(
                decoration: InputDecorations.authInputDecoration(
                  hintText: 'Nombre del Producto',
                  labelText: 'Nombre: '
                ),
              ),
              const SizedBox(height: 30,),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecorations.authInputDecoration(
                  hintText: '\$150',
                  labelText: 'Precio: '
                ),
              ),
              const SizedBox(height: 30,),
              SwitchListTile.adaptive(
                value: true,
                title: const Text('Disponible'),
                activeColor: Colors.indigo,
                onChanged: (value){

                }
              ),
              const SizedBox(height: 30,)
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 5,
          offset: const Offset(0,5)
        )
      ]
    );
  }
}