import 'package:flutter/material.dart';

void main() {
  runApp(FlutterApp());
}

class FlutterApp extends StatelessWidget {
  const FlutterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Web App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _selectedPageIndex = 0;

  // Page options
  final List<Widget> _pages = [
    AddEmployeeForm(),
    EmployeesList(),
  ];

  // Drawer menu
  void _onSelectMenuOption(int index) {
    setState(() {
      _selectedPageIndex = index;
      Navigator.of(context).pop(); // Close the drawer
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
               decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Menu', style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text('Add Employee'),
              onTap: () => _onSelectMenuOption(0),
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text('View Employees List'),
              onTap: () => _onSelectMenuOption(1),
            ),
          ],
        ),
      ),
      body: _pages[_selectedPageIndex], // Show the selected page
    );
  }
}

// Add Employee Form
class AddEmployeeForm extends StatelessWidget {
  const AddEmployeeForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Add Employee',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(labelText: 'Name'),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Position'),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Department'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Submit action (No backend logic yet)
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}

// Employees List
class EmployeesList extends StatelessWidget {
  const EmployeesList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemCount: 5, // Temporary employee count for the UI
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text('Employee ${index + 1}'),
            subtitle: Text('Position ${index + 1}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    // Navigate to form for editing (can use same form as AddEmployee)
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => AddEmployeeForm(),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    // Delete action
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
