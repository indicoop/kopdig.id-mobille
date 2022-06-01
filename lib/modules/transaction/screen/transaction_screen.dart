import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 40.0, left: 8.0),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  icon: Image.asset('assets/Group.png'),
                  iconSize: 15,
                  onPressed: () {},
                ),
                SizedBox(width: 2),
                Text(
                  'Pilih Metode Pembayaran',
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Container(
              width: 374,
              height: 58,
              decoration: BoxDecoration(
                color: Color.fromARGB(26, 185, 185, 185),
                border: Border.all(
                  color: Color.fromARGB(26, 185, 185, 185),
                  width: 8,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  'VIRTUAL ACCOUNT (Proses Realtime)',
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Image.asset(
                  'assets/BRI.png',
                  width: 102,
                  height: 51,
                ),
                SizedBox(width: 30),
                Text(
                  'BRI Virtual Account',
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 80),
                IconButton(
                  icon: Image.asset('assets/NEXT.png'),
                  iconSize: 15,
                  onPressed: () {},
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Image.asset(
                    'assets/BNI.png',
                    width: 77,
                    height: 28,
                  ),
                ),
                SizedBox(width: 43),
                Text(
                  'BNI Virtual Account',
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 80),
                IconButton(
                  icon: Image.asset('assets/NEXT.png'),
                  iconSize: 15,
                  onPressed: () {},
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 13.0),
                  child: Image.asset(
                    'assets/CIMB.png',
                    width: 71,
                    height: 25,
                  ),
                ),
                SizedBox(width: 45),
                Text(
                  'CIMB Virtual Account',
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 67),
                IconButton(
                  icon: Image.asset('assets/NEXT.png'),
                  iconSize: 15,
                  onPressed: () {},
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 3.0),
                  child: Image.asset(
                    'assets/PERMATA.png',
                    width: 94,
                    height: 40,
                  ),
                ),
                SizedBox(width: 32),
                Text(
                  'Permata Virtual Account',
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 47),
                IconButton(
                  icon: Image.asset('assets/NEXT.png'),
                  iconSize: 15,
                  onPressed: () {},
                ),
              ],
            ),
            Container(
              width: 374,
              height: 58,
              decoration: BoxDecoration(
                color: Color.fromARGB(26, 185, 185, 185),
                border: Border.all(
                  color: Color.fromARGB(26, 185, 185, 185),
                  width: 8,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  'TRANSFER BANK (Proses 1-10 menit)',
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Image.asset(
                    'assets/BCA.png',
                    width: 75,
                    height: 34,
                  ),
                ),
                SizedBox(width: 45),
                Text(
                  'BCA',
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 190),
                IconButton(
                  icon: Image.asset('assets/NEXT.png'),
                  iconSize: 15,
                  onPressed: () {},
                ),
              ],
            ),
            Row(
              children: [
                Image.asset(
                  'assets/BRI.png',
                  width: 102,
                  height: 51,
                ),
                SizedBox(width: 30),
                Text(
                  'BRI',
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 195),
                IconButton(
                  icon: Image.asset('assets/NEXT.png'),
                  iconSize: 15,
                  onPressed: () {},
                ),
              ],
            ),
            Row(
              children: [
                Image.asset(
                  'assets/MANDIRI.png',
                  width: 91,
                  height: 29,
                ),
                SizedBox(width: 40),
                Text(
                  'MANDIRI',
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 155),
                IconButton(
                  icon: Image.asset('assets/NEXT.png'),
                  iconSize: 15,
                  onPressed: () {},
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Image.asset(
                    'assets/BNI.png',
                    width: 77,
                    height: 27,
                  ),
                ),
                SizedBox(width: 45),
                Text(
                  'BNI',
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 195),
                IconButton(
                  icon: Image.asset('assets/NEXT.png'),
                  iconSize: 15,
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}