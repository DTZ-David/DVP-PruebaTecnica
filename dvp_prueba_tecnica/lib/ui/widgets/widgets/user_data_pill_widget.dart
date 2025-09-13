import 'package:dvp_prueba_tecnica/ui/widgets/widgets/info_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../atomic_design/atoms/app_text.dart';
import '../../../atomic_design/protons/colors.dart';
import '../../../atomic_design/protons/spacing.dart';
import '../../../models/address_model.dart';
import '../../../models/user_model.dart';
import '../../../providers/users/global_user_provider.dart';
import 'pill_container_widget.dart';

class UserDataPill extends ConsumerStatefulWidget {
  const UserDataPill({super.key});

  @override
  ConsumerState<UserDataPill> createState() => _UserDataPillState();
}

class _UserDataPillState extends ConsumerState<UserDataPill>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  late AnimationController _animationController;
  late Animation<double> _expandAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _expandAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.5, 1.0, curve: Curves.easeIn),
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final hasUser = ref.watch(hasUserDataProvider);
    final userState = ref.watch(globalUserNotifierProvider);
    final fullName = ref.watch(userFullNameProvider);
    final userAge = ref.watch(userAgeProvider);

    if (!hasUser || userState.currentUser == null) {
      return const SizedBox.shrink();
    }

    final user = userState.currentUser!;

    return Positioned(
      top: MediaQuery.of(context).padding.top + 10,
      right: 16,
      child: Material(
        elevation: 8,
        borderRadius: BorderRadius.circular(AppSpacing.radiusXl),
        shadowColor: AppColors.primary500.withOpacity(0.3),
        child: PillContainer(
          isExpanded: _isExpanded,
          onTap: _toggleExpanded,
          child: _isExpanded
              ? _buildExpandedContent(user, fullName, userAge)
              : _buildCollapsedContent(fullName),
        ),
      ),
    );
  }

  Widget _buildCollapsedContent(String fullName) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: AppColors.white.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.person,
            color: AppColors.white,
            size: 20,
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        Flexible(
          child: AppText.body2(
            fullName,
            color: AppColors.white,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(width: AppSpacing.xs),
        const Icon(
          Icons.expand_more,
          color: AppColors.white,
          size: 20,
        ),
      ],
    );
  }

  Widget _buildExpandedContent(User user, String fullName, int userAge) {
    return SizeTransition(
      sizeFactor: _expandAnimation,
      axisAlignment: -1.0,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildHeader(fullName, userAge),
              const SizedBox(height: AppSpacing.md),
              _buildPersonalInfoSection(user),
              const SizedBox(height: AppSpacing.md),
              _buildAddressesSection(user.addresses),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(String fullName, int userAge) {
    return Row(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: AppColors.white.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.person,
            color: AppColors.white,
            size: 28,
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText.heading3(fullName, color: AppColors.white),
              AppText.caption(
                '$userAge años',
                color: AppColors.white.withOpacity(0.8),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: _toggleExpanded,
          icon: const Icon(Icons.close, color: AppColors.white, size: 20),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
        ),
      ],
    );
  }

  Widget _buildPersonalInfoSection(User user) {
    return InfoSection(
      title: 'Información Personal',
      children: [
        _buildInfoRow(
          'Fecha de Nacimiento',
          DateFormat('dd/MM/yyyy').format(user.birthDate),
          Icons.cake_outlined,
        ),
        if (user.createdAt != null)
          _buildInfoRow(
            'Registrado',
            _getTimeAgo(user.createdAt!),
            Icons.access_time_outlined,
          ),
      ],
    );
  }

  Widget _buildAddressesSection(List<Address> addresses) {
    return InfoSection(
      title: 'Direcciones (${addresses.length})',
      children: addresses.isEmpty
          ? [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(AppSpacing.sm),
                  child: AppText.caption(
                    'Sin direcciones agregadas',
                    color: AppColors.white.withOpacity(0.7),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ]
          : addresses.map(_buildAddressCard).toList(),
    );
  }

  Widget _buildInfoRow(String label, String value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
      child: Row(
        children: [
          Icon(
            icon,
            size: 16,
            color: AppColors.white.withOpacity(0.8),
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText.caption(
                  label,
                  color: AppColors.white.withOpacity(0.7),
                ),
                AppText.body3(value, color: AppColors.white),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddressCard(Address address) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.xs),
      padding: const EdgeInsets.all(AppSpacing.sm),
      decoration: BoxDecoration(
        color: AppColors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
        border: Border.all(
          color: AppColors.white.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.location_on_outlined,
            size: 16,
            color: AppColors.white.withOpacity(0.8),
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText.body3(
                  '${address.municipalityName}, ${address.departmentName}',
                  color: AppColors.white,
                ),
                AppText.caption(
                  address.countryName,
                  color: AppColors.white.withOpacity(0.7),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _getTimeAgo(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays > 0) {
      return 'Hace ${difference.inDays} días';
    } else if (difference.inHours > 0) {
      return 'Hace ${difference.inHours} horas';
    } else if (difference.inMinutes > 0) {
      return 'Hace ${difference.inMinutes} minutos';
    } else {
      return 'Hace un momento';
    }
  }
}
