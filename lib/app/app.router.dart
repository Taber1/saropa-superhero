// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i5;
import 'package:flutter/material.dart';
import 'package:saropa_task/ui/views/startup/startup_view.dart' as _i2;
import 'package:saropa_task/ui/views/superhero/superhero_view.dart' as _i3;
import 'package:saropa_task/ui/views/superhero_profile/superhero_profile_view.dart'
    as _i4;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i6;

class Routes {
  static const startupView = '/startup-view';

  static const superheroView = '/superhero-view';

  static const superheroProfileView = '/superhero-profile-view';

  static const all = <String>{
    startupView,
    superheroView,
    superheroProfileView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.startupView,
      page: _i2.StartupView,
    ),
    _i1.RouteDef(
      Routes.superheroView,
      page: _i3.SuperheroView,
    ),
    _i1.RouteDef(
      Routes.superheroProfileView,
      page: _i4.SuperheroProfileView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.StartupView: (data) {
      return _i5.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.StartupView(),
        settings: data,
      );
    },
    _i3.SuperheroView: (data) {
      return _i5.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.SuperheroView(),
        settings: data,
      );
    },
    _i4.SuperheroProfileView: (data) {
      final args = data.getArgs<SuperheroProfileViewArguments>(nullOk: false);
      return _i5.MaterialPageRoute<dynamic>(
        builder: (context) => _i4.SuperheroProfileView(args.id, key: args.key),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class SuperheroProfileViewArguments {
  const SuperheroProfileViewArguments({
    required this.id,
    this.key,
  });

  final int id;

  final _i5.Key? key;

  @override
  String toString() {
    return '{"id": "$id", "key": "$key"}';
  }

  @override
  bool operator ==(covariant SuperheroProfileViewArguments other) {
    if (identical(this, other)) return true;
    return other.id == id && other.key == key;
  }

  @override
  int get hashCode {
    return id.hashCode ^ key.hashCode;
  }
}

extension NavigatorStateExtension on _i6.NavigationService {
  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSuperheroView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.superheroView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSuperheroProfileView({
    required int id,
    _i5.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.superheroProfileView,
        arguments: SuperheroProfileViewArguments(id: id, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSuperheroView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.superheroView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSuperheroProfileView({
    required int id,
    _i5.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.superheroProfileView,
        arguments: SuperheroProfileViewArguments(id: id, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
