
import 'package:flutter/material.dart';

import 'package:table_calendar/table_calendar.dart';


class DatePickPage extends StatefulWidget {
  const DatePickPage({Key? key}) : super(key: key);

  @override
  State<DatePickPage> createState() => _DatePickPageState();
}

class _DatePickPageState extends State<DatePickPage>{

  DateTime today = DateTime.now();
  TimeOfDay time = TimeOfDay(hour: 10, minute: 30);
  void _onDaySelected(DateTime day,DateTime focusedDay){
    setState((){
      today = day;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text(
          'Date Pick',
          style: TextStyle(color: Colors.amber),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/BarberList');
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.amber,
          ),
        ),
        centerTitle: true,
      ),
      body: content(),
    );
  }

  Widget content(){
    final hours = time.hour.toString().padLeft(2,'0');
    final minutes = time.minute.toString().padLeft(2,'0');
    return Column(
      children: [
        const Text(""),
        Center(
          child: TableCalendar(
              locale: "es_CO",
              headerStyle: const HeaderStyle(titleCentered:true,formatButtonVisible:false),
              selectedDayPredicate: (day)=> isSameDay(day, today),
              focusedDay: DateTime.now(),
              firstDay: DateTime.utc(2023,06,10),
              lastDay: DateTime.utc(2023,12,31),
              onDaySelected: _onDaySelected,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          '$hours:$minutes',
          style: const TextStyle(fontSize: 24),
        ),
        const SizedBox(height: 14),
        ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.amber,onPrimary: Colors.black87),
            child: const Text("Select time"),
            onPressed: () async {
              TimeOfDay? newTime = await showTimePicker(
                  context: context,
                  initialTime: time
              );
              if (newTime == null)return;
              setState(() => time = newTime);
            },
            ),
        const SizedBox(height: 50,),
        SizedBox(
          width: 200,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.amber,onPrimary: Colors.black87),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                     SnackBar(
                      content: Container(
                        padding: const EdgeInsets.all(16),
                        height: 90,
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: const [
                              Text("¡HECHO!", style: TextStyle(fontSize: 16,color: Colors.black87),),
                              Text("Se a agendado la cita con exito", style: TextStyle(fontSize: 16,color: Colors.black87),),
                            ],
                          )),
                      behavior: SnackBarBehavior.floating,
                       backgroundColor: Colors.transparent,
                       elevation: 0,
                    ),
                );
                Navigator.pushNamed(context, '/SuccessPayment');
              },
              child: const Text("Asignar Cita"),
          ),
        ),
      ],
    );
  }
}