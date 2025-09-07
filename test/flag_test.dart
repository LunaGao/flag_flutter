import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flag/flag.dart';

void main() {
  group('Flag static methods', () {
    test('getAssetPath should generate correct 4x3 asset path', () {
      String path = Flag.getAssetPath('us');
      expect(path, equals('packages/flag/res/4x3/us.svg'));
    });

    test('getAssetPath should generate correct 1x1 asset path', () {
      String path = Flag.getAssetPath('us', flagSize: FlagSize.size_1x1);
      expect(path, equals('packages/flag/res/1x1/us.svg'));
    });

    test('getAssetPath should handle uppercase input', () {
      String path = Flag.getAssetPath('GB');
      expect(path, equals('packages/flag/res/4x3/gb.svg'));
    });

    test('getAssetPathFromCode should generate correct 4x3 asset path', () {
      String path = Flag.getAssetPathFromCode(FlagsCode.US);
      expect(path, equals('packages/flag/res/4x3/us.svg'));
    });

    test('getAssetPathFromCode should generate correct 1x1 asset path', () {
      String path =
          Flag.getAssetPathFromCode(FlagsCode.CA, flagSize: FlagSize.size_1x1);
      expect(path, equals('packages/flag/res/1x1/ca.svg'));
    });

    test('getAssetPathFromCode should handle complex country codes', () {
      String path = Flag.getAssetPathFromCode(FlagsCode.GB_ENG);
      expect(path, equals('packages/flag/res/4x3/gb_eng.svg'));
    });

    test('flagsCode list should contain expected countries', () {
      expect(Flag.flagsCode.contains('us'), isTrue);
      expect(Flag.flagsCode.contains('gb'), isTrue);
      expect(Flag.flagsCode.contains('jp'), isTrue);
      expect(Flag.flagsCode.contains('invalid'), isFalse);
    });
  });

  group('Flag widget can be loaded from enum code', () {
    for (final enumCode in FlagsCode.values) {
      if (enumCode == FlagsCode.NULL) continue;

      testWidgets('can load $enumCode', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Flag.fromCode(enumCode, height: 100),
            ),
          ),
        );

        expect(find.byType(Flag), findsOneWidget);
        expect(find.byType(SvgPicture), findsOneWidget);
      });
    }

    testWidgets('Flag widget should handle invalid string codes gracefully',
        (tester) async {
      const String invalidCode = 'INVALID';
      const Widget replacementWidget = Text('Not found');

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Flag.fromString(
              invalidCode,
              height: 100,
              replacement: replacementWidget,
            ),
          ),
        ),
      );

      expect(find.text('Not found'), findsOneWidget);
      expect(find.byType(Flag), findsOneWidget);
      expect(find.byType(SvgPicture), findsNothing);
    });
  });
}
