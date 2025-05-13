import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class ProfileFormScreen extends StatefulWidget {
  const ProfileFormScreen({super.key});

  @override
  State<ProfileFormScreen> createState() => _ProfileFormScreenState();
}

class _ProfileFormScreenState extends State<ProfileFormScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isLoading = false;

  final List<String> _genderOptions = ['Homme', 'Femme', 'Autre'];
  final List<String> _goalOptions = [
    'Perte de poids',
    'Maintien',
    'Prise de masse',
    'Performance sportive',
    'Santé générale'
  ];
  final List<String> _dietOptions = [
    'Sans restriction',
    'Végétarien',
    'Végétalien',
    'Sans gluten',
    'Sans lactose',
    'Paléo',
    'Cétogène'
  ];
  final List<String> _equipmentOptions = [
    'Four',
    'Micro-ondes',
    'Mixeur',
    'Robot culinaire',
    'Cocotte-minute',
    'Grille-pain',
    'Plaque de cuisson'
  ];
  final List<String> _allergyOptions = [
    'Arachides',
    'Fruits de mer',
    'Lactose',
    'Gluten',
    'Œufs',
    'Noix',
    'Soja'
  ];

  void _onSubmit() {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      setState(() => _isLoading = true);
      
      // TODO: Sauvegarder les données du profil
      final data = _formKey.currentState!.value;
      print(data);
      
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Création du profil'),
        backgroundColor: theme.colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Informations personnelles',
                        style: theme.textTheme.titleLarge,
                      ),
                      const SizedBox(height: 16),
                      FormBuilderTextField(
                        name: 'name',
                        decoration: const InputDecoration(
                          labelText: 'Nom complet',
                          border: OutlineInputBorder(),
                        ),
                        validator: FormBuilderValidators.required(
                          errorText: 'Le nom est requis',
                        ),
                      ),
                      const SizedBox(height: 16),
                      FormBuilderTextField(
                        name: 'age',
                        decoration: const InputDecoration(
                          labelText: 'Âge',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                            errorText: 'L\'âge est requis',
                          ),
                          FormBuilderValidators.numeric(
                            errorText: 'L\'âge doit être un nombre',
                          ),
                          FormBuilderValidators.min(1,
                              errorText: 'L\'âge doit être supérieur à 0'),
                          FormBuilderValidators.max(120,
                              errorText: 'L\'âge doit être inférieur à 120'),
                        ]),
                      ),
                      const SizedBox(height: 16),
                      FormBuilderDropdown<String>(
                        name: 'gender',
                        decoration: const InputDecoration(
                          labelText: 'Sexe',
                          border: OutlineInputBorder(),
                        ),
                        items: _genderOptions
                            .map((gender) => DropdownMenuItem(
                                  value: gender,
                                  child: Text(gender),
                                ))
                            .toList(),
                        validator: FormBuilderValidators.required(
                          errorText: 'Le sexe est requis',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mesures',
                        style: theme.textTheme.titleLarge,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: FormBuilderTextField(
                              name: 'height',
                              decoration: const InputDecoration(
                                labelText: 'Taille (cm)',
                                border: OutlineInputBorder(),
                              ),
                              keyboardType: TextInputType.number,
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(
                                  errorText: 'La taille est requise',
                                ),
                                FormBuilderValidators.numeric(
                                  errorText: 'La taille doit être un nombre',
                                ),
                                FormBuilderValidators.min(100,
                                    errorText: 'La taille doit être supérieure à 100cm'),
                                FormBuilderValidators.max(250,
                                    errorText: 'La taille doit être inférieure à 250cm'),
                              ]),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: FormBuilderTextField(
                              name: 'weight',
                              decoration: const InputDecoration(
                                labelText: 'Poids (kg)',
                                border: OutlineInputBorder(),
                              ),
                              keyboardType: TextInputType.number,
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(
                                  errorText: 'Le poids est requis',
                                ),
                                FormBuilderValidators.numeric(
                                  errorText: 'Le poids doit être un nombre',
                                ),
                                FormBuilderValidators.min(30,
                                    errorText: 'Le poids doit être supérieur à 30kg'),
                                FormBuilderValidators.max(300,
                                    errorText: 'Le poids doit être inférieur à 300kg'),
                              ]),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Préférences',
                        style: theme.textTheme.titleLarge,
                      ),
                      const SizedBox(height: 16),
                      FormBuilderDropdown<String>(
                        name: 'goal',
                        decoration: const InputDecoration(
                          labelText: 'Objectif',
                          border: OutlineInputBorder(),
                        ),
                        items: _goalOptions
                            .map((goal) => DropdownMenuItem(
                                  value: goal,
                                  child: Text(goal),
                                ))
                            .toList(),
                        validator: FormBuilderValidators.required(
                          errorText: 'L\'objectif est requis',
                        ),
                      ),
                      const SizedBox(height: 16),
                      FormBuilderCheckboxGroup<String>(
                        name: 'allergies',
                        decoration: const InputDecoration(
                          labelText: 'Allergies',
                          border: OutlineInputBorder(),
                        ),
                        options: _allergyOptions
                            .map((allergy) => FormBuilderFieldOption(
                                  value: allergy,
                                  child: Text(allergy),
                                ))
                            .toList(),
                      ),
                      const SizedBox(height: 16),
                      FormBuilderDropdown<String>(
                        name: 'diet',
                        decoration: const InputDecoration(
                          labelText: 'Régime alimentaire',
                          border: OutlineInputBorder(),
                        ),
                        items: _dietOptions
                            .map((diet) => DropdownMenuItem(
                                  value: diet,
                                  child: Text(diet),
                                ))
                            .toList(),
                        validator: FormBuilderValidators.required(
                          errorText: 'Le régime alimentaire est requis',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Contraintes',
                        style: theme.textTheme.titleLarge,
                      ),
                      const SizedBox(height: 16),
                      FormBuilderCheckboxGroup<String>(
                        name: 'equipment',
                        decoration: const InputDecoration(
                          labelText: 'Équipements disponibles',
                          border: OutlineInputBorder(),
                        ),
                        options: _equipmentOptions
                            .map((equipment) => FormBuilderFieldOption(
                                  value: equipment,
                                  child: Text(equipment),
                                ))
                            .toList(),
                      ),
                      const SizedBox(height: 16),
                      FormBuilderTextField(
                        name: 'budget',
                        decoration: const InputDecoration(
                          labelText: 'Budget hebdomadaire (€)',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                            errorText: 'Le budget est requis',
                          ),
                          FormBuilderValidators.numeric(
                            errorText: 'Le budget doit être un nombre',
                          ),
                          FormBuilderValidators.min(0,
                              errorText: 'Le budget doit être positif'),
                        ]),
                      ),
                      const SizedBox(height: 16),
                      FormBuilderSlider(
                        name: 'prepTime',
                        min: 0,
                        max: 120,
                        divisions: 24,
                        initialValue: 30,
                        label: 'Temps de préparation max (minutes)',
                        activeColor: theme.colorScheme.primary,
                        decoration: const InputDecoration(
                          labelText: 'Temps de préparation maximum',
                          border: OutlineInputBorder(),
                        ),
                        validator: FormBuilderValidators.required(
                          errorText: 'Le temps de préparation est requis',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              if (_isLoading)
                const Center(child: CircularProgressIndicator())
              else
                ElevatedButton(
                  onPressed: _onSubmit,
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                  ),
                  child: const Text('Enregistrer le profil'),
                ),
            ],
          ),
        ),
      ),
    );
  }
} 