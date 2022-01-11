// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart = 2.12

import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'graphql_schema.graphql.g.dart';

mixin LaunchFragmentMixin {
  @JsonKey(name: 'mission_name')
  String? missionName;
  @JsonKey(name: 'launch_date_local')
  DateTime? launchDateLocal;
  @JsonKey(name: 'launch_site')
  LaunchFragmentMixin$LaunchSite? launchSite;
  LaunchFragmentMixin$LaunchLinks? links;
  LaunchFragmentMixin$LaunchRocket? rocket;
  List<LaunchFragmentMixin$Ship?>? ships;
}

@JsonSerializable(explicitToJson: true)
class LaunchList$Query$Launch extends JsonSerializable
    with EquatableMixin, LaunchFragmentMixin {
  LaunchList$Query$Launch();

  factory LaunchList$Query$Launch.fromJson(Map<String, dynamic> json) =>
      _$LaunchList$Query$LaunchFromJson(json);

  @override
  List<Object?> get props =>
      [missionName, launchDateLocal, launchSite, links, rocket, ships];
  @override
  Map<String, dynamic> toJson() => _$LaunchList$Query$LaunchToJson(this);
}

@JsonSerializable(explicitToJson: true)
class LaunchList$Query extends JsonSerializable with EquatableMixin {
  LaunchList$Query();

  factory LaunchList$Query.fromJson(Map<String, dynamic> json) =>
      _$LaunchList$QueryFromJson(json);

  List<LaunchList$Query$Launch?>? launchesPast;

  @override
  List<Object?> get props => [launchesPast];
  @override
  Map<String, dynamic> toJson() => _$LaunchList$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class LaunchFragmentMixin$LaunchSite extends JsonSerializable
    with EquatableMixin {
  LaunchFragmentMixin$LaunchSite();

  factory LaunchFragmentMixin$LaunchSite.fromJson(Map<String, dynamic> json) =>
      _$LaunchFragmentMixin$LaunchSiteFromJson(json);

  @JsonKey(name: 'site_name_long')
  String? siteNameLong;

  @override
  List<Object?> get props => [siteNameLong];
  @override
  Map<String, dynamic> toJson() => _$LaunchFragmentMixin$LaunchSiteToJson(this);
}

@JsonSerializable(explicitToJson: true)
class LaunchFragmentMixin$LaunchLinks extends JsonSerializable
    with EquatableMixin {
  LaunchFragmentMixin$LaunchLinks();

  factory LaunchFragmentMixin$LaunchLinks.fromJson(Map<String, dynamic> json) =>
      _$LaunchFragmentMixin$LaunchLinksFromJson(json);

  @JsonKey(name: 'article_link')
  String? articleLink;

  @JsonKey(name: 'video_link')
  String? videoLink;

  @override
  List<Object?> get props => [articleLink, videoLink];
  @override
  Map<String, dynamic> toJson() =>
      _$LaunchFragmentMixin$LaunchLinksToJson(this);
}

@JsonSerializable(explicitToJson: true)
class LaunchFragmentMixin$LaunchRocket$LaunchRocketFirstStage$LaunchRocketFirstStageCore$Core
    extends JsonSerializable with EquatableMixin {
  LaunchFragmentMixin$LaunchRocket$LaunchRocketFirstStage$LaunchRocketFirstStageCore$Core();

  factory LaunchFragmentMixin$LaunchRocket$LaunchRocketFirstStage$LaunchRocketFirstStageCore$Core.fromJson(
          Map<String, dynamic> json) =>
      _$LaunchFragmentMixin$LaunchRocket$LaunchRocketFirstStage$LaunchRocketFirstStageCore$CoreFromJson(
          json);

  @JsonKey(name: 'reuse_count')
  int? reuseCount;

  String? status;

  @override
  List<Object?> get props => [reuseCount, status];
  @override
  Map<String, dynamic> toJson() =>
      _$LaunchFragmentMixin$LaunchRocket$LaunchRocketFirstStage$LaunchRocketFirstStageCore$CoreToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class LaunchFragmentMixin$LaunchRocket$LaunchRocketFirstStage$LaunchRocketFirstStageCore
    extends JsonSerializable with EquatableMixin {
  LaunchFragmentMixin$LaunchRocket$LaunchRocketFirstStage$LaunchRocketFirstStageCore();

  factory LaunchFragmentMixin$LaunchRocket$LaunchRocketFirstStage$LaunchRocketFirstStageCore.fromJson(
          Map<String, dynamic> json) =>
      _$LaunchFragmentMixin$LaunchRocket$LaunchRocketFirstStage$LaunchRocketFirstStageCoreFromJson(
          json);

  int? flight;

  LaunchFragmentMixin$LaunchRocket$LaunchRocketFirstStage$LaunchRocketFirstStageCore$Core?
      core;

  @override
  List<Object?> get props => [flight, core];
  @override
  Map<String, dynamic> toJson() =>
      _$LaunchFragmentMixin$LaunchRocket$LaunchRocketFirstStage$LaunchRocketFirstStageCoreToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class LaunchFragmentMixin$LaunchRocket$LaunchRocketFirstStage
    extends JsonSerializable with EquatableMixin {
  LaunchFragmentMixin$LaunchRocket$LaunchRocketFirstStage();

  factory LaunchFragmentMixin$LaunchRocket$LaunchRocketFirstStage.fromJson(
          Map<String, dynamic> json) =>
      _$LaunchFragmentMixin$LaunchRocket$LaunchRocketFirstStageFromJson(json);

  List<LaunchFragmentMixin$LaunchRocket$LaunchRocketFirstStage$LaunchRocketFirstStageCore?>?
      cores;

  @override
  List<Object?> get props => [cores];
  @override
  Map<String, dynamic> toJson() =>
      _$LaunchFragmentMixin$LaunchRocket$LaunchRocketFirstStageToJson(this);
}

@JsonSerializable(explicitToJson: true)
class LaunchFragmentMixin$LaunchRocket$LaunchRocketSecondStage$Payload
    extends JsonSerializable with EquatableMixin {
  LaunchFragmentMixin$LaunchRocket$LaunchRocketSecondStage$Payload();

  factory LaunchFragmentMixin$LaunchRocket$LaunchRocketSecondStage$Payload.fromJson(
          Map<String, dynamic> json) =>
      _$LaunchFragmentMixin$LaunchRocket$LaunchRocketSecondStage$PayloadFromJson(
          json);

  @JsonKey(name: 'payload_type')
  String? payloadType;

  @JsonKey(name: 'payload_mass_kg')
  double? payloadMassKg;

  @JsonKey(name: 'payload_mass_lbs')
  double? payloadMassLbs;

  @override
  List<Object?> get props => [payloadType, payloadMassKg, payloadMassLbs];
  @override
  Map<String, dynamic> toJson() =>
      _$LaunchFragmentMixin$LaunchRocket$LaunchRocketSecondStage$PayloadToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class LaunchFragmentMixin$LaunchRocket$LaunchRocketSecondStage
    extends JsonSerializable with EquatableMixin {
  LaunchFragmentMixin$LaunchRocket$LaunchRocketSecondStage();

  factory LaunchFragmentMixin$LaunchRocket$LaunchRocketSecondStage.fromJson(
          Map<String, dynamic> json) =>
      _$LaunchFragmentMixin$LaunchRocket$LaunchRocketSecondStageFromJson(json);

  List<LaunchFragmentMixin$LaunchRocket$LaunchRocketSecondStage$Payload?>?
      payloads;

  @override
  List<Object?> get props => [payloads];
  @override
  Map<String, dynamic> toJson() =>
      _$LaunchFragmentMixin$LaunchRocket$LaunchRocketSecondStageToJson(this);
}

@JsonSerializable(explicitToJson: true)
class LaunchFragmentMixin$LaunchRocket extends JsonSerializable
    with EquatableMixin {
  LaunchFragmentMixin$LaunchRocket();

  factory LaunchFragmentMixin$LaunchRocket.fromJson(
          Map<String, dynamic> json) =>
      _$LaunchFragmentMixin$LaunchRocketFromJson(json);

  @JsonKey(name: 'rocket_name')
  String? rocketName;

  @JsonKey(name: 'first_stage')
  LaunchFragmentMixin$LaunchRocket$LaunchRocketFirstStage? firstStage;

  @JsonKey(name: 'second_stage')
  LaunchFragmentMixin$LaunchRocket$LaunchRocketSecondStage? secondStage;

  @override
  List<Object?> get props => [rocketName, firstStage, secondStage];
  @override
  Map<String, dynamic> toJson() =>
      _$LaunchFragmentMixin$LaunchRocketToJson(this);
}

@JsonSerializable(explicitToJson: true)
class LaunchFragmentMixin$Ship extends JsonSerializable with EquatableMixin {
  LaunchFragmentMixin$Ship();

  factory LaunchFragmentMixin$Ship.fromJson(Map<String, dynamic> json) =>
      _$LaunchFragmentMixin$ShipFromJson(json);

  String? name;

  @JsonKey(name: 'home_port')
  String? homePort;

  String? image;

  @override
  List<Object?> get props => [name, homePort, image];
  @override
  Map<String, dynamic> toJson() => _$LaunchFragmentMixin$ShipToJson(this);
}

@JsonSerializable(explicitToJson: true)
class LaunchListArguments extends JsonSerializable with EquatableMixin {
  LaunchListArguments({required this.limit});

  @override
  factory LaunchListArguments.fromJson(Map<String, dynamic> json) =>
      _$LaunchListArgumentsFromJson(json);

  late int limit;

  @override
  List<Object?> get props => [limit];
  @override
  Map<String, dynamic> toJson() => _$LaunchListArgumentsToJson(this);
}

final LAUNCH_LIST_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'LaunchList'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'limit')),
            type: NamedTypeNode(name: NameNode(value: 'Int'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'launchesPast'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'limit'),
                  value: VariableNode(name: NameNode(value: 'limit')))
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                  name: NameNode(value: 'LaunchFragment'), directives: [])
            ]))
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'LaunchFragment'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(name: NameNode(value: 'Launch'), isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'mission_name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'launch_date_local'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'launch_site'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'site_name_long'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null)
            ])),
        FieldNode(
            name: NameNode(value: 'links'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'article_link'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'video_link'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null)
            ])),
        FieldNode(
            name: NameNode(value: 'rocket'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'rocket_name'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'first_stage'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                        name: NameNode(value: 'cores'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(selections: [
                          FieldNode(
                              name: NameNode(value: 'flight'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null),
                          FieldNode(
                              name: NameNode(value: 'core'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: SelectionSetNode(selections: [
                                FieldNode(
                                    name: NameNode(value: 'reuse_count'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null),
                                FieldNode(
                                    name: NameNode(value: 'status'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null)
                              ]))
                        ]))
                  ])),
              FieldNode(
                  name: NameNode(value: 'second_stage'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                        name: NameNode(value: 'payloads'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(selections: [
                          FieldNode(
                              name: NameNode(value: 'payload_type'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null),
                          FieldNode(
                              name: NameNode(value: 'payload_mass_kg'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null),
                          FieldNode(
                              name: NameNode(value: 'payload_mass_lbs'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null)
                        ]))
                  ]))
            ])),
        FieldNode(
            name: NameNode(value: 'ships'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'name'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'home_port'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'image'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null)
            ]))
      ]))
]);

class LaunchListQuery
    extends GraphQLQuery<LaunchList$Query, LaunchListArguments> {
  LaunchListQuery({required this.variables});

  @override
  final DocumentNode document = LAUNCH_LIST_QUERY_DOCUMENT;

  @override
  final String operationName = 'LaunchList';

  @override
  final LaunchListArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  LaunchList$Query parse(Map<String, dynamic> json) =>
      LaunchList$Query.fromJson(json);
}
