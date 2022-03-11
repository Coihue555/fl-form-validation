import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin: const EdgeInsets.only(top:30, bottom: 50),
        width: double.infinity,
        decoration: _cardBorders(),
        height: 400,
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            _BackgroundImage(),

            _ProductDetails(),

            Positioned(
              top: 0,
              right: 0,
              child: _PriceTag()
            ),

            Positioned(
              top: 0,
              left: 0,
              child: _NotAvailable()
            )
          ],
        ),
      ),
    );
  }

  BoxDecoration _cardBorders() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(20),
    boxShadow: const [
      BoxShadow(
        color: Colors.black12,
        offset: Offset(0, 5),
        blurRadius: 10,
      )
    ]
  );
}

class _NotAvailable extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text('No disponible', style: TextStyle(color: Colors.white, fontSize: 20),),
        ),
      ),
      width: 100,
      height: 70,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Colors.green,
    borderRadius: BorderRadius.only(bottomRight: Radius.circular(20), topLeft: Radius.circular(20))
      ),
    );
  }
}

class _PriceTag extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text('\$103.99', style: TextStyle(color: Colors.white, fontSize: 20),),
        ),
      ),
      width: 100,
      height: 70,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Colors.indigo,
    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), topRight: Radius.circular(20))
      ),
    );
  }
}

class _ProductDetails extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 50),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: double.infinity,
        height: 70,
        decoration: _buildBoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Disco HDD',
              style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              'Id del Disco duro',
              style: TextStyle(fontSize: 20, color: Colors.white,),
            )
          ],
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => const BoxDecoration(
    color: Colors.indigo,
    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), topRight: Radius.circular(20))
  );
}

class _BackgroundImage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: double.infinity,
        height: 400,
        child: const FadeInImage(
          placeholder: AssetImage('assets/jar-loading.gif'),
          image: NetworkImage('https://via.placeholder.com/400x300/f6f6f6'),
          fit: BoxFit.cover,
        )
      ),
    );
  }
}