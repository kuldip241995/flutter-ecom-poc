import 'package:flutter/material.dart';
import 'package:flutter_poc/core/constants/color.dart';
import 'package:flutter_poc/core/constants/constants.dart';
import 'package:flutter_poc/core/constants/images.dart';
import 'package:flutter_poc/core/constants/string.dart';
import 'package:flutter_poc/features/presentation/widgets/custom_app_bar.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(headerTitle: Strings.myProfileText),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 45,
                    child: ClipOval(
                      child: Image.asset(
                        Images.imgDummyUser,
                        fit: BoxFit.cover,
                        width: 85,
                        height: 85,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  const Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Kuldip Prajapati', style: kProfileUserNameStyle),
                        SizedBox(height: 2.0),
                        Text(
                          'kuldipkumar.prajapati@borngroup.com',
                          style: kProfileUserEmailStyle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // ListView with multiple items
            ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                _buildListItem('My orders', 'Already have 12 orders'),
                _buildListItem('Shipping addresses', '3 Addresses'),
                _buildListItem('Payment methods', 'Visa  **34'),
                _buildListItem('Promocodes', 'You have special promocodes'),
                _buildListItem('My reviews', 'Reviews for 4 items'),
                _buildListItem('Settings', 'Notifications, password'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListItem(String title, String description) {
    return Column(
      children: [
        Card(
          color: Colors.transparent, // Transparent background
          elevation: 0, // No shadow
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0), // Rounded corners
          ),
          child: ListTile(
            title: Text(
              title,
              style: kProfileOptionTitleStyle,
            ),
            subtitle: Text(
              description,
              style: kProfileOptionDescriptionStyle,
            ),
            trailing: const SizedBox(
              width: 20.0, // Decreased width for trailing icon
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16.0,
                    color: AppColors.lightGrayBorder,
                  ), // Decreased size
                ],
              ),
            ),
            onTap: () {
              // Handle item tap
              print('Tapped on $title');
            },
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Divider(
            height: 1.0, // Decreased height of the separator
            thickness: 0.5, // Thickness of the separator
            color: AppColors.lightGrayBorder,
          ),
        ),
      ],
    );
  }
}
