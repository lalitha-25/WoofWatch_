import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:intl/intl.dart';
void main() {
  runApp(const WoofWatchApp());
}

class WoofWatchApp extends StatelessWidget {
  const WoofWatchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "WoofWatch: Trusted Pet Sitters",
      theme: ThemeData(primarySwatch: Colors.orange),
      home: const LoginScreen(),
    );
  }
}


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white24,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "WoofWatch: Trusted Pet Sitter",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 50),
              _buildLoginButton(context, "Pet Owner"),
              const SizedBox(height: 20),
              _buildLoginButton(context, "Care Taker"),
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton _buildLoginButton(BuildContext context, String userType) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange,
        foregroundColor: Colors.brown,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      onPressed: () {
        if (userType == "Pet Owner") {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const PetOwnerLoginForm()));
        } else {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const CareTakerLoginForm()));
        }
      },
      child: Text(userType, style: const TextStyle(fontSize: 18)),
    );
  }
}

//----------------------caretaker login form-----------------------
class CareTakerLoginForm extends StatelessWidget {
  const CareTakerLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("WoofWatch - Care Taker"),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.brown,
      ),
      body: _buildLoginForm(context, "Care Taker"),
    );
  }

  Widget _buildLoginForm(BuildContext context, String userType) {
    return Container(
      color: Colors.white24,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Login as $userType",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.brown),
            ),
            const SizedBox(height: 20),
            _buildTextField("Username"),
            const SizedBox(height: 15),
            _buildTextField("Password", isPassword: true),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.brown,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CaretakerHomePage()));
              },
              child: const Text("Login", style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }

  TextFormField _buildTextField(String label, {bool isPassword = false}) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      obscureText: isPassword,
    );
  }
}


//----------------------------petowner loginform-------------------
class PetOwnerLoginForm extends StatelessWidget {
  const PetOwnerLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("WoofWatch - Pet Owner"),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.brown,
      ),
      body: _buildLoginForm(context, "Pet Owner"),
    );
  }

  Widget _buildLoginForm(BuildContext context, String userType) {
    return Container(
      color: Colors.white24,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Login as $userType",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.brown),
            ),
            const SizedBox(height: 20),
            _buildTextField("Username"),
            const SizedBox(height: 15),
            _buildTextField("Password", isPassword: true),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.brown,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomeScreen(userType: '',)));
              },
              child: const Text("Login", style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }

  TextFormField _buildTextField(String label, {bool isPassword = false}) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      obscureText: isPassword,
    );
  }
}


//----------------------------pet login form----------------------
class PetOwnerLoginScreen extends StatelessWidget {
  const PetOwnerLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WoofWatch - Pet Owner Login"),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.brown,
      ),
      body: LoginForm(userType: "Pet Owner"),
    );
  }
}
//---------------------------caretaker Home page------------------
class CaretakerHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Caretaker HomePage"),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Caretaker Profile Section
            CaretakerProfile(),

            // Buttons for Navigation
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DogCareTipsPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.brown, // Text color set to brown
                minimumSize: Size(double.infinity, 50), // Resize the button height
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                "View Dog Care Tips",
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ReviewsPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.brown, // Text color set to brown
                minimumSize: Size(double.infinity, 50), // Resize the button height
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                "View Reviews",
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CaretakerAvailabilityPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.brown, // Text color set to brown
                minimumSize: Size(double.infinity, 50), // Resize the button height
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                "Set Availability Times",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CaretakerProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 8, spreadRadius: 2),
        ],
      ),
      child: Column(
        children: [
          // Profile Picture
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage("https://via.placeholder.com/150"),
          ),
          // Name and Bio
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  "Krishna",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  "Experienced and compassionate caretaker ensuring pets feel safe, loved, and well-cared for with expert attention to health and behavior needs.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DogCareTipsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dog Care Tips"),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Text(
            //
            //   style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            // ),
            // SizedBox(height: 5),
            // Text("1. Keep your dog hydrated during walks.",style:TextStyle(fontSize: 20)),
            SizedBox(height: 5),
            Text("1. Regular grooming is essential for a healthy dog.",style:TextStyle(fontSize: 20)),
            SizedBox(height: 5),
            Text("2. Maintain a balanced diet for your dog's health.",style:TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}

class ReviewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reviews"),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ReviewCard(name: "John", review: "Amazing caretaker, highly recommended!"),
            SizedBox(height: 10),
            ReviewCard(name: "Chinnu", review: "Took great care of my dog while I was away."),
          ],
        ),
      ),
    );
  }
}

class ReviewCard extends StatelessWidget {
  final String name;
  final String review;

  ReviewCard({required this.name, required this.review});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(review),
          ],
        ),
      ),
    );
  }
}

class CaretakerAvailabilityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Caretaker Availability"),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Available Times",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text("Monday - Friday: 9:00 AM - 5:00 PM", style: TextStyle(fontSize: 18)),
            SizedBox(height: 5),
            Text("Saturday - Sunday: 10:00 AM - 3:00 PM", style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add functionality to show a form or dialog for new available time
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text("Set Available Time"),
              content: Text("Here you can add available time (functionality to be implemented)."),
              actions: [
                TextButton(
                  child: Text("Close"),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          );
        },
        backgroundColor: Colors.orange,
        child: Icon(Icons.add),
        tooltip: "Set Available Time",
      ),
    );
  }
}


//---------------------------care---------------------------------
class CareTakerLoginScreen extends StatelessWidget {
  const CareTakerLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WoofWatch - Care Taker Login"),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.brown,
      ),
      body: LoginForm(userType: "Care Taker"),
    );
  }
}
// -------------------------- Login Form --------------------------
class LoginForm extends StatelessWidget {
  final String userType;
  const LoginForm({super.key, required this.userType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WoofWatch - $userType"),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.brown,
      ),
      body: Container(

        color: Colors.white24,
        child: Padding(
          padding: const EdgeInsets.all(20.0),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Login as $userType",
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.brown),
              ),
              const SizedBox(height: 20),
              _buildTextField("Username"),
              const SizedBox(height: 15),
              _buildTextField("Password", isPassword: true),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.brown,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder:(context)=>HomeScreen(userType:userType))
                  );
                },
                child: const Text("Login", style: TextStyle(fontSize: 18)),
              ),


        ],
          ),
        ),
      ),
    );
  }

  TextFormField _buildTextField(String label, {bool isPassword = false}) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      obscureText: isPassword,
    );
  }
}

//--------------------------HomeScreen----------------------------

class HomeScreen extends StatelessWidget {
  final String userType;
  const HomeScreen({super.key, required this.userType});

  final List<Map<String, String>> tips = const [
    {"text": "Ensure your dog gets daily exercise.", "avatar": "assets/dog1.png ')"},
    {"text": "Provide fresh water and a balanced diet.", "avatar": "assets/dog2.png"},
    {"text": "Regular vet check-ups are essential.", "avatar": "assets/dog3.png"},
    {"text": "Keep your dog groomed and clean.", "avatar": "assets/dog4.png"},
    {"text": "Socialize your dog with other pets and people.", "avatar": "assets/dog5.png"}
  ];

  final List<Map<String, String>> userProfiles = const [
    {"name": "Ashok", "avatar": "assets/user1.png"},
    {"name": "Vishal", "avatar": "assets/user2.png"},
    {"name": "Raghavan", "avatar": "assets/user3.png"},
    {"name": "Karthik", "avatar": "assets/user4.png"},
    {"name": "Pugal", "avatar": "assets/user5.png"}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("WoofWatch"),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.brown,
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle, color: Colors.brown),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const OwnerProfilePage()),
              );
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.white24,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Nearby caretakers profile",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.brown),
              ),
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: userProfiles.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(userProfiles[index]["avatar"]!),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          userProfiles[index]["name"]!,
                          style: const TextStyle(color: Colors.brown),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SchedulePage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text("Schedule"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Tips()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text("Tips"),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Featured Dogs",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.brown),
              ),
            ),
            Expanded(
              child: CarouselSlider(
                options: CarouselOptions(height: 200, autoPlay: true, enlargeCenterPage: true),
                items: tips.map((tip) {
                  return Card(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(tip["avatar"]!),
                      ),
                      title: Text(
                        tip["text"]!,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class Tips extends StatefulWidget {
  const Tips({super.key});

  @override
  State<Tips> createState() => _TipsState();
}

class _TipsState extends State<Tips> {
  final List<Map<String, String>> tips = [
    {"text": "Ensure your dog gets daily exercise.", "avatar": "assets/dog1.png"},
    {"text": "Provide fresh water and a balanced diet.", "avatar": "assets/dog2.png"},
    {"text": "Regular vet check-ups are essential.", "avatar": "assets/dog3.png"},
    {"text": "Keep your dog groomed and clean.", "avatar": "assets/dog4.png"},
    {"text": "Socialize your dog with other pets and people.", "avatar": "assets/dog5.png"},
  ];

  final TextEditingController _tipController = TextEditingController();

  void _showAddTipDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Add a Tip"),
        content: TextField(
          controller: _tipController,
          decoration: const InputDecoration(
            labelText: "Enter dog care tip",
            border: OutlineInputBorder(),
          ),
          maxLines: 2,
        ),
        actions: [
          TextButton(
            onPressed: () {
              _tipController.clear();
              Navigator.pop(context);
            },
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              final newTip = _tipController.text.trim();
              if (newTip.isNotEmpty) {
                setState(() {
                  tips.add({
                    "text": newTip,
                    "avatar": "assets/dog1.png" // You can change or make it selectable later
                  });
                });
                _tipController.clear();
                Navigator.pop(context);
              }
            },
            child: const Text("Add"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tips"),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.brown,
      ),
      body: Container(
        color: Colors.white24,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Dog Care Tips",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.brown),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(20.0),
                itemCount: tips.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(tips[index]["avatar"]!),
                      ),
                      title: Text(
                        tips[index]["text"]!,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTipDialog,
        backgroundColor: Colors.orange,
        child: const Icon(Icons.add),
      ),
    );
  }
}


//--------------------owner profile page----------------------------

class OwnerProfilePage extends StatefulWidget {
  const OwnerProfilePage({super.key});

  @override
  State<OwnerProfilePage> createState() => _OwnerProfilePageState();
}

class _OwnerProfilePageState extends State<OwnerProfilePage> {
  String ownerName = 'Lakshmi';
  int ownerAge = 25;
  String contact = 'lakshmi@example.com';

  List<Map<String, String>> dogs = [];
  void _showAddDogDialog() {
    final nameController = TextEditingController();
    final ageController = TextEditingController();
    final vetController = TextEditingController();

    final healthCustomController = TextEditingController();
    final foodCustomController = TextEditingController();
    final behaviourCustomController = TextEditingController();
    final vaccinationCustomController = TextEditingController();

    String selectedHealth = "None";
    String selectedFood = "Dry Food";
    String selectedBehaviour = "Friendly";
    String selectedVaccinationStatus = "Not Vaccinated";
    DateTime? selectedDateOfBirth;

    List<String> healthOptions = ["None", "Allergies", "Diabetes", "Arthritis", "Skin Issues"];
    List<String> foodOptions = ["Dry Food", "Wet Food", "Home Cooked", "Raw Diet", "Prescription Food"];
    List<String> behaviourOptions = ["Friendly", "Aggressive", "Shy", "Playful", "Anxious", "Protective"];
    List<String> vaccinationStatusOptions = ["Not Vaccinated", "Vaccinated"];

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Add Dog Details"),
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextField(controller: nameController, decoration: const InputDecoration(labelText: 'Dog Name')),
              TextField(controller: ageController, decoration: const InputDecoration(labelText: 'Dog Age')),

              const SizedBox(height: 10),
              Tooltip(
                message: "Indicates any health conditions the dog might have.",
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DropdownButtonFormField<String>(
                      value: selectedHealth,
                      decoration: const InputDecoration(labelText: 'Health Issue'),
                      items: healthOptions.map((issue) => DropdownMenuItem(value: issue, child: Text(issue))).toList(),
                      onChanged: (value) => setState(() => selectedHealth = value!),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: healthCustomController,
                            decoration: const InputDecoration(labelText: 'Add Custom Health Issue'),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            String newOption = healthCustomController.text.trim();
                            if (newOption.isNotEmpty && !healthOptions.contains(newOption)) {
                              setState(() {
                                healthOptions.add(newOption);
                                selectedHealth = newOption;
                                healthCustomController.clear();
                              });
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),
              Tooltip(
                message: "Describes the dog's behavior or personality.",
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DropdownButtonFormField<String>(
                      value: selectedBehaviour,
                      decoration: const InputDecoration(labelText: 'Behaviour'),
                      items: behaviourOptions.map((behavior) => DropdownMenuItem(value: behavior, child: Text(behavior))).toList(),
                      onChanged: (value) => setState(() => selectedBehaviour = value!),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: behaviourCustomController,
                            decoration: const InputDecoration(labelText: 'Add Custom Behaviour'),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            String newOption = behaviourCustomController.text.trim();
                            if (newOption.isNotEmpty && !behaviourOptions.contains(newOption)) {
                              setState(() {
                                behaviourOptions.add(newOption);
                                selectedBehaviour = newOption;
                                behaviourCustomController.clear();
                              });
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),
              Tooltip(
                message: "Specifies the dog's type of food.",
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DropdownButtonFormField<String>(
                      value: selectedFood,
                      decoration: const InputDecoration(labelText: 'Food Intake'),
                      items: foodOptions.map((food) => DropdownMenuItem(value: food, child: Text(food))).toList(),
                      onChanged: (value) => setState(() => selectedFood = value!),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: foodCustomController,
                            decoration: const InputDecoration(labelText: 'Add Custom Food'),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            String newOption = foodCustomController.text.trim();
                            if (newOption.isNotEmpty && !foodOptions.contains(newOption)) {
                              setState(() {
                                foodOptions.add(newOption);
                                selectedFood = newOption;
                                foodCustomController.clear();
                              });
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),
              Tooltip(
                message: "Shows the vaccination status of the dog.",
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DropdownButtonFormField<String>(
                      value: selectedVaccinationStatus,
                      decoration: const InputDecoration(labelText: 'Vaccination Status'),
                      items: vaccinationStatusOptions
                          .map((status) => DropdownMenuItem(value: status, child: Text(status)))
                          .toList(),
                      onChanged: (value) => setState(() => selectedVaccinationStatus = value!),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: vaccinationCustomController,
                            decoration: const InputDecoration(labelText: 'Add Custom Vaccination Status'),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            String newOption = vaccinationCustomController.text.trim();
                            if (newOption.isNotEmpty && !vaccinationStatusOptions.contains(newOption)) {
                              setState(() {
                                vaccinationStatusOptions.add(newOption);
                                selectedVaccinationStatus = newOption;
                                vaccinationCustomController.clear();
                              });
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),
              Tooltip(
                message: "Enter the name and contact of the vet.",
                child: TextField(
                  controller: vetController,
                  decoration: const InputDecoration(labelText: 'Veterinary Doctor Details'),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (nameController.text.trim().isEmpty || ageController.text.trim().isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Please enter dog's name and age.")),
                );
                return;
              }
              setState(() {
                dogs.add({
                  'name': nameController.text,
                  'age': ageController.text,
                  'health': selectedHealth,
                  'behaviour': selectedBehaviour,
                  'food': selectedFood,
                  'vaccination': selectedVaccinationStatus,
                  //'dob': selectedDateOfBirth != null ? DateFormat('yyyy-MM-dd').format(selectedDateOfBirth!) : '',
                  'vet': vetController.text,
                });
              });
              Navigator.pop(context);
            },
            child: const Text('Add'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

  Widget _buildDogCard(Map<String, String> dog) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("🐶 Name: ${dog['name']}", style: const TextStyle(fontSize: 16)),
            Text("🎂 Age: ${dog['age']}", style: const TextStyle(fontSize: 16)),
            Text("💊 Health: ${dog['health']}", style: const TextStyle(fontSize: 16)),
            Text("🎭 Behaviour: ${dog['behaviour']}", style: const TextStyle(fontSize: 16)),
            Text("🍽️ Food: ${dog['food']}", style: const TextStyle(fontSize: 16)),
            Text("💉 Vaccination: ${dog['vaccination']}", style: const TextStyle(fontSize: 16)),
           // Text("🎓 Training: ${dog['training']}", style: const TextStyle(fontSize: 16)),
            //Text("🎂 Date of Birth: ${dog['dob']}", style: const TextStyle(fontSize: 16)),
            Text("👩‍⚕️ Vet: ${dog['vet']}", style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pet Owner Profile"),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("👤 Name: $ownerName", style: const TextStyle(fontSize: 18)),
            Text("🎂 Age: $ownerAge", style: const TextStyle(fontSize: 18)),
            Text("📞 Contact: $contact", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _showAddDogDialog,
              icon: const Icon(Icons.add),
              label: const Text("Add Dog Details"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            const Text("Dog Details:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Expanded(
              child: dogs.isEmpty
                  ? const Text("No dog details added yet.")
                  : ListView.builder(
                itemCount: dogs.length,
                itemBuilder: (context, index) => _buildDogCard(dogs[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//---------------Schedule page------------------


class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  DateTime? selectedDate;
  TimeOfDay? selectedStartTime;
  TimeOfDay? selectedEndTime;

  List<Map<String, dynamic>> availabilityList = [];

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null) setState(() => selectedDate = picked);
  }

  Future<void> _selectStartTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedStartTime ?? TimeOfDay.now(),
    );
    if (picked != null) setState(() => selectedStartTime = picked);
  }

  Future<void> _selectEndTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedEndTime ?? TimeOfDay.now(),
    );
    if (picked != null) setState(() => selectedEndTime = picked);
  }

  void _addAvailability() {
    if (selectedDate != null && selectedStartTime != null && selectedEndTime != null) {
      setState(() {
        availabilityList.add({
          'date': selectedDate,
          'startTime': selectedStartTime,
          'endTime': selectedEndTime,
        });
        selectedDate = null;
        selectedStartTime = null;
        selectedEndTime = null;
      });
    }
  }

  String formatTimeOfDay(TimeOfDay time) {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    return TimeOfDay.fromDateTime(dt).format(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Schedule'),
        backgroundColor: Colors.orange,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildButton('Select Date', Icons.calendar_today, _selectDate),
            const SizedBox(height: 20),
            _buildButton('Select Start Time', Icons.access_time, _selectStartTime),
            const SizedBox(height: 20),
            _buildButton('Select End Time', Icons.access_time, _selectEndTime),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addAvailability,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Add Availability'),
            ),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 20),
            const Text(
              'See Availability',
              style: TextStyle(fontSize: 16, color: Colors.brown),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CaretakerListScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Go to Caretaker List'),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: availabilityList.length,
                itemBuilder: (context, index) {
                  final item = availabilityList[index];
                  return ListTile(
                    title: Text(
                      '${item['date'].toLocal().toString().split(' ')[0]} | ${formatTimeOfDay(item['startTime'])} - ${formatTimeOfDay(item['endTime'])}',
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        setState(() => availabilityList.removeAt(index));
                      },
                    ),
                  );
                },
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String label, IconData icon, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        side: const BorderSide(color: Colors.black, width: 1),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.black),
          const SizedBox(width: 10),
          Text(
            label,
            style: const TextStyle(fontSize: 18, color: Colors.black),
          ),
        ],
      ),
    );
  }
}



//----------------------Available caretaker profile--------------------

class Review {
  final String reviewerName;
  final String reviewText;
  final double rating;

  Review({
    required this.reviewerName,
    required this.reviewText,
    required this.rating,
  });
}

class Caretaker {
  final String name;
  final String imageUrl;
  final String availability;
  final String bio;
  final double rating;
  final int pricePerHour;
  final List<Review> reviews;

  Caretaker({
    required this.name,
    required this.imageUrl,
    required this.availability,
    required this.bio,
    required this.rating,
    required this.pricePerHour,
    required this.reviews,
  });
}

class CaretakerListScreen extends StatelessWidget {
  final List<Caretaker> caretakers = [
    Caretaker(
      name: "Naveen Kumar",
      imageUrl: "https://example.com/alex.jpg",
      availability: "Mon - Fri, 9 AM - 5 PM",
      bio: "Experienced dog sitter with 5 years of experience in handling all types of dogs.",
      rating: 4.5,
      pricePerHour: 300,
      reviews: [
        Review(reviewerName: "Jaanu", reviewText: "Naveen is fantastic! My dog loved him.", rating: 5.0),
        Review(reviewerName: "Ramu", reviewText: "Would book again!", rating: 4.7),
      ],
    ),
    Caretaker(
      name: "Anjali",
      imageUrl: "https://example.com/anjali.jpg",
      availability: "Weekdays, 9 AM - 5 PM",
      bio: "Gentle and patient caretaker with experience in senior dog care.",
      rating: 4.9,
      pricePerHour: 400,
      reviews: [],
    ),
    Caretaker(
      name: "Ravi",
      imageUrl: "https://example.com/ravi.jpg",
      availability: "Weekends, 10 AM - 6 PM",
      bio: "Active caretaker who enjoys playing fetch and teaching basic commands.",
      rating: 4.7,
      pricePerHour: 300,
      reviews: [],
    ),

    Caretaker(
      name: "Divya",
      imageUrl: "https://example.com/divya.jpg",
      availability: "Daily, 6 AM - 12 PM",
      bio: "Loving and friendly caretaker with a background in veterinary nursing.",
      rating: 5.0,
      pricePerHour: 450,
      reviews: [],
    ),
    Caretaker(
      name: "Arun",
      imageUrl: "https://example.com/arun.jpg",
      availability: "Evenings, 4 PM - 10 PM",
      bio: "Responsible caretaker with a knack for calming anxious pets.",
      rating: 4.6,
      pricePerHour: 320,
      reviews: [],
    ),

    Caretaker(
      name: "Ramya",
      imageUrl: "https://example.com/emily.jpg",
      availability: "Weekends, 10 AM - 6 PM",
      bio: "Passionate pet lover and reliable caretaker for your furry friends.",
      rating: 4.2,
      pricePerHour: 250,
      reviews: [
        Review(reviewerName: "Maaran", reviewText: "Highly recommend!", rating: 5.0),
      ],
    ),
    Caretaker(
      name: "Suresh",
      imageUrl: "https://example.com/suresh.jpg",
      availability: "Daily, 7 AM - 2 PM",
      bio: "Energetic and responsible caretaker who loves outdoor walks.",
      rating: 4.8,
      pricePerHour: 350,
      reviews: [],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Available Caretakers"), backgroundColor: Colors.orange),
      body: ListView.builder(
        itemCount: caretakers.length,
        itemBuilder: (context, index) {
          final caretaker = caretakers[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(caretaker.imageUrl),
              ),
              title: Text(
                caretaker.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Availability: ${caretaker.availability}"),
                  Text("⭐ Rating: ${caretaker.rating} / 5.0"),
                  Text("💰 ₹${caretaker.pricePerHour} per hour"),
                ],
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CaretakerProfileScreen(caretaker: caretaker),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}


class CaretakerProfileScreen extends StatefulWidget {
  final Caretaker caretaker;

  CaretakerProfileScreen({required this.caretaker});

  @override
  _CaretakerProfileScreenState createState() => _CaretakerProfileScreenState();
}

class _CaretakerProfileScreenState extends State<CaretakerProfileScreen> {
  final TextEditingController _reviewController = TextEditingController();
  double _rating = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.caretaker.name),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(widget.caretaker.imageUrl),
            ),
            const SizedBox(height: 20),
            Text(widget.caretaker.name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text("Availability: ${widget.caretaker.availability}", style: TextStyle(fontSize: 16)),
            Text("₹${widget.caretaker.pricePerHour} per hour", style: TextStyle(fontSize: 16)),
            Text("Rating: ${widget.caretaker.rating} / 5.0", style: TextStyle(fontSize: 16)),
            const SizedBox(height: 10),
            Text("Bio: ${widget.caretaker.bio}", textAlign: TextAlign.center),
            const SizedBox(height: 20),
            Text("Reviews:", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Expanded(
              child: widget.caretaker.reviews.isEmpty
                  ? Text("No reviews yet.")
                  : ListView.builder(
                itemCount: widget.caretaker.reviews.length,
                itemBuilder: (context, index) {
                  final review = widget.caretaker.reviews[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 6),
                    child: ListTile(
                      title: Text(review.reviewerName),
                      subtitle: Text(review.reviewText),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(5, (i) {
                          return Icon(
                            i < review.rating ? Icons.star : Icons.star_border,
                            color: Colors.orange,
                            size: 18,
                          );
                        }),
                      ),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _showAddReviewDialog(context);
              },
              child: Text("Add Review"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentPage(
                      caretakerName: widget.caretaker.name,
                    ),
                  ),
                );
              },
              child: Text("Book Now"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
            ),
          ],
        ),
      ),
    );
  }

  void _showAddReviewDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Add Review"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _reviewController,
                decoration: InputDecoration(labelText: "Write your review"),
                maxLines: 3,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  return IconButton(
                    icon: Icon(
                      index < _rating ? Icons.star : Icons.star_border,
                      color: Colors.orange,
                    ),
                    onPressed: () {
                      setState(() {
                        _rating = index + 1.0;
                      });
                    },
                  );
                }),
              ),
            ],
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: Text("Cancel")),
            TextButton(
              onPressed: () {
                setState(() {
                  widget.caretaker.reviews.add(
                    Review(
                      reviewerName: "Current User",
                      reviewText: _reviewController.text,
                      rating: _rating,
                    ),
                  );
                });
                _reviewController.clear();
                Navigator.pop(context);
              },
              child: Text("Submit"),
            ),
          ],
        );
      },
    );
  }
}

// -------- Payment Page --------

class PaymentPage extends StatelessWidget {
  final String caretakerName;

  PaymentPage({required this.caretakerName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment"),
        backgroundColor: Colors.orange,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Booking for: $caretakerName",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: "Card Number",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: "Card Holder Name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: "Expiry Date",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.datetime,
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: "CVV",
                border: OutlineInputBorder(),
              ),
              obscureText: true,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 40),

            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => ConfirmationPage(caretakerName: caretakerName)),
                      (route) => route.isFirst,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: Text("Confirm Payment", style: TextStyle(fontSize: 18, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}

//-------------------------confirmation page---------------------

class ConfirmationPage extends StatelessWidget {
  final String caretakerName;

  ConfirmationPage({required this.caretakerName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Booking Confirmed"),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.check_circle, color: Colors.green, size: 100),
              const SizedBox(height: 20),
              Text(
                "Payment Successful!",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                "Your booking for $caretakerName is confirmed.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                child: Text("Back to Home"),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              ),
            ],
          ),
        ),
      ),
    );
  }
}