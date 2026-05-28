import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/models/user_profile.dart';
import '../state/app_state.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import '../widgets/primary_button.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _nameController = TextEditingController();
  Gender _gender = Gender.masculino;
  double _age = 22;
  Country _country = Country.brasil;

  @override
  void initState() {
    super.initState();
    _nameController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  bool get _isNameValid => _nameController.text.trim().length >= 2;

  void _onEnter() {
    final profile = UserProfile(
      name: _nameController.text.trim(),
      gender: _gender,
      age: _age.round(),
      country: _country,
    );
    context.read<AppState>().setUser(profile);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute<void>(builder: (_) => const HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.spaceBlack,
      appBar: AppBar(
        backgroundColor: AppColors.spaceBlack,
        elevation: 0,
        scrolledUnderElevation: 0,
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 8, 24, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'IDENTIFICAÇÃO',
                style: AppTypography.labelLarge().copyWith(
                  color: AppColors.marsOrange,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'ANTES DE COMEÇAR',
                style: AppTypography.displayMedium(),
              ),
              const SizedBox(height: 12),
              Text(
                'Conte um pouco sobre você antes de explorar o catálogo.',
                style: AppTypography.bodyLarge().copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 32),
              const _FieldLabel(text: 'NOME'),
              const SizedBox(height: 8),
              TextField(
                controller: _nameController,
                cursorColor: AppColors.marsOrange,
                style: AppTypography.bodyLarge(),
                decoration: InputDecoration(
                  hintText: 'Como você prefere ser chamado',
                  hintStyle: AppTypography.bodyMedium().copyWith(
                    color: AppColors.textTertiary,
                  ),
                  filled: true,
                  fillColor: AppColors.spaceSurfaceElevated,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(
                      color: AppColors.spaceBorder,
                      width: 1,
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(
                      color: AppColors.spaceBorder,
                      width: 1,
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(
                      color: AppColors.marsOrange,
                      width: 1,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const _FieldLabel(text: 'GÊNERO'),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: _SelectableChip(
                      label: Gender.masculino.label.toUpperCase(),
                      isSelected: _gender == Gender.masculino,
                      onTap: () =>
                          setState(() => _gender = Gender.masculino),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _SelectableChip(
                      label: Gender.feminino.label.toUpperCase(),
                      isSelected: _gender == Gender.feminino,
                      onTap: () =>
                          setState(() => _gender = Gender.feminino),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _SelectableChip(
                      label: Gender.outro.label.toUpperCase(),
                      isSelected: _gender == Gender.outro,
                      onTap: () => setState(() => _gender = Gender.outro),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Expanded(child: _FieldLabel(text: 'IDADE')),
                  Text(
                    _age.round().toString(),
                    style: AppTypography.displayMedium().copyWith(
                      color: AppColors.marsOrange,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: AppColors.marsOrange,
                  inactiveTrackColor: AppColors.spaceBorder,
                  thumbColor: AppColors.marsOrange,
                  overlayColor: const Color(0x33FF6B1A),
                  trackHeight: 2,
                  thumbShape: const RoundSliderThumbShape(
                    enabledThumbRadius: 8,
                  ),
                ),
                child: Slider(
                  value: _age,
                  min: 14,
                  max: 80,
                  divisions: 66,
                  onChanged: (value) => setState(() => _age = value),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '14',
                    style: AppTypography.labelSmall().copyWith(
                      color: AppColors.textTertiary,
                    ),
                  ),
                  Text(
                    '80',
                    style: AppTypography.labelSmall().copyWith(
                      color: AppColors.textTertiary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const _FieldLabel(text: 'PAÍS'),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.spaceSurfaceElevated,
                  border: Border.all(
                    color: AppColors.spaceBorder,
                    width: 1,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<Country>(
                    value: _country,
                    isExpanded: true,
                    dropdownColor: AppColors.spaceSurfaceElevated,
                    iconEnabledColor: AppColors.textSecondary,
                    style: AppTypography.bodyLarge(),
                    items: Country.values
                        .map(
                          (c) => DropdownMenuItem<Country>(
                            value: c,
                            child: Text(
                              c.label,
                              style: AppTypography.bodyLarge(),
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      if (value != null) {
                        setState(() => _country = value);
                      }
                    },
                  ),
                ),
              ),
              const SizedBox(height: 40),
              PrimaryButton(
                label: 'ENTRAR',
                onPressed: _isNameValid ? _onEnter : null,
              ),
              if (!_isNameValid)
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Text(
                    'Digite pelo menos 2 caracteres no nome.',
                    textAlign: TextAlign.center,
                    style: AppTypography.labelSmall().copyWith(
                      color: AppColors.textTertiary,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FieldLabel extends StatelessWidget {
  final String text;
  const _FieldLabel({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTypography.labelSmall().copyWith(
        color: AppColors.textTertiary,
      ),
    );
  }
}

class _SelectableChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _SelectableChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.marsOrange : Colors.transparent,
          border: Border.all(
            color: isSelected
                ? AppColors.marsOrange
                : AppColors.spaceBorder,
            width: 1,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(4)),
        ),
        child: Text(
          label,
          style: AppTypography.labelLarge().copyWith(
            color: isSelected
                ? AppColors.spaceBlack
                : AppColors.textSecondary,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
