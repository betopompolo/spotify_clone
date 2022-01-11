// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.12

part of 'graphql_schema.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LaunchList$Query$Launch _$LaunchList$Query$LaunchFromJson(
        Map<String, dynamic> json) =>
    LaunchList$Query$Launch()
      ..missionName = json['mission_name'] as String?
      ..launchDateLocal = json['launch_date_local'] == null
          ? null
          : DateTime.parse(json['launch_date_local'] as String)
      ..launchSite = json['launch_site'] == null
          ? null
          : LaunchFragmentMixin$LaunchSite.fromJson(
              json['launch_site'] as Map<String, dynamic>)
      ..links = json['links'] == null
          ? null
          : LaunchFragmentMixin$LaunchLinks.fromJson(
              json['links'] as Map<String, dynamic>)
      ..rocket = json['rocket'] == null
          ? null
          : LaunchFragmentMixin$LaunchRocket.fromJson(
              json['rocket'] as Map<String, dynamic>)
      ..ships = (json['ships'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : LaunchFragmentMixin$Ship.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$LaunchList$Query$LaunchToJson(
        LaunchList$Query$Launch instance) =>
    <String, dynamic>{
      'mission_name': instance.missionName,
      'launch_date_local': instance.launchDateLocal?.toIso8601String(),
      'launch_site': instance.launchSite?.toJson(),
      'links': instance.links?.toJson(),
      'rocket': instance.rocket?.toJson(),
      'ships': instance.ships?.map((e) => e?.toJson()).toList(),
    };

LaunchList$Query _$LaunchList$QueryFromJson(Map<String, dynamic> json) =>
    LaunchList$Query()
      ..launchesPast = (json['launchesPast'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : LaunchList$Query$Launch.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$LaunchList$QueryToJson(LaunchList$Query instance) =>
    <String, dynamic>{
      'launchesPast': instance.launchesPast?.map((e) => e?.toJson()).toList(),
    };

LaunchFragmentMixin$LaunchSite _$LaunchFragmentMixin$LaunchSiteFromJson(
        Map<String, dynamic> json) =>
    LaunchFragmentMixin$LaunchSite()
      ..siteNameLong = json['site_name_long'] as String?;

Map<String, dynamic> _$LaunchFragmentMixin$LaunchSiteToJson(
        LaunchFragmentMixin$LaunchSite instance) =>
    <String, dynamic>{
      'site_name_long': instance.siteNameLong,
    };

LaunchFragmentMixin$LaunchLinks _$LaunchFragmentMixin$LaunchLinksFromJson(
        Map<String, dynamic> json) =>
    LaunchFragmentMixin$LaunchLinks()
      ..articleLink = json['article_link'] as String?
      ..videoLink = json['video_link'] as String?;

Map<String, dynamic> _$LaunchFragmentMixin$LaunchLinksToJson(
        LaunchFragmentMixin$LaunchLinks instance) =>
    <String, dynamic>{
      'article_link': instance.articleLink,
      'video_link': instance.videoLink,
    };

LaunchFragmentMixin$LaunchRocket$LaunchRocketFirstStage$LaunchRocketFirstStageCore$Core
    _$LaunchFragmentMixin$LaunchRocket$LaunchRocketFirstStage$LaunchRocketFirstStageCore$CoreFromJson(
            Map<String, dynamic> json) =>
        LaunchFragmentMixin$LaunchRocket$LaunchRocketFirstStage$LaunchRocketFirstStageCore$Core()
          ..reuseCount = json['reuse_count'] as int?
          ..status = json['status'] as String?;

Map<String, dynamic>
    _$LaunchFragmentMixin$LaunchRocket$LaunchRocketFirstStage$LaunchRocketFirstStageCore$CoreToJson(
            LaunchFragmentMixin$LaunchRocket$LaunchRocketFirstStage$LaunchRocketFirstStageCore$Core
                instance) =>
        <String, dynamic>{
          'reuse_count': instance.reuseCount,
          'status': instance.status,
        };

LaunchFragmentMixin$LaunchRocket$LaunchRocketFirstStage$LaunchRocketFirstStageCore
    _$LaunchFragmentMixin$LaunchRocket$LaunchRocketFirstStage$LaunchRocketFirstStageCoreFromJson(
            Map<String, dynamic> json) =>
        LaunchFragmentMixin$LaunchRocket$LaunchRocketFirstStage$LaunchRocketFirstStageCore()
          ..flight = json['flight'] as int?
          ..core = json['core'] == null
              ? null
              : LaunchFragmentMixin$LaunchRocket$LaunchRocketFirstStage$LaunchRocketFirstStageCore$Core
                  .fromJson(json['core'] as Map<String, dynamic>);

Map<String, dynamic>
    _$LaunchFragmentMixin$LaunchRocket$LaunchRocketFirstStage$LaunchRocketFirstStageCoreToJson(
            LaunchFragmentMixin$LaunchRocket$LaunchRocketFirstStage$LaunchRocketFirstStageCore
                instance) =>
        <String, dynamic>{
          'flight': instance.flight,
          'core': instance.core?.toJson(),
        };

LaunchFragmentMixin$LaunchRocket$LaunchRocketFirstStage
    _$LaunchFragmentMixin$LaunchRocket$LaunchRocketFirstStageFromJson(
            Map<String, dynamic> json) =>
        LaunchFragmentMixin$LaunchRocket$LaunchRocketFirstStage()
          ..cores = (json['cores'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : LaunchFragmentMixin$LaunchRocket$LaunchRocketFirstStage$LaunchRocketFirstStageCore
                      .fromJson(e as Map<String, dynamic>))
              .toList();

Map<String, dynamic>
    _$LaunchFragmentMixin$LaunchRocket$LaunchRocketFirstStageToJson(
            LaunchFragmentMixin$LaunchRocket$LaunchRocketFirstStage instance) =>
        <String, dynamic>{
          'cores': instance.cores?.map((e) => e?.toJson()).toList(),
        };

LaunchFragmentMixin$LaunchRocket$LaunchRocketSecondStage$Payload
    _$LaunchFragmentMixin$LaunchRocket$LaunchRocketSecondStage$PayloadFromJson(
            Map<String, dynamic> json) =>
        LaunchFragmentMixin$LaunchRocket$LaunchRocketSecondStage$Payload()
          ..payloadType = json['payload_type'] as String?
          ..payloadMassKg = (json['payload_mass_kg'] as num?)?.toDouble()
          ..payloadMassLbs = (json['payload_mass_lbs'] as num?)?.toDouble();

Map<String, dynamic>
    _$LaunchFragmentMixin$LaunchRocket$LaunchRocketSecondStage$PayloadToJson(
            LaunchFragmentMixin$LaunchRocket$LaunchRocketSecondStage$Payload
                instance) =>
        <String, dynamic>{
          'payload_type': instance.payloadType,
          'payload_mass_kg': instance.payloadMassKg,
          'payload_mass_lbs': instance.payloadMassLbs,
        };

LaunchFragmentMixin$LaunchRocket$LaunchRocketSecondStage
    _$LaunchFragmentMixin$LaunchRocket$LaunchRocketSecondStageFromJson(
            Map<String, dynamic> json) =>
        LaunchFragmentMixin$LaunchRocket$LaunchRocketSecondStage()
          ..payloads = (json['payloads'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : LaunchFragmentMixin$LaunchRocket$LaunchRocketSecondStage$Payload
                      .fromJson(e as Map<String, dynamic>))
              .toList();

Map<String,
    dynamic> _$LaunchFragmentMixin$LaunchRocket$LaunchRocketSecondStageToJson(
        LaunchFragmentMixin$LaunchRocket$LaunchRocketSecondStage instance) =>
    <String, dynamic>{
      'payloads': instance.payloads?.map((e) => e?.toJson()).toList(),
    };

LaunchFragmentMixin$LaunchRocket _$LaunchFragmentMixin$LaunchRocketFromJson(
        Map<String, dynamic> json) =>
    LaunchFragmentMixin$LaunchRocket()
      ..rocketName = json['rocket_name'] as String?
      ..firstStage = json['first_stage'] == null
          ? null
          : LaunchFragmentMixin$LaunchRocket$LaunchRocketFirstStage.fromJson(
              json['first_stage'] as Map<String, dynamic>)
      ..secondStage = json['second_stage'] == null
          ? null
          : LaunchFragmentMixin$LaunchRocket$LaunchRocketSecondStage.fromJson(
              json['second_stage'] as Map<String, dynamic>);

Map<String, dynamic> _$LaunchFragmentMixin$LaunchRocketToJson(
        LaunchFragmentMixin$LaunchRocket instance) =>
    <String, dynamic>{
      'rocket_name': instance.rocketName,
      'first_stage': instance.firstStage?.toJson(),
      'second_stage': instance.secondStage?.toJson(),
    };

LaunchFragmentMixin$Ship _$LaunchFragmentMixin$ShipFromJson(
        Map<String, dynamic> json) =>
    LaunchFragmentMixin$Ship()
      ..name = json['name'] as String?
      ..homePort = json['home_port'] as String?
      ..image = json['image'] as String?;

Map<String, dynamic> _$LaunchFragmentMixin$ShipToJson(
        LaunchFragmentMixin$Ship instance) =>
    <String, dynamic>{
      'name': instance.name,
      'home_port': instance.homePort,
      'image': instance.image,
    };

LaunchListArguments _$LaunchListArgumentsFromJson(Map<String, dynamic> json) =>
    LaunchListArguments(
      limit: json['limit'] as int,
    );

Map<String, dynamic> _$LaunchListArgumentsToJson(
        LaunchListArguments instance) =>
    <String, dynamic>{
      'limit': instance.limit,
    };
