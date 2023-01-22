import 'package:flutter/material.dart';

class ViewSellersPage extends StatefulWidget {
  const ViewSellersPage({super.key});

  @override
  _ViewSellersPageState createState() => _ViewSellersPageState();
}

class _ViewSellersPageState extends State<ViewSellersPage> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: PaginatedDataTable(
        header: const Text('Sellers'),
        rowsPerPage: _rowsPerPage,
        availableRowsPerPage: const <int>[5, 10, 20],
        onRowsPerPageChanged: (int? value) {
          if (value != null) {
            setState(() => _rowsPerPage = value);
          }
        },
        columns: kTableColumns,
        source: SellersDataSource(),
      ),
    );
  }
}

////// Columns in table.
const kTableColumns = <DataColumn>[
  DataColumn(label: Text('Delete')),
  DataColumn(
    label: Text('Seller ID'),
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
    label: Text('Pin COde'),
    numeric: true,
  ),
  DataColumn(
    label: Text('Personal Address'),
  ),
  DataColumn(
    label: Text('Company Name'),
  ),
  DataColumn(
    label: Text('Company Address'),
  )
];

////// Data class.
class Sellers {
  Sellers(
      this.userid,
      this.fullname,
      this.email,
      this.phone,
      this.place,
      this.district,
      this.pin,
      this.personaladdress,
      this.companyname,
      this.companyaddress);
  final int userid;
  final String fullname;
  final String email;
  final int phone;
  final String place;
  final String district;
  final int pin;
  final String personaladdress;
  final String companyname;
  final String companyaddress;
  bool selected = false;
}

////// Data source class for obtaining row data for PaginatedDataTable.
class SellersDataSource extends DataTableSource {
  int _selectedCount = 0;
  final List<Sellers> _sellerss = <Sellers>[
    Sellers(1, "John Doe1", "example@email.com", 1234567890, "place",
        "district", 123456, "personaladdress", "companyname", "companyaddress"),
    Sellers(2, "Jane Smith", "janesmith@email.com", 9876543210, "New York",
        "Manhattan", 10001, "123 Main St", "Acme Inc", "456 Park Ave"),
    Sellers(4, "Emily Davis", "emilydavis@email.com", 2222222222, "Chicago",
        "Loop", 60601, "789 Oak St", "ABC Inc", "321 Michigan Ave"),
    Sellers(5, "Michael Brown", "michaelbrown@email.com", 3333333333, "Houston",
        "Downtown", 77001, "987 Pine St", "Def Corp", "654 Travis St"),
    Sellers(6, "Sarah Miller", "sarahmiller@email.com", 4444444444, "Phoenix",
        "Downtown", 85001, "654 Cedar St", "Ghi Inc", "987 Van Buren St"),
    Sellers(
        7,
        "David Wilson",
        "davidwilson@email.com",
        5555555555,
        "Philadelphia",
        "Center City",
        19101,
        "321 Spruce St",
        "Jkl Corp",
        "1234 Market St"),
    Sellers(
        8,
        "Jessica Moore",
        "jessicamoore@email.com",
        6666666666,
        "San Antonio",
        "Downtown",
        78205,
        "135 Oak St",
        "Mno Inc",
        "567 N St Mary's St"),
    Sellers(
        9,
        "Matthew Taylor",
        "matthewtaylor@email.com",
        7777777777,
        "San Diego",
        "Downtown",
        92101,
        "246 Pine St",
        "Pqr Corp",
        "369 State St"),
    Sellers(
        10,
        "Jacob Hernandez",
        "jacobhernandez@email.com",
        8888888888,
        "Dallas",
        "Downtown",
        75201,
        "159 Elm St",
        "Stu Inc",
        "753 Commerce St"),
    Sellers(
        11,
        "Nicholas Anderson",
        "nicholasanderson@email.com",
        9999999999,
        "San Jose",
        "Downtown",
        95101,
        "753 Oak St",
        "Vwx Corp",
        "369 W Santa Clara St"),
    Sellers(12, "Amanda Thomas", "amandathomas@email.com", 1234567890, "Austin",
        "Downtown", 78701, "456 Elm St", "Yz Inc", "789 Congress Ave"),
    Sellers(
        13,
        "Brian White",
        "brianwhite@email.com",
        2345678901,
        "Jacksonville",
        "Downtown",
        32201,
        "987 Pine St",
        "Abc Corp",
        "654 Bay St"),
    Sellers(
        14,
        "Kevin Harris",
        "kevinharris@email.com",
        3456789012,
        "Fort Worth",
        "Downtown",
        76102,
        "789 Oak St",
        "Def Inc",
        "321 Main St"),
    Sellers(
        15,
        "Joshua Martin",
        "joshuamartin@email.com",
        4567890123,
        "Columbus",
        "Downtown",
        43215,
        "654 Cedar St",
        "Ghi Corp",
        "987 High St"),
    Sellers(
        16,
        "Rachel Thompson",
        "rachelthompson@email.com",
        5678901234,
        "Charlotte",
        "Downtown",
        28202,
        "321 Spruce St",
        "Jkl Inc",
        "1234 Tryon St"),
    Sellers(17, "Kevin Garcia", "kevingarcia@email.com", 6789012345, "Detroit",
        "Downtown", 48201, "135 Oak St", "Mno Corp", "567 Woodward Ave"),
    Sellers(
        18,
        "Eric Martinez",
        "ericmartinez@email.com",
        7890123456,
        "El Paso",
        "Downtown",
        79901,
        "246 Pine St",
        "Pqr Inc",
        "369 Montana Ave"),
    Sellers(19, "Stephanie Robinson", "stephanierobinson@email.com", 8901234567,
        "Memphis", "Downtown", 37501, "159 Elm St", "Stu Corp", "753 Beale St"),
    Sellers(20, "Jacob Clark", "jacobclark@email.com", 9012345678, "Boston",
        "Downtown", 02108, "753 Oak St", "Vwx Inc", "369 State St"),
    Sellers(
        21,
        "Nicholas Rodriguez",
        "nicholasrodriguez@email.com",
        0123456789,
        "Nashville",
        "Downtown",
        37201,
        "369 Elm St",
        "Yz Corp",
        "789 Broadway"),
  ];

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= _sellerss.length) return null;
    final Sellers sellers = _sellerss[index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(IconButton(
          icon: Icon(Icons.delete),
          onPressed:() {
            this._sellerss.removeAt(index);
          },
          color: Colors.red,
        )),
        DataCell(Text('${sellers.userid}')),
        DataCell(Text(sellers.fullname)),
        DataCell(Text(sellers.email)),
        DataCell(Text('${sellers.phone}')),
        DataCell(Text(sellers.place)),
        DataCell(Text(sellers.district)),
        DataCell(Text('${sellers.pin}')),
        DataCell(Text(sellers.personaladdress)),
        DataCell(Text(sellers.companyname)),
        DataCell(Text(sellers.companyaddress)),
      ],
    );
  }

  @override
  int get rowCount => _sellerss.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}
