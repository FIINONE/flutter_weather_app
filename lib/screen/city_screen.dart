import 'package:flutter/material.dart';
import 'package:flutter_lesson_1/model/city_history_model.dart';
import 'package:flutter_lesson_1/widgets/city_history.dart';
import 'package:provider/provider.dart';

class CityScreen extends StatefulWidget {
  static const String routeName = '/city_screen';
  const CityScreen({Key? key}) : super(key: key);

  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  final model = CityHistoryModel();


  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CityHistoryModel>.value(
      value: model,
      builder: (context, widget) {
        final contextRead = context.read<CityHistoryModel>();
        final contextWatch = context.watch<CityHistoryModel>();
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView(
                children: [
                  TextField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.location_city),
                      hintText: 'Enter City Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    onChanged: (value) {
                      contextRead.name = value;
                    },
                    onEditingComplete: () => contextRead.saveCity(context),
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () => contextRead.saveCity(context),
                    child: const Text('Get Weather'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blue[50],
                      ),
                      clipBehavior: Clip.hardEdge,
                      width: double.infinity,
                      height: 300,
                      child: CityHistoryView(
                        contextWatch: contextWatch,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        child: const Text('Clear history'),
                        onPressed: () =>
                            contextRead.clearHistory(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
