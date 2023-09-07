import 'dart:convert';

class Apod {
  String? copyright;
  String? date;
  String? explanation;
  String? hdurl;
  String? mediaType;
  String? serviceVersion;
  String? title;
  String? url;

  Apod({
    this.copyright,
    this.date,
    this.explanation,
    this.hdurl,
    this.mediaType,
    this.serviceVersion,
    this.title,
    this.url,
  }); 

  @override
  String toString() {
    return 'Apod(copyright: $copyright, date: $date, explanation: $explanation, hdurl: $hdurl, mediaType: $mediaType, serviceVersion: $serviceVersion, title: $title, url: $url)';
  }

  factory Apod.fromMap(Map<String, dynamic> data) => Apod(
        copyright: data['copyright'] as String?,
        date: data['date'] as String?,
        explanation: data['explanation'] as String?,
        hdurl: data['hdurl'] as String?,
        mediaType: data['media_type'] as String?,
        serviceVersion: data['service_version'] as String?,
        title: data['title'] as String?,
        url: data['url'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'copyright': copyright,
        'date': date,
        'explanation': explanation,
        'hdurl': hdurl,
        'media_type': mediaType,
        'service_version': serviceVersion,
        'title': title,
        'url': url,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Apod].
  factory Apod.fromJson(String data) {
    return Apod.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Apod] to a JSON string.
  String toJson() => json.encode(toMap());

  Apod copyWith({
    String? copyright,
    String? date,
    String? explanation,
    String? hdurl,
    String? mediaType,
    String? serviceVersion,
    String? title,
    String? url,
  }) {
    return Apod(
      copyright: copyright ?? this.copyright,
      date: date ?? this.date,
      explanation: explanation ?? this.explanation,
      hdurl: hdurl ?? this.hdurl,
      mediaType: mediaType ?? this.mediaType,
      serviceVersion: serviceVersion ?? this.serviceVersion,
      title: title ?? this.title,
      url: url ?? this.url,
    );
  }
}
