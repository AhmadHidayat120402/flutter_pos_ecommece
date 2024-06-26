// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'local_product_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LocalProductEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getLocalProduct,
    required TResult Function(Product product) addProduct,
    required TResult Function(String query) searchProduct,
    required TResult Function() fetchAllFromState,
    required TResult Function(int categoryId) getLocalProductByCategoryId,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getLocalProduct,
    TResult? Function(Product product)? addProduct,
    TResult? Function(String query)? searchProduct,
    TResult? Function()? fetchAllFromState,
    TResult? Function(int categoryId)? getLocalProductByCategoryId,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getLocalProduct,
    TResult Function(Product product)? addProduct,
    TResult Function(String query)? searchProduct,
    TResult Function()? fetchAllFromState,
    TResult Function(int categoryId)? getLocalProductByCategoryId,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetLocalProduct value) getLocalProduct,
    required TResult Function(_AddProduct value) addProduct,
    required TResult Function(_SearchProduct value) searchProduct,
    required TResult Function(_FetchAllFromState value) fetchAllFromState,
    required TResult Function(_GetLocalProductByCategoryId value)
        getLocalProductByCategoryId,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetLocalProduct value)? getLocalProduct,
    TResult? Function(_AddProduct value)? addProduct,
    TResult? Function(_SearchProduct value)? searchProduct,
    TResult? Function(_FetchAllFromState value)? fetchAllFromState,
    TResult? Function(_GetLocalProductByCategoryId value)?
        getLocalProductByCategoryId,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetLocalProduct value)? getLocalProduct,
    TResult Function(_AddProduct value)? addProduct,
    TResult Function(_SearchProduct value)? searchProduct,
    TResult Function(_FetchAllFromState value)? fetchAllFromState,
    TResult Function(_GetLocalProductByCategoryId value)?
        getLocalProductByCategoryId,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalProductEventCopyWith<$Res> {
  factory $LocalProductEventCopyWith(
          LocalProductEvent value, $Res Function(LocalProductEvent) then) =
      _$LocalProductEventCopyWithImpl<$Res, LocalProductEvent>;
}

/// @nodoc
class _$LocalProductEventCopyWithImpl<$Res, $Val extends LocalProductEvent>
    implements $LocalProductEventCopyWith<$Res> {
  _$LocalProductEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$LocalProductEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'LocalProductEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getLocalProduct,
    required TResult Function(Product product) addProduct,
    required TResult Function(String query) searchProduct,
    required TResult Function() fetchAllFromState,
    required TResult Function(int categoryId) getLocalProductByCategoryId,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getLocalProduct,
    TResult? Function(Product product)? addProduct,
    TResult? Function(String query)? searchProduct,
    TResult? Function()? fetchAllFromState,
    TResult? Function(int categoryId)? getLocalProductByCategoryId,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getLocalProduct,
    TResult Function(Product product)? addProduct,
    TResult Function(String query)? searchProduct,
    TResult Function()? fetchAllFromState,
    TResult Function(int categoryId)? getLocalProductByCategoryId,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetLocalProduct value) getLocalProduct,
    required TResult Function(_AddProduct value) addProduct,
    required TResult Function(_SearchProduct value) searchProduct,
    required TResult Function(_FetchAllFromState value) fetchAllFromState,
    required TResult Function(_GetLocalProductByCategoryId value)
        getLocalProductByCategoryId,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetLocalProduct value)? getLocalProduct,
    TResult? Function(_AddProduct value)? addProduct,
    TResult? Function(_SearchProduct value)? searchProduct,
    TResult? Function(_FetchAllFromState value)? fetchAllFromState,
    TResult? Function(_GetLocalProductByCategoryId value)?
        getLocalProductByCategoryId,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetLocalProduct value)? getLocalProduct,
    TResult Function(_AddProduct value)? addProduct,
    TResult Function(_SearchProduct value)? searchProduct,
    TResult Function(_FetchAllFromState value)? fetchAllFromState,
    TResult Function(_GetLocalProductByCategoryId value)?
        getLocalProductByCategoryId,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements LocalProductEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$GetLocalProductImplCopyWith<$Res> {
  factory _$$GetLocalProductImplCopyWith(_$GetLocalProductImpl value,
          $Res Function(_$GetLocalProductImpl) then) =
      __$$GetLocalProductImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetLocalProductImplCopyWithImpl<$Res>
    extends _$LocalProductEventCopyWithImpl<$Res, _$GetLocalProductImpl>
    implements _$$GetLocalProductImplCopyWith<$Res> {
  __$$GetLocalProductImplCopyWithImpl(
      _$GetLocalProductImpl _value, $Res Function(_$GetLocalProductImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetLocalProductImpl implements _GetLocalProduct {
  const _$GetLocalProductImpl();

  @override
  String toString() {
    return 'LocalProductEvent.getLocalProduct()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetLocalProductImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getLocalProduct,
    required TResult Function(Product product) addProduct,
    required TResult Function(String query) searchProduct,
    required TResult Function() fetchAllFromState,
    required TResult Function(int categoryId) getLocalProductByCategoryId,
  }) {
    return getLocalProduct();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getLocalProduct,
    TResult? Function(Product product)? addProduct,
    TResult? Function(String query)? searchProduct,
    TResult? Function()? fetchAllFromState,
    TResult? Function(int categoryId)? getLocalProductByCategoryId,
  }) {
    return getLocalProduct?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getLocalProduct,
    TResult Function(Product product)? addProduct,
    TResult Function(String query)? searchProduct,
    TResult Function()? fetchAllFromState,
    TResult Function(int categoryId)? getLocalProductByCategoryId,
    required TResult orElse(),
  }) {
    if (getLocalProduct != null) {
      return getLocalProduct();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetLocalProduct value) getLocalProduct,
    required TResult Function(_AddProduct value) addProduct,
    required TResult Function(_SearchProduct value) searchProduct,
    required TResult Function(_FetchAllFromState value) fetchAllFromState,
    required TResult Function(_GetLocalProductByCategoryId value)
        getLocalProductByCategoryId,
  }) {
    return getLocalProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetLocalProduct value)? getLocalProduct,
    TResult? Function(_AddProduct value)? addProduct,
    TResult? Function(_SearchProduct value)? searchProduct,
    TResult? Function(_FetchAllFromState value)? fetchAllFromState,
    TResult? Function(_GetLocalProductByCategoryId value)?
        getLocalProductByCategoryId,
  }) {
    return getLocalProduct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetLocalProduct value)? getLocalProduct,
    TResult Function(_AddProduct value)? addProduct,
    TResult Function(_SearchProduct value)? searchProduct,
    TResult Function(_FetchAllFromState value)? fetchAllFromState,
    TResult Function(_GetLocalProductByCategoryId value)?
        getLocalProductByCategoryId,
    required TResult orElse(),
  }) {
    if (getLocalProduct != null) {
      return getLocalProduct(this);
    }
    return orElse();
  }
}

abstract class _GetLocalProduct implements LocalProductEvent {
  const factory _GetLocalProduct() = _$GetLocalProductImpl;
}

/// @nodoc
abstract class _$$AddProductImplCopyWith<$Res> {
  factory _$$AddProductImplCopyWith(
          _$AddProductImpl value, $Res Function(_$AddProductImpl) then) =
      __$$AddProductImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Product product});
}

/// @nodoc
class __$$AddProductImplCopyWithImpl<$Res>
    extends _$LocalProductEventCopyWithImpl<$Res, _$AddProductImpl>
    implements _$$AddProductImplCopyWith<$Res> {
  __$$AddProductImplCopyWithImpl(
      _$AddProductImpl _value, $Res Function(_$AddProductImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
  }) {
    return _then(_$AddProductImpl(
      null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
    ));
  }
}

/// @nodoc

class _$AddProductImpl implements _AddProduct {
  const _$AddProductImpl(this.product);

  @override
  final Product product;

  @override
  String toString() {
    return 'LocalProductEvent.addProduct(product: $product)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddProductImpl &&
            (identical(other.product, product) || other.product == product));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddProductImplCopyWith<_$AddProductImpl> get copyWith =>
      __$$AddProductImplCopyWithImpl<_$AddProductImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getLocalProduct,
    required TResult Function(Product product) addProduct,
    required TResult Function(String query) searchProduct,
    required TResult Function() fetchAllFromState,
    required TResult Function(int categoryId) getLocalProductByCategoryId,
  }) {
    return addProduct(product);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getLocalProduct,
    TResult? Function(Product product)? addProduct,
    TResult? Function(String query)? searchProduct,
    TResult? Function()? fetchAllFromState,
    TResult? Function(int categoryId)? getLocalProductByCategoryId,
  }) {
    return addProduct?.call(product);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getLocalProduct,
    TResult Function(Product product)? addProduct,
    TResult Function(String query)? searchProduct,
    TResult Function()? fetchAllFromState,
    TResult Function(int categoryId)? getLocalProductByCategoryId,
    required TResult orElse(),
  }) {
    if (addProduct != null) {
      return addProduct(product);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetLocalProduct value) getLocalProduct,
    required TResult Function(_AddProduct value) addProduct,
    required TResult Function(_SearchProduct value) searchProduct,
    required TResult Function(_FetchAllFromState value) fetchAllFromState,
    required TResult Function(_GetLocalProductByCategoryId value)
        getLocalProductByCategoryId,
  }) {
    return addProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetLocalProduct value)? getLocalProduct,
    TResult? Function(_AddProduct value)? addProduct,
    TResult? Function(_SearchProduct value)? searchProduct,
    TResult? Function(_FetchAllFromState value)? fetchAllFromState,
    TResult? Function(_GetLocalProductByCategoryId value)?
        getLocalProductByCategoryId,
  }) {
    return addProduct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetLocalProduct value)? getLocalProduct,
    TResult Function(_AddProduct value)? addProduct,
    TResult Function(_SearchProduct value)? searchProduct,
    TResult Function(_FetchAllFromState value)? fetchAllFromState,
    TResult Function(_GetLocalProductByCategoryId value)?
        getLocalProductByCategoryId,
    required TResult orElse(),
  }) {
    if (addProduct != null) {
      return addProduct(this);
    }
    return orElse();
  }
}

abstract class _AddProduct implements LocalProductEvent {
  const factory _AddProduct(final Product product) = _$AddProductImpl;

  Product get product;
  @JsonKey(ignore: true)
  _$$AddProductImplCopyWith<_$AddProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchProductImplCopyWith<$Res> {
  factory _$$SearchProductImplCopyWith(
          _$SearchProductImpl value, $Res Function(_$SearchProductImpl) then) =
      __$$SearchProductImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$$SearchProductImplCopyWithImpl<$Res>
    extends _$LocalProductEventCopyWithImpl<$Res, _$SearchProductImpl>
    implements _$$SearchProductImplCopyWith<$Res> {
  __$$SearchProductImplCopyWithImpl(
      _$SearchProductImpl _value, $Res Function(_$SearchProductImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_$SearchProductImpl(
      null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SearchProductImpl implements _SearchProduct {
  const _$SearchProductImpl(this.query);

  @override
  final String query;

  @override
  String toString() {
    return 'LocalProductEvent.searchProduct(query: $query)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchProductImpl &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchProductImplCopyWith<_$SearchProductImpl> get copyWith =>
      __$$SearchProductImplCopyWithImpl<_$SearchProductImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getLocalProduct,
    required TResult Function(Product product) addProduct,
    required TResult Function(String query) searchProduct,
    required TResult Function() fetchAllFromState,
    required TResult Function(int categoryId) getLocalProductByCategoryId,
  }) {
    return searchProduct(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getLocalProduct,
    TResult? Function(Product product)? addProduct,
    TResult? Function(String query)? searchProduct,
    TResult? Function()? fetchAllFromState,
    TResult? Function(int categoryId)? getLocalProductByCategoryId,
  }) {
    return searchProduct?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getLocalProduct,
    TResult Function(Product product)? addProduct,
    TResult Function(String query)? searchProduct,
    TResult Function()? fetchAllFromState,
    TResult Function(int categoryId)? getLocalProductByCategoryId,
    required TResult orElse(),
  }) {
    if (searchProduct != null) {
      return searchProduct(query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetLocalProduct value) getLocalProduct,
    required TResult Function(_AddProduct value) addProduct,
    required TResult Function(_SearchProduct value) searchProduct,
    required TResult Function(_FetchAllFromState value) fetchAllFromState,
    required TResult Function(_GetLocalProductByCategoryId value)
        getLocalProductByCategoryId,
  }) {
    return searchProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetLocalProduct value)? getLocalProduct,
    TResult? Function(_AddProduct value)? addProduct,
    TResult? Function(_SearchProduct value)? searchProduct,
    TResult? Function(_FetchAllFromState value)? fetchAllFromState,
    TResult? Function(_GetLocalProductByCategoryId value)?
        getLocalProductByCategoryId,
  }) {
    return searchProduct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetLocalProduct value)? getLocalProduct,
    TResult Function(_AddProduct value)? addProduct,
    TResult Function(_SearchProduct value)? searchProduct,
    TResult Function(_FetchAllFromState value)? fetchAllFromState,
    TResult Function(_GetLocalProductByCategoryId value)?
        getLocalProductByCategoryId,
    required TResult orElse(),
  }) {
    if (searchProduct != null) {
      return searchProduct(this);
    }
    return orElse();
  }
}

abstract class _SearchProduct implements LocalProductEvent {
  const factory _SearchProduct(final String query) = _$SearchProductImpl;

  String get query;
  @JsonKey(ignore: true)
  _$$SearchProductImplCopyWith<_$SearchProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchAllFromStateImplCopyWith<$Res> {
  factory _$$FetchAllFromStateImplCopyWith(_$FetchAllFromStateImpl value,
          $Res Function(_$FetchAllFromStateImpl) then) =
      __$$FetchAllFromStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchAllFromStateImplCopyWithImpl<$Res>
    extends _$LocalProductEventCopyWithImpl<$Res, _$FetchAllFromStateImpl>
    implements _$$FetchAllFromStateImplCopyWith<$Res> {
  __$$FetchAllFromStateImplCopyWithImpl(_$FetchAllFromStateImpl _value,
      $Res Function(_$FetchAllFromStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchAllFromStateImpl implements _FetchAllFromState {
  const _$FetchAllFromStateImpl();

  @override
  String toString() {
    return 'LocalProductEvent.fetchAllFromState()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchAllFromStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getLocalProduct,
    required TResult Function(Product product) addProduct,
    required TResult Function(String query) searchProduct,
    required TResult Function() fetchAllFromState,
    required TResult Function(int categoryId) getLocalProductByCategoryId,
  }) {
    return fetchAllFromState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getLocalProduct,
    TResult? Function(Product product)? addProduct,
    TResult? Function(String query)? searchProduct,
    TResult? Function()? fetchAllFromState,
    TResult? Function(int categoryId)? getLocalProductByCategoryId,
  }) {
    return fetchAllFromState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getLocalProduct,
    TResult Function(Product product)? addProduct,
    TResult Function(String query)? searchProduct,
    TResult Function()? fetchAllFromState,
    TResult Function(int categoryId)? getLocalProductByCategoryId,
    required TResult orElse(),
  }) {
    if (fetchAllFromState != null) {
      return fetchAllFromState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetLocalProduct value) getLocalProduct,
    required TResult Function(_AddProduct value) addProduct,
    required TResult Function(_SearchProduct value) searchProduct,
    required TResult Function(_FetchAllFromState value) fetchAllFromState,
    required TResult Function(_GetLocalProductByCategoryId value)
        getLocalProductByCategoryId,
  }) {
    return fetchAllFromState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetLocalProduct value)? getLocalProduct,
    TResult? Function(_AddProduct value)? addProduct,
    TResult? Function(_SearchProduct value)? searchProduct,
    TResult? Function(_FetchAllFromState value)? fetchAllFromState,
    TResult? Function(_GetLocalProductByCategoryId value)?
        getLocalProductByCategoryId,
  }) {
    return fetchAllFromState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetLocalProduct value)? getLocalProduct,
    TResult Function(_AddProduct value)? addProduct,
    TResult Function(_SearchProduct value)? searchProduct,
    TResult Function(_FetchAllFromState value)? fetchAllFromState,
    TResult Function(_GetLocalProductByCategoryId value)?
        getLocalProductByCategoryId,
    required TResult orElse(),
  }) {
    if (fetchAllFromState != null) {
      return fetchAllFromState(this);
    }
    return orElse();
  }
}

abstract class _FetchAllFromState implements LocalProductEvent {
  const factory _FetchAllFromState() = _$FetchAllFromStateImpl;
}

/// @nodoc
abstract class _$$GetLocalProductByCategoryIdImplCopyWith<$Res> {
  factory _$$GetLocalProductByCategoryIdImplCopyWith(
          _$GetLocalProductByCategoryIdImpl value,
          $Res Function(_$GetLocalProductByCategoryIdImpl) then) =
      __$$GetLocalProductByCategoryIdImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int categoryId});
}

/// @nodoc
class __$$GetLocalProductByCategoryIdImplCopyWithImpl<$Res>
    extends _$LocalProductEventCopyWithImpl<$Res,
        _$GetLocalProductByCategoryIdImpl>
    implements _$$GetLocalProductByCategoryIdImplCopyWith<$Res> {
  __$$GetLocalProductByCategoryIdImplCopyWithImpl(
      _$GetLocalProductByCategoryIdImpl _value,
      $Res Function(_$GetLocalProductByCategoryIdImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
  }) {
    return _then(_$GetLocalProductByCategoryIdImpl(
      null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$GetLocalProductByCategoryIdImpl
    implements _GetLocalProductByCategoryId {
  const _$GetLocalProductByCategoryIdImpl(this.categoryId);

  @override
  final int categoryId;

  @override
  String toString() {
    return 'LocalProductEvent.getLocalProductByCategoryId(categoryId: $categoryId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetLocalProductByCategoryIdImpl &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, categoryId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetLocalProductByCategoryIdImplCopyWith<_$GetLocalProductByCategoryIdImpl>
      get copyWith => __$$GetLocalProductByCategoryIdImplCopyWithImpl<
          _$GetLocalProductByCategoryIdImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getLocalProduct,
    required TResult Function(Product product) addProduct,
    required TResult Function(String query) searchProduct,
    required TResult Function() fetchAllFromState,
    required TResult Function(int categoryId) getLocalProductByCategoryId,
  }) {
    return getLocalProductByCategoryId(categoryId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getLocalProduct,
    TResult? Function(Product product)? addProduct,
    TResult? Function(String query)? searchProduct,
    TResult? Function()? fetchAllFromState,
    TResult? Function(int categoryId)? getLocalProductByCategoryId,
  }) {
    return getLocalProductByCategoryId?.call(categoryId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getLocalProduct,
    TResult Function(Product product)? addProduct,
    TResult Function(String query)? searchProduct,
    TResult Function()? fetchAllFromState,
    TResult Function(int categoryId)? getLocalProductByCategoryId,
    required TResult orElse(),
  }) {
    if (getLocalProductByCategoryId != null) {
      return getLocalProductByCategoryId(categoryId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetLocalProduct value) getLocalProduct,
    required TResult Function(_AddProduct value) addProduct,
    required TResult Function(_SearchProduct value) searchProduct,
    required TResult Function(_FetchAllFromState value) fetchAllFromState,
    required TResult Function(_GetLocalProductByCategoryId value)
        getLocalProductByCategoryId,
  }) {
    return getLocalProductByCategoryId(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetLocalProduct value)? getLocalProduct,
    TResult? Function(_AddProduct value)? addProduct,
    TResult? Function(_SearchProduct value)? searchProduct,
    TResult? Function(_FetchAllFromState value)? fetchAllFromState,
    TResult? Function(_GetLocalProductByCategoryId value)?
        getLocalProductByCategoryId,
  }) {
    return getLocalProductByCategoryId?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetLocalProduct value)? getLocalProduct,
    TResult Function(_AddProduct value)? addProduct,
    TResult Function(_SearchProduct value)? searchProduct,
    TResult Function(_FetchAllFromState value)? fetchAllFromState,
    TResult Function(_GetLocalProductByCategoryId value)?
        getLocalProductByCategoryId,
    required TResult orElse(),
  }) {
    if (getLocalProductByCategoryId != null) {
      return getLocalProductByCategoryId(this);
    }
    return orElse();
  }
}

abstract class _GetLocalProductByCategoryId implements LocalProductEvent {
  const factory _GetLocalProductByCategoryId(final int categoryId) =
      _$GetLocalProductByCategoryIdImpl;

  int get categoryId;
  @JsonKey(ignore: true)
  _$$GetLocalProductByCategoryIdImplCopyWith<_$GetLocalProductByCategoryIdImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$LocalProductState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Product> products) loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Product> products)? loaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Product> products)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalProductStateCopyWith<$Res> {
  factory $LocalProductStateCopyWith(
          LocalProductState value, $Res Function(LocalProductState) then) =
      _$LocalProductStateCopyWithImpl<$Res, LocalProductState>;
}

/// @nodoc
class _$LocalProductStateCopyWithImpl<$Res, $Val extends LocalProductState>
    implements $LocalProductStateCopyWith<$Res> {
  _$LocalProductStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$LocalProductStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'LocalProductState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Product> products) loaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Product> products)? loaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Product> products)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements LocalProductState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$LocalProductStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'LocalProductState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Product> products) loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Product> products)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Product> products)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements LocalProductState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Product> products});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$LocalProductStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
  }) {
    return _then(_$LoadedImpl(
      null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
    ));
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(final List<Product> products) : _products = products;

  final List<Product> _products;
  @override
  List<Product> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  String toString() {
    return 'LocalProductState.loaded(products: $products)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_products));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Product> products) loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(products);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Product> products)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(products);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Product> products)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(products);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements LocalProductState {
  const factory _Loaded(final List<Product> products) = _$LoadedImpl;

  List<Product> get products;
  @JsonKey(ignore: true)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$LocalProductStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'LocalProductState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Product> products) loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Product> products)? loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Product> products)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements LocalProductState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
