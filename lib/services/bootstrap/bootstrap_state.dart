part of 'bootstrap_bloc.dart';

abstract class BootstrapState extends Equatable {
  const BootstrapState();

  @override
  List<Object> get props => [];
}

class BootstrapInitialState extends BootstrapState {
  final Map<String, dynamic> loadedStates;
  final bool isLoading;

  const BootstrapInitialState({
    this.loadedStates = const {},
    this.isLoading = true,
  });

  @override
  List<Object> get props => [
        loadedStates,
        isLoading,
      ];
}
