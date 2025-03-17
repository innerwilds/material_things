import 'package:flutter/material.dart';
import 'package:material_things/material_things.dart';

late List<Country> countries;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  countries = await AssetCountries.load();
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Are you from ${_country?.fullName ?? '*country*'}?'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Card(
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
                        final country = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return SelectCountryPage(
                                countries: countries,
                                restrictedCountries: [
                                  const Country(1, 'US', 'United States'),
                                ],
                                restrictedReasons: {
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
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text('No shared controller, only onChanged'),
                    CountryButton(
                      decoration: InputDecoration(
                        labelText: 'Your phone country',
                      ),
                      onTap: () async {
                        final country = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return SelectCountryPage(
                                countries: countries,
                                restrictedCountries: [
                                  const Country(1, 'US', 'United States'),
                                ],
                                restrictedReasons: {
                                  const Country(1, 'US', 'United States'):
                                      'White House is not red...',
                                },
                              );
                            },
                          ),
                        );
                        if (country == null) return;
                        setState(() {
                          _country = country;
                        });
                      },
                      country: _country,
                    ),
                    CountryField(
                      decoration: InputDecoration(
                        labelText: "Just a country name",
                      ),
                      type: CountryFieldType.custom,
                      onChanged: (country) {
                        setState(() {
                          _country = country;
                        });
                      },
                      autofillHints: {'Russian Federation'},
                      countries: countries,
                    ),
                    PhoneField(
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
            ),
          ],
        ),
      ),
    );
  }
}
