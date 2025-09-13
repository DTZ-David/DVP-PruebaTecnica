import 'package:dvp_prueba_tecnica/atomic_design/molecules/app_dropdown.dart';
import 'package:flutter/material.dart';
import '../../../atomic_design/protons/spacing.dart';
import '../../../models/address_form_models.dart';
import '../../../providers/address/address_form_provider.dart';

class AddressDropdownsSection extends StatelessWidget {
  final AddressFormState addressState;
  final AddressFormNotifier addressNotifier;

  const AddressDropdownsSection({
    super.key,
    required this.addressState,
    required this.addressNotifier,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildCountryDropdown(),
        const SizedBox(height: AppSpacing.md),
        _buildDepartmentDropdown(),
        const SizedBox(height: AppSpacing.md),
        _buildMunicipalityDropdown(),
      ],
    );
  }

  Widget _buildCountryDropdown() {
    return AppDropdown<Country>(
      labelText: 'País',
      hintText: 'Selecciona un país',
      selectedValue: addressState.countries
          .where((c) => c.id == addressState.selectedCountryId)
          .firstOrNull,
      items: addressState.countries,
      getItemLabel: (country) => country.name,
      getItemValue: (country) => country.id,
      onChanged: (country) {
        if (country != null) {
          addressNotifier.selectCountry(country.id, country.name);
        }
      },
      isLoading: addressState.isLoadingCountries,
      errorText: addressState.countryError,
    );
  }

  Widget _buildDepartmentDropdown() {
    return AppDropdown<Department>(
      labelText: 'Departamento',
      hintText: addressState.selectedCountryId == null
          ? 'Primero selecciona un país'
          : 'Selecciona un departamento',
      selectedValue: addressState.departments
          .where((d) => d.id == addressState.selectedDepartmentId)
          .firstOrNull,
      items: addressState.departments,
      getItemLabel: (department) => department.name,
      getItemValue: (department) => department.id,
      onChanged: (department) {
        if (department != null) {
          addressNotifier.selectDepartment(department.id, department.name);
        }
      },
      isLoading: addressState.isLoadingDepartments,
      isEnabled: addressState.selectedCountryId != null,
      errorText: addressState.departmentError,
    );
  }

  Widget _buildMunicipalityDropdown() {
    return AppDropdown<Municipality>(
      labelText: 'Municipio',
      hintText: addressState.selectedDepartmentId == null
          ? 'Primero selecciona un departamento'
          : 'Selecciona un municipio',
      selectedValue: addressState.municipalities
          .where((m) => m.id == addressState.selectedMunicipalityId)
          .firstOrNull,
      items: addressState.municipalities,
      getItemLabel: (municipality) => municipality.name,
      getItemValue: (municipality) => municipality.id,
      onChanged: (municipality) {
        if (municipality != null) {
          addressNotifier.selectMunicipality(
              municipality.id, municipality.name);
        }
      },
      isLoading: addressState.isLoadingMunicipalities,
      isEnabled: addressState.selectedDepartmentId != null,
      errorText: addressState.municipalityError,
    );
  }
}
