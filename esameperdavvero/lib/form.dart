import 'package:flutter/material.dart';
import 'package:esame/input.dart';
import 'package:reactive_forms/reactive_forms.dart';

class AddFormDialog extends StatefulWidget {
  const AddFormDialog({super.key});

  @override
  State<AddFormDialog> createState() => _AddFormDialogState();
}

class _AddFormDialogState extends State<AddFormDialog> {
  late final FormGroup _form;

  @override
  void initState() {
    super.initState();
    _form = FormGroup({
      'title': FormControl<String>(
        validators: [RequiredValidator(), MinLengthValidator(2)],
      ),
      'comment': FormControl<String>( 
        // qua non va nessuna validazione perchè il campo può restare vuoto
      ),
      'ratingfields': FormControl<int>(
        validators: [RequiredValidator(), Validators.min( 1), Validators.max(5)],
      ),
    });
  }

  @override
  void dispose() {
    _form.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: ReactiveForm(
          formGroup: _form,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Nuova recensione!", style: theme.textTheme.headlineSmall),
              const SizedBox(height: 40),
              ReactiveTextField(
                formControlName: "title",
                decoration: const InputDecoration(hintText: "Aggiungi il nome del ristorante"),
              ),
              const SizedBox(height: 20),
              ReactiveTextField(
                formControlName: "comment",
                decoration: const InputDecoration(hintText: "Aggiungi un commento (opzionale)"),
              ),
              const SizedBox(height: 20),
              ReactiveTextField(
                formControlName: "ratingfields",
                decoration: const InputDecoration(hintText: "Aggiungi una valutazione da 1 a 5"),
               valueAccessor: IntValueAccessor()
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submit,
                child: const Text("Aggiungi recensione!"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submit() {

    if (!_form.valid) return;

    final todo = Rewiew(
      title: _form.control("title").value,
      comment: _form.control("comment").value,
      ratingfields: _form.control("ratingfields").value,
    );

    Navigator.pop(context, todo);
  }
}