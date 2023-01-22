import 'package:flutter/material.dart';

class ViewCustPage extends StatefulWidget {
  const ViewCustPage({super.key});

  @override
  _ViewCustPageState createState() => _ViewCustPageState();
}

class _ViewCustPageState extends State<ViewCustPage> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: PaginatedDataTable(
        header: const Text('Customers'),
        rowsPerPage: _rowsPerPage,
        availableRowsPerPage: const <int>[5, 10, 20],
        onRowsPerPageChanged: (int? value) {
          if (value != null) {
            setState(() => _rowsPerPage = value);
          }
        },
        columns: kTableColumns,
        source: CustomersDataSource(),
      ),
    );
  }
}

////// Columns in table.
const kTableColumns = <DataColumn>[
  DataColumn(label: Text('Delete')),
  DataColumn(
    label: Text('user ID'),
  ),
  DataColumn(
    label: Text('Full Name'),
  ),
  DataColumn(
    label: Text('Email'),
  ),
  DataColumn(
    label: Text('Phone Number'),
    numeric: true,
  ),
  DataColumn(
    label: Text('Place'),
  ),
  DataColumn(
    label: Text('District'),
  ),
  DataColumn(
    label: Text('Pin Code'),
    numeric: true,
  ),
  DataColumn(
    label: Text('Personal Address'),
  ),
];

////// Data class.
class Customers {
  Customers(this.userid, this.fullname, this.email, this.phone, this.place,
      this.district, this.pin, this.personaladdress);
  final int userid;
  final String fullname;
  final String email;
  final int phone;
  final String place;
  final String district;
  final int pin;
  final String personaladdress;
  bool selected = false;
}

////// Data source class for obtaining row data for PaginatedDataTable.
class CustomersDataSource extends DataTableSource {
  int _selectedCount = 0;
  final List<Customers> _customerss = <Customers>[
    Customers(
    2,
    "Jane Smith",
    "janesmith@example.com",
    5555550123,
    "Los Angeles",
    "CA",
    90001,
    "456 Park Avenue"
),

Customers(
    3,
    "Bob Johnson",
    "bobjohnson@example.com",
    5555550124,
    "Chicago",
    "IL",
    60601,
    "789 Michigan Avenue"
)
,
Customers(
    4,
    "Emily Davis",
    "emilydavis@example.com",
    5555550125,
    "Houston",
    "TX",
    77001,
    "321 Texas Street"
)
,
Customers(
    5,
    "Michael Brown",
    "michaelbrown@example.com",
    5555550126,
    "Phoenix",
    "AZ",
    85001,
    "654 Arizona Avenue"
)
,
Customers(
    6,
    "Sarah Miller",
    "sarahmiller@example.com",
    5555550127,
    "Philadelphia",
    "PA",
    19001,
    "987 Market Street"
)
,
Customers(
    7,
    "David Wilson",
    "davidwilson@example.com",
    5555550128,
    "San Antonio",
    "TX",
    78201,
    "246 Riverwalk Street"
)
,
Customers(
    8,
    "Jessica Moore",
    "jessicamoore@example.com",
    5555550129,
    "San Diego",
    "CA",
    92101,
    "369 Balboa Avenue"
)
,
Customers(
    9,
    "Matthew Taylor",
    "matthewtaylor@example.com",
    5555550130,
    "Dallas",
    "TX",
    75201,
    "159 Main Street"
)
,
Customers(
    10,
    "Jacob Anderson",
    "jacobanderson@example.com",
    5555550131,
    "San Jose",
    "CA",
    95111,
    "753 First Street"
)
,
Customers(
    11,
    "Nicholas Thomas",
    "nicholasthomas@example.com",
    5555550132,
    "Jacksonville",
    "FL",
    32201,
    "369 Riverside Avenue"
)
,
Customers(
    12,
    "Ryan Harris",
    "ryanharris@example.com",
    5555550133,
    "Indianapolis",
    "IN",
    46201,
    "159 Monument Circle"
)
,
Customers(
    13,
    "Susan Young",
    "susanyoung@example.com",
    5555550134,
    "Austin",
    "TX",
    73301,
    "753 Congress Avenue"
)
,
Customers(
    15,
    "Rohit Sharma",
    "rohit.sharma@example.com",
    5555550136,
    "Mumbai",
    "MH",
    400001,
    "1st Marine Street"
),
Customers(
    16,
    "Amitabh Bachchan",
    "amitabh.bachchan@example.com",
    5555550137,
    "Mumbai",
    "MH",
    400001,
    "Jalsa,B/2,Varca Road"
),
Customers(
    17,
    "Sachin Tendulkar",
    "sachin.tendulkar@example.com",
    5555550138,
    "Mumbai",
    "MH",
    400001,
    "Sachin Tendulkar Gymkhana"
),
Customers(
    18,
    "Virat Kohli",
    "virat.kohli@example.com",
    5555550139,
    "Delhi",
    "DL",
    110001,
    "7,Lodi Estate"
),
Customers(
    19,
    "Priyanka Chopra",
    "priyanka.chopra@example.com",
    5555550140,
    "Mumbai",
    "MH",
    400001,
    "B/3,Lokhandwala Complex"
),
Customers(
    20,
    "Deepika Padukone",
    "deepika.padukone@example.com",
    5555550141,
    "Mumbai",
    "MH",
    400001,
    "18,Ram Krishna Nagar"
),
Customers(
    21,
    "Ranveer Singh",
    "ranveer.singh@example.com",
    5555550142,
    "Mumbai",
    "MH",
    400001,
    "6,Green Acres"
),
Customers(
    22,
    "Shah Rukh Khan",
    "shahrukh.khan@example.com",
    5555550143,
    "Mumbai",
    "MH",
    400001,
    "Mannat,Land's End"
),
Customers(
    23,
    "Akshay Kumar",
    "akshay.kumar@example.com",
    5555550144,
    "Mumbai",
    "MH",
    400001,
    "Harbour View Apartment"
),
Customers(
    24,
    "Salman Khan",
    "salman.khan@example.com",
    5555550145,
    "Mumbai",
    "MH",
    400001,
    "Galaxy Apartment"
),

  ];

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= _customerss.length) return null;
    final Customers customers = _customerss[index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            this._customerss.removeAt(index);
          },
          color: Colors.red,
        )),
        DataCell(Text('${customers.userid}')),
        DataCell(Text(customers.fullname)),
        DataCell(Text(customers.email)),
        DataCell(Text('${customers.phone}')),
        DataCell(Text(customers.place)),
        DataCell(Text(customers.district)),
        DataCell(Text('${customers.pin}')),
        DataCell(Text(customers.personaladdress)),
      ],
    );
  }

  @override
  int get rowCount => _customerss.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}
