import 'package:flutter/material.dart';
import 'package:flutter_application_1/loginpage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(), // Mengatur tema aplikasi menjadi tema gelap
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    CalculatorPage(),
    BmiConversionPage(),
    CurrencyConversionPage(),
    DeveloperProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Application'),
        backgroundColor: Colors.black, // Mengatur warna latar belakang AppBar menjadi hitam
      ),
      body: _pages[_currentIndex],
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Nama Pengguna'),
              accountEmail: Text('email@example.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/user_avatar.jpg'),
              ),
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Keluar'),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder:
                        (context) => MyLogin() ) );
                  },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: Colors.transparent, // Mengatur warna latar belakang Bottom Navigation Bar menjadi hitam
        items: [
          BottomNavigationBarItem(
            icon: Icon(
                Icons.calculate,
                color: Colors.grey,
            ),
            label: 'Kalkulator',
            activeIcon: Icon(
              Icons.calculate,
              color: Colors.black, // Warna ikon saat aktif
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
                Icons.fitness_center,
                color: Colors.grey,
            ),
            label: 'Konversi BMI',
            activeIcon: Icon(
              Icons.fitness_center,
              color: Colors.black, // Warna ikon saat aktif
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
                Icons.attach_money,
                color: Colors.grey,
            ),
            label: 'Konversi Mata Uang',
            activeIcon: Icon(
              Icons.attach_money,
              color: Colors.black, // Warna ikon saat aktif
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
                Icons.person,
                color: Colors.grey,
            ),
            label: 'Profile Developer',
            activeIcon: Icon(
              Icons.person,
              color: Colors.black, // Warna ikon saat aktif
            ),
          ),
        ],
      ),
    );
  }
}

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String _output = "0";
  double num1 = 0;
  double num2 = 0;
  String operand = "";
  String currentInput = "";

  _buttonPressed(String buttonText) {
    if (buttonText == "C") {
      setState(() {
        _output = "0";
        num1 = 0;
        num2 = 0;
        operand = "";
        currentInput = "";
      });
    } else if (buttonText == "+" || buttonText == "-" || buttonText == "x" || buttonText == "/") {
      if (currentInput.isNotEmpty) {
        if (num1 == 0) {
          num1 = double.parse(currentInput);
        } else {
          num2 = double.parse(currentInput);
          if (operand == "+") {
            num1 += num2;
          } else if (operand == "-") {
            num1 -= num2;
          } else if (operand == "x") {
            num1 *= num2;
          } else if (operand == "/") {
            num1 /= num2;
          }
        }
        operand = buttonText;
        currentInput = "";
      }
    } else if (buttonText == "=") {
      if (currentInput.isNotEmpty) {
        num2 = double.parse(currentInput);
        if (operand == "+") {
          num1 += num2;
        } else if (operand == "-") {
          num1 -= num2;
        } else if (operand == "x") {
          num1 *= num2;
        } else if (operand == "/") {
          num1 /= num2;
        }
        currentInput = "";
      }
      setState(() {
        _output = num1.toString();
      });
    } else {
      currentInput += buttonText;
      setState(() {
        _output = currentInput;
      });
    }
  }


  Widget _buildButton(String buttonText, Color buttonColor) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => _buttonPressed(buttonText),
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 24.0,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          padding: EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalkulator'),
        backgroundColor: Colors.grey,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.bottomRight,
              child: Text(
                _output,
                style: TextStyle(
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Divider(
            color: Colors.white,
            height: 0.0,
          ),
          Row(
            children: [
              _buildButton("7", Colors.grey[800]!),
              _buildButton("8", Colors.grey[800]!),
              _buildButton("9", Colors.grey[800]!),
              _buildButton("/", Colors.orange),
            ],
          ),
          Row(
            children: [
              _buildButton("4", Colors.grey[800]!),
              _buildButton("5", Colors.grey[800]!),
              _buildButton("6", Colors.grey[800]!),
              _buildButton("x", Colors.orange),
            ],
          ),
          Row(
            children: [
              _buildButton("1", Colors.grey[800]!),
              _buildButton("2", Colors.grey[800]!),
              _buildButton("3", Colors.grey[800]!),
              _buildButton("-", Colors.orange),
            ],
          ),
          Row(
            children: [
              _buildButton("C", Colors.red),
              _buildButton("0", Colors.grey[800]!),
              _buildButton("=", Colors.orange),
              _buildButton("+", Colors.orange),
            ],
          ),
        ],
      ),
    );
  }
}
class BmiConversionPage extends StatefulWidget {
  @override
  _BmiConversionPageState createState() => _BmiConversionPageState();
}

class _BmiConversionPageState extends State<BmiConversionPage> {
  double weight = 70.0; // Berat badan awal (kg)
  double height = 170.0; // Tinggi badan awal (cm)
  double bmi = 0.0; // Nilai BMI yang dihitung

  void calculateBMI() {
    // Menghitung BMI dengan rumus: BMI = berat (kg) / (tinggi (m) * tinggi (m))
    double heightInMeters = height / 100; // Mengonversi tinggi dari cm ke meter
    double bmiResult = weight / (heightInMeters * heightInMeters);
    setState(() {
      bmi = bmiResult;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Konversi BMI',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Berat (kg): '),
                Container(
                  width: 80,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        weight = double.tryParse(value) ?? 0.0;
                      });
                    },
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Tinggi (cm): '),
                Container(
                  width: 80,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        height = double.tryParse(value) ?? 0.0;
                      });
                    },
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: calculateBMI,
              child: Text('Hitung BMI'),
            ),
            SizedBox(height: 20),
            Text('BMI: ${bmi.toStringAsFixed(2)}', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}

class CurrencyConversionPage extends StatefulWidget {
  @override
  _CurrencyConversionPageState createState() => _CurrencyConversionPageState();
}

class _CurrencyConversionPageState extends State<CurrencyConversionPage> {
  double amount = 1.0;
  String baseCurrency = 'USD';
  String targetCurrency = 'EUR';
  double result = 0.0;

  final Map<String, double> exchangeRates = {
    'USD/EUR': 0.85,
    'USD/JPY': 113.59,
    'USD/GBP': 0.73,
    'USD/CAD': 1.27,
    'EUR/USD': 1.18,
    'EUR/JPY': 133.95,
    'EUR/GBP': 0.86,
    'EUR/CAD': 1.48,
    'JPY/USD': 0.009,
    'JPY/EUR': 0.0075,
    'JPY/GBP': 0.0064,
    'JPY/CAD': 0.011,
    'GBP/USD': 1.37,
    'GBP/EUR': 1.16,
    'GBP/JPY': 157.14,
    'GBP/CAD': 1.74,
    'CAD/USD': 0.79,
    'CAD/EUR': 0.68,
    'CAD/JPY': 89.95,
    'CAD/GBP': 0.57,
  };

  void convertCurrency() {
    final exchangeRateKey = '$baseCurrency/$targetCurrency';
    if (exchangeRates.containsKey(exchangeRateKey)) {
      final rate = exchangeRates[exchangeRateKey];
      setState(() {
        result = amount * rate!;
      });
    } else {
      setState(() {
        result = 0.0; // Nilai tukar tidak tersedia
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Konversi Mata Uang',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Jumlah: '),
                Container(
                  width: 80,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        amount = double.tryParse(value) ?? 0.0;
                      });
                    },
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Dari: '),
                DropdownButton<String>(
                  value: baseCurrency,
                  items: ['USD', 'EUR', 'JPY', 'GBP', 'CAD']
                      .map<DropdownMenuItem<String>>(
                        (String value) => DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    ),
                  )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      baseCurrency = value!;
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Ke: '),
                DropdownButton<String>(
                  value: targetCurrency,
                  items: ['USD', 'EUR', 'JPY', 'GBP', 'CAD']
                      .map<DropdownMenuItem<String>>(
                        (String value) => DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    ),
                  )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      targetCurrency = value!;
                    });
                  },
                ),
              ],
            ),
            ElevatedButton(
              onPressed: convertCurrency,
              child: Text('Konversi'),
            ),
            SizedBox(height: 20),
            Text('Hasil: ${result.toStringAsFixed(2)} $targetCurrency', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}

class DeveloperProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('assets/developer_avatar.jpg'), // Ganti dengan path gambar pengembang Anda
            ),
            SizedBox(height: 20),
            Text(
              'Muhammad Nhafal Atha',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Deskripsi Pengembang',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
