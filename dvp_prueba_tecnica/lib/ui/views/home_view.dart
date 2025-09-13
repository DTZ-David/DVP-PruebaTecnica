import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../atomic_design/protons/spacing.dart';
import '../../models/user_model.dart';
import '../../providers/users/users_list_provider.dart';
import '../widgets/home/empty_state_widget.dart';
import '../widgets/home/error_state_widget.dart';
import '../widgets/home/expandable_user_card_widget.dart';
import '../widgets/home/stats_header_widget.dart';

class HomeView extends ConsumerStatefulWidget {
  final VoidCallback? onAddUser;
  final Function(User user)? onUserTap;
  final Function(String userId)? onDeleteUser;

  const HomeView({
    super.key,
    this.onAddUser,
    this.onUserTap,
    this.onDeleteUser,
  });

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  final Set<String> _expandedCards = <String>{};

  @override
  Widget build(BuildContext context) {
    final usersState = ref.watch(usersListNotifierProvider);

    if (!usersState.isInitialized && !usersState.isLoading) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(usersListNotifierProvider.notifier).loadUsers();
      });
    }

    return RefreshIndicator(
      onRefresh: () => ref.read(usersListNotifierProvider.notifier).loadUsers(),
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
              child: StatsHeader(userCount: usersState.users.length)),
          if (usersState.hasError)
            SliverToBoxAdapter(
              child: ErrorState(
                message: usersState.errorMessage ?? 'Error desconocido',
                onRetry: () =>
                    ref.read(usersListNotifierProvider.notifier).loadUsers(),
              ),
            ),
          if (usersState.isLoading)
            const SliverToBoxAdapter(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(AppSpacing.xl),
                  child: CircularProgressIndicator(),
                ),
              ),
            )
          else if (usersState.users.isEmpty)
            const SliverToBoxAdapter(child: EmptyState())
          else
            SliverPadding(
              padding: const EdgeInsets.all(AppSpacing.md),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final user = usersState.users[index];
                    final isExpanded = _expandedCards.contains(user.id);
                    return ExpandableUserCard(
                      user: user,
                      isExpanded: isExpanded,
                      onToggleExpanded: () => _toggleCard(user.id!),
                      onDeleteUser: () => widget.onDeleteUser?.call(user.id!),
                    );
                  },
                  childCount: usersState.users.length,
                ),
              ),
            ),
        ],
      ),
    );
  }

  void _toggleCard(String userId) {
    setState(() {
      if (_expandedCards.contains(userId)) {
        _expandedCards.remove(userId);
      } else {
        _expandedCards.add(userId);
      }
    });
  }
}
