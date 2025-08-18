class TaksModels {
  final String id;
  final String category;
  final String title;
  bool isCompleted;

  TaksModels({
    required this.id,
    required this.category, 
    required this.title,
    this.isCompleted = false
    }

    );

  
}