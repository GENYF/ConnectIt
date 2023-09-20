import 'package:flutter/material.dart';

/// Spacings
const double defaultSpacing = 16.0;
const double defaultSpacingHalf = defaultSpacing / 2;
const double defaultSpacingQuarter = defaultSpacing / 4;
const double defaultSpacingThreeQuarters = defaultSpacingQuarter * 3;
const double defaultDoubleSpacing = defaultSpacing * 2;

/// border radius
const double defaultBorderRadius = 16.0;
const double defaultBorderRadiusHalf = defaultBorderRadius / 2;
const double defaultDoubleBorderRadius = defaultBorderRadius * 2;

/// FontWeight
///
/// 100 [Thin] (Hairline)
///
/// 200 [Extra Light] (Ultra Light)
///
/// 300 [Light]
///
/// 400 [Normal] (Regular)
///
/// 500 [Medium]
///
/// 600 [Semi Bold] (Demi Bold)
///
/// 700 [Bold]
///
/// 800 [Extra Bold] (Ultra Bold)
///
/// 900 [Black] (Heavy)

const TextStyle baseTextStyle = TextStyle(
  leadingDistribution: TextLeadingDistribution.even,
  fontWeight: FontWeight.w500,
  color: Colors.black87,
);

class DesignerTextStyle {
  // headers
  static TextStyle header1 = baseTextStyle.copyWith(
    fontSize: 22,
    height: 1.45, // line height: 32
    fontWeight: FontWeight.w700, // font weight: Bold
    color: Colors.black87,
  );
  static TextStyle header2 = baseTextStyle.copyWith(
    fontSize: 20,
    height: 1.2, // line height: 24
    fontWeight: FontWeight.w700, // font weight: Bold
    color: Colors.black87,
  );
  static TextStyle header3 = baseTextStyle.copyWith(
    fontSize: 16,
    height: 1.5, // line height: 24
    fontWeight: FontWeight.w700, // font weight: Bold
    color: Colors.black87,
  );
  static TextStyle header4 = baseTextStyle.copyWith(
    fontSize: 14,
    height: 1.57, // line height: 22
    fontWeight: FontWeight.w700, // font weight: Bold
    color: Colors.black87,
  );

  // paragraphs
  static TextStyle paragraph1 = baseTextStyle.copyWith(
    fontSize: 18,
    height: 1.55, // line height: 28
    fontWeight: FontWeight.w500, // font weight: Medium
    color: Colors.black87,
  );
  static TextStyle paragraph2 = baseTextStyle.copyWith(
    fontSize: 16,
    height: 1.5, // line height: 24
    fontWeight: FontWeight.w500, // font weight: Medium
    color: Colors.black87,
  );
  static TextStyle paragraph3 = baseTextStyle.copyWith(
    fontSize: 14,
    height: 1.57, // line height: 22
    fontWeight: FontWeight.w500, // font weight: Medium
    color: Colors.black87,
  );

  // captions
  static TextStyle caption1 = baseTextStyle.copyWith(
    fontSize: 14,
    height: 1.57, // line height: 22
    fontWeight: FontWeight.w400, // font weight: Regular
    color: Colors.black87,
  );
  static TextStyle caption2 = baseTextStyle.copyWith(
    fontSize: 12,
    height: 1.5, // line height: 18
    fontWeight: FontWeight.w400, // font weight: Regular
    color: Colors.black87,
  );

  // titles
  static TextStyle title1 = baseTextStyle.copyWith(
    fontSize: 18,
    height: 1.55, // line height: 28
    fontWeight: FontWeight.w600, // font weight: Semi Bold
    color: Colors.black87,
  );
  static TextStyle title2 = baseTextStyle.copyWith(
    fontSize: 16,
    height: 1.5, // line height: 24
    fontWeight: FontWeight.w600, // font weight: Semi Bold
    color: Colors.black87,
  );

  // navigations
  static TextStyle navigationBold = baseTextStyle.copyWith(
    fontSize: 10,
    height: 1.4, // line height: 14
    fontWeight: FontWeight.w700, // font weight: Bold
    color: Colors.black87,
  );
  static TextStyle navigationBasic = baseTextStyle.copyWith(
    fontSize: 10,
    height: 1.4, // line height: 14
    fontWeight: FontWeight.w500, // font weight: Medium
    color: Colors.black87,
  );

  // below customized, frequently-used textstyles
  static TextStyle plainTextStyle = baseTextStyle.copyWith(
    fontSize: 16,
    height: 1.5, // line height : 24
    color: Colors.black87,
  );

  static TextStyle highlightedTextStyle = baseTextStyle.copyWith(
    fontSize: 16,
    height: 1.5, // line height : 24
    fontWeight: FontWeight.w600,
    color: Colors.red,
  );

  static TextStyle attentionTextStyle = baseTextStyle.copyWith(
    fontSize: 10,
    height: 1.0, // line height : 10
    fontWeight: FontWeight.w400,
  );
}
