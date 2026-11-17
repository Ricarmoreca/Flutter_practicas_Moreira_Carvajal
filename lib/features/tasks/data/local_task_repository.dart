import '../domain/task.dart';
import 'task_repository.dart';

class LocalTaskRepository implements TaskRepository {
  final List<Task> _tasks = [
    const Task(
      id: 1,
      title: 'Yogurt de durazno',
      description: 'Yogurt marca Toni sabor a durazno',
      priority: 'Media',
      isCompleted: false,
      userId: 1,
    ),
    const Task(
      id: 2,
      title: 'Comida de gato',
      description: 'Comida marca Whiskas sabor a pollo',
      priority: 'Alta',
      isCompleted: true,
      userId: 1,
    ),
    const Task(
      id: 3,
      title: 'Papel higienico',
      description: 'Papel higienico marca Elite, paquete de 12 rollos',
      priority: 'Alta',
      isCompleted: true,
      userId: 1,
    ),
    const Task(
      id: 4,
      title: 'Bebida energetica',
      description: 'Bebida marca Monster sabor a uva, paquete de 4',
      priority: 'Baja',
      isCompleted: false,
      userId: 1,
    ),
    const Task(
      id: 5,
      title: 'Lata de atún',
      description: 'Lata de atún marca La Campesina, 140g',
      priority: 'Media',
      isCompleted: true,
      userId: 1,
    ),
  ];

  @override
  List<Task> getTasks() => List.unmodifiable(_tasks);

  @override
  void save(Task task) {
    final index = _tasks.indexWhere((item) => item.id == task.id);
    if (index == -1) return;
    _tasks[index] = task;
  }
}
