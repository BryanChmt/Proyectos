class Product {
   final String name; 
   final String description;
   final int price;
   
   Product(this.name, this.description, this.price); 
   factory Product.fromMap(Map<String, dynamic> json) { 
      return Product( 
         json['name'], 
         json['description'], 
         json['price']
      );
   }
   
}