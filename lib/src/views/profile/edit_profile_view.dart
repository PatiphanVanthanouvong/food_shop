import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:s_shop_lao/src/views/authentication/auth_viewmodel.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  _EditProfileViewState createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final auth = context.read<AuthViewModel>();
    _nameController.text = auth.currentUser?.name ?? '';
    _phoneController.text = auth.currentUser?.phone ?? '';
    _addressController.text = auth.currentUser?.address ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final auth = context.read<AuthViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _phoneController,
              decoration: const InputDecoration(labelText: 'Phone'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _addressController,
              decoration: const InputDecoration(labelText: 'Address'),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () async {
                await auth.updateUserProfile(
                  _nameController.text,
                  _phoneController.text,
                  _addressController.text,
                );
                Navigator.pop(context);
              },
              child: const Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
