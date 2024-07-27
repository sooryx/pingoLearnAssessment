import 'package:pingolearn/Constants/imports.dart';
import 'package:pingolearn/Widgets/commentcontainer.dart';

class Homescreen extends StatefulWidget {
  final RemoteConfigService remoteConfigService;

  const Homescreen({super.key, required this.remoteConfigService});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getData();
    });
    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox.shrink(),
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          "Comments",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold),
        ),
        actions: [
          InkWell(
            onTap: _showLogoutDialog,
            child: Container(
              padding: EdgeInsets.all(8.dg),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: Theme.of(context).colorScheme.surface,
              ),
              child: Row(
                children: [
                  Icon(Icons.logout_rounded, size: 25.sp,
                      color: Theme.of(context).colorScheme.error),
                  SizedBox(width: 5.w),
                  Text(
                    "Logout",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.red),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 10.w)
        ],
      ),
      body: Consumer<Homescreenprovider>(
        builder: (context, homescreenProvider, child) {
          return homescreenProvider.isLoading
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
              itemCount: homescreenProvider.commentsModel?.length,
              padding: EdgeInsets.all(10.dg),
              itemBuilder: (context, index) {
                final comments = homescreenProvider.commentsModel?[index];
                return Container(
                  margin: EdgeInsets.all(10.dg),
                  child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(18.r),
                    color: Colors.white,
                    child: CommentContainer(
                      name: comments?.name ?? "Name not available",
                      email: maskEmail(comments?.email ?? "Email not available"),
                      body: comments?.body ?? "Not Available",
                    )
                  ),
                );
              });
        },
      ),
    );
  }

  ///LogoutAlertBox
  Future<void> _showLogoutDialog() async {
    bool? shouldLogout = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.surface,
        actionsAlignment: MainAxisAlignment.center,
        titlePadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r)),
        title: Container(
          padding: EdgeInsets.all(10.dg),
          height: 60.h,
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r),
                bottomLeft: Radius.circular(6.r),
                bottomRight: Radius.circular(6.r),
              )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.warning_amber_rounded,
                  color: Colors.white, size: 28.sp),
              SizedBox(width: 8.w),
              Text(
                'Logout',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Logout',
                style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );

    if (shouldLogout ?? false) {
      await AuthService.userLogout(context: context);
    }
  }

  getData() async {
    final homescreenProvider =
    Provider.of<Homescreenprovider>(listen: false, context);
    await homescreenProvider.fetchComments();
  }

  String maskEmail(String email) {
    if (widget.remoteConfigService.showFullEmail) {
      return email;
    } else {
      final parts = email.split('@');
      final namePart = parts[0];
      final maskedNamePart = namePart.replaceRange(3, namePart.length, '*' * (namePart.length - 3));
      return '$maskedNamePart@${parts[1]}';
    }
  }
}
