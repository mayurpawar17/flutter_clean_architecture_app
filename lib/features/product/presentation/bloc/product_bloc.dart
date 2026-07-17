import 'package:bloc/bloc.dart';
import 'package:clean_architecture_app/features/product/presentation/bloc/product_event.dart';
import 'package:clean_architecture_app/features/product/presentation/bloc/product_state.dart';
import 'package:injectable/injectable.dart';

import '../../domain/usecases/get_products_use_case.dart';



// Registered as a factory (a new instance is created every time we ask for it)
@injectable
class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProductsUseCase _getProductsUseCase;

  ProductBloc({required this._getProductsUseCase}) : super(ProductInitial()) {
    on<GetProductsEvent>((event, emit) async{
      emit(ProductLoading());


      //functional programming
      // _getProductsUseCase
      //     .execute()
      //     .then((products) {
      //       emit(ProductSuccess(products));
      //     })
      //     .catchError((error) {
      //       emit(ProductFailure(error.toString()));
      //     });


      //imperative programming
      try {
        final products = await _getProductsUseCase.execute();
        emit(ProductSuccess(products));
      } catch (error) {
        emit(ProductFailure(error.toString()));
      }
    });
  }
}
