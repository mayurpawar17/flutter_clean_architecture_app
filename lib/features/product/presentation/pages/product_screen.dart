import 'package:clean_architecture_app/features/product/domain/entities/product.dart';
import 'package:clean_architecture_app/features/product/presentation/pages/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/product_bloc.dart';
import '../bloc/product_event.dart';
import '../bloc/product_state.dart';
import '../widgets/product_card_list_tile.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    context.read<ProductBloc>().add(GetProductsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Product Screen")),
      body: SafeArea(
        child: BlocListener<ProductBloc, ProductState>(
          listener: (context, state) {
            if (state is ProductAddSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Product ${state.product.title} added successfully!"),
                ),
              );
              // Refresh the list after adding a product
              context.read<ProductBloc>().add(GetProductsEvent());
            }
          },
          child: BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is ProductLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is ProductSuccess) {
                return ListView.builder(
                  itemCount: state.products.length,
                  itemBuilder: (context, index) {
                    final currentProduct = state.products[index];
                    return ProductCardListTile(
                      product: currentProduct,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) =>
                                    ProductDetailScreen(product: currentProduct),
                          ),
                        );
                      },
                      onAddPressed: () {
                        // Handle shopping cart logic
                        print('Added ${currentProduct.title} to cart');
                      },
                    );
                  },
                );
              }

              if (state is ProductFailure) {
                return Center(child: Text(state.error));
              }
              return Container();
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final dummyProduct = Product(
            id: 0,
            title: "New Product",
            price: 29.99,
            description: "A new product description",
            category: "electronics",
            image: "https://i.pravatar.cc",
          );
          context.read<ProductBloc>().add(AddProductEvent(dummyProduct));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
