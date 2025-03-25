import 'package:flutter/material.dart';
import 'package:material_things/material_things.dart';

late List<Country> countries;
late List<ExtendedLocale> locales;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  countries = await AssetCountries.load();
  locales = await AssetLocales.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(routes: {'/': (_) => const MyHomePage()});
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CountriesPreview(),
            LocalesPreview(),
          ],
        ),
      ),
    );
  }
}

class CountriesPreview extends StatefulWidget {
  const CountriesPreview({super.key});

  @override
  State<CountriesPreview> createState() => _CountriesPreviewState();
}

class _CountriesPreviewState extends State<CountriesPreview> {
  Country? _country;

  final CountryEditingController _countryController =
  CountryEditingController();
  final PhoneEditingController _phoneController = PhoneEditingController();

  @override
  void initState() {
    super.initState();
    _countryController.addListener(() {
      _phoneController.country = _countryController.country;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text('Shared controllers, c -> p proxy'),
            CountryButton(
              decoration: InputDecoration(
                labelText: 'Your phone country',
              ),
              onTap: () async {
                final nav = Navigator.of(context);
                final country = await nav.push(
                  MaterialPageRoute(
                    builder: (context) {
                      return SelectCountryPage(
                        onPeek: (_) {
                          nav.pop();
                        },
                        countries: countries,
                        restrictedCountries: {
                          const Country(1, 'US', 'United States'):
                          'White House is not red...',
                        },
                      );
                    },
                  ),
                );
                if (country == null) return;
                _countryController.country = country;
              },
              controller: _countryController,
            ),
            CountryField(
              controller: _countryController,
              decoration: InputDecoration(
                labelText: "Just a country name",
              ),
              type: CountryFieldType.custom,
              countries: countries,
            ),
            PhoneField(
              controller: _phoneController,
              countries: countries,
              onChanged: (country, nsn) {
                setState(() {
                  _country = country;
                });
              },
              autoFormat: true,
            ),
          ],
        ),
      ),
    );
  }
}


class LocalesPreview extends StatefulWidget {
  const LocalesPreview({super.key});

  @override
  State<LocalesPreview> createState() => _LocalesPreviewState();
}

class _LocalesPreviewState extends State<LocalesPreview> {
  final LocaleEditingController _localeController =
  LocaleEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text('Shared controllers, c -> p proxy'),
            LocaleButton(
              decoration: InputDecoration(
                labelText: 'App locale',
              ),
              onTap: () async {
                final nav = Navigator.of(context);
                final locale = await nav.push(
                  MaterialPageRoute(
                    builder: (context) {
                      return SelectLocalePage(
                        onPeek: (_) {
                          nav.pop();
                        },
                        locales: locales,
                      );
                    },
                  ),
                );
                if (locale == null) return;
                _localeController.locale = locale;
              },
              controller: _localeController,
            ),
          ],
        ),
      ),
    );
  }
}
