import 'package:flutter/material.dart';
import 'package:layout_widgets/gridview.dart';

class StepperTemp extends StatefulWidget {
  const StepperTemp({Key? key}) : super(key: key);

  @override
  _StepperTempState createState() => _StepperTempState();
}

class _StepperTempState extends State<StepperTemp> {
  late List<Step> _steps;
  late int current;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    current = 0;
    _steps = <Step>[
      const Step(
          title: Text('Step 1'),
          content: Text('GO To Next Step'),
          isActive: true),
      const Step(
          title: Text('Step 2'),
          content: Text('GO To Next Step'),
          isActive: true),
      const Step(
          title: Text('Step 3'), content: Text('FINISH'), isActive: true),
    ];
  }

  void _stepContinue() {
    setState(() {
      current++;
      if (current >= _steps.length) current = _steps.length - 1;
    });
  }

  void _stepCancel() {
    setState(() {
      current--;
      if (current < 0) current = 0;
    });
  }

  void _stepTap(int index) {
    setState(() {
      current = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Steps View',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: [
              Stepper(
                steps: _steps,
                type: StepperType.vertical,
                currentStep: current,
                onStepContinue: _stepContinue,
                onStepCancel: _stepCancel,
                onStepTapped: _stepTap,
              ),
               Padding(
                padding: const EdgeInsets.fromLTRB(40.0, 150.0, 40.0, 0.0),
                child: ElevatedButton(
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => GridTemp())),
                    child: const Text('NEXT')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
