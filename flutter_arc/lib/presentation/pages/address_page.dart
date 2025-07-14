import 'package:flutter/material.dart';
import 'package:flutter_arc/presentation/providers/address_provider.dart';
import 'package:flutter_arc/presentation/widgets/address_card.dart';
import 'package:flutter_arc/presentation/widgets/loading_overlay.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddressPage extends ConsumerWidget {
  const AddressPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addressAsync = ref.watch(addressProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Users")),
      body: Stack(
        children: [
          addressAsync.when(
            data: (users) => ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) =>
                  AddressCard(address: users[index]),
            ),
            loading: () {
              ref.read(loadingProvider.notifier).state = true;
              return const SizedBox();
            }, // render nothing underneath
            error: (err, _) => Center(child: Text('Error: $err')),
          ),
        ],
      ),
    );
  }
}
