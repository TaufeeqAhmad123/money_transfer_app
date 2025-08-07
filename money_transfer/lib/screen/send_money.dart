import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:money_transfer/Core/utils/color.dart';
import 'package:money_transfer/Core/utils/extansion.dart';
import 'package:money_transfer/Core/utils/image.dart';
import 'package:money_transfer/Core/utils/text_stl.dart';
import 'package:money_transfer/provider/search_provider.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SendMoney extends StatelessWidget {
  const SendMoney({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgClr,
      appBar: AppBar(
        title: Text('Send Money', style: titleStyle(context)),
        backgroundColor: kBgClr,
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: pagePadding,
        child: Column(
          children: [
            20.vSpace,
            TextField(
              style: subtitleStyle(context),
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SvgPicture.asset(searchIcon, color: Colors.grey),
                ),

                hintText: 'Search to send money',
                hintStyle: subtitleStyle(context).copyWith(color: Colors.white),

                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.grey, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: kPrimaryClr, width: 2),
                ),
              ),
              onChanged: (value) {
                final sendProvider = Provider.of<SearchProvider>(
                  context,
                  listen: false,
                );
                sendProvider.filterUsers(value);
              },
            ),
            20.vSpace,
            Expanded(
              child: Consumer<SearchProvider>(
                builder: (context, provider, _) => ListView.builder(
                  itemCount: provider.filteredList.length,
                  itemBuilder: (context, index) {
                    final user = provider.filteredList[index];
                    final userImg = provider.userimg[user];

                    return ListTile(
                      leading: CircleAvatar(
                        radius: 21.sp,
                        backgroundImage: NetworkImage(userImg ?? atm),
                      ),
                      title: Text("@$user", style: subtitleStyle(context)),
                      subtitle: Text(
                        user,
                        style: subtitleStyle(
                          context,
                        ).copyWith(color: Colors.white70, fontSize: 15.sp),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
