import 'package:flutter_bloc/flutter_bloc.dart';

class ShoppingBasketCubit extends Cubit<int> {
  ShoppingBasketCubit() : super(0);

  void incrementCount() => emit(state + 1);

}

