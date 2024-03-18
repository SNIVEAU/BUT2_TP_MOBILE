// class Task {
//   final String title;
//   final int difficulty;
//   final int nbhours;
//   final String description;
//   final List<String> tags;

//   Task({
//     required this.title,
//     required this.difficulty,
//     required this.nbhours,
//     required this.description,
//     required this.tags,
//   });

//   factory Task.fromJson(Map<String, dynamic> json) {
//     return Task(
//       title: json['title'],
//       difficulty: json['difficulty'],
//       nbhours: json['nbhours'],
//       description: json['description'],
//       tags: List<String>.from(json['tags']),
//     );
//   }
// }
class Task {
    int id;
    String title;
    List<String> tags;
    int nbhours;
    int difficulty;
    String description;
    Task({required this.id,required this.title,required this.tags,required
    this.nbhours,required this.difficulty,required this.description});

    static List<Task> generateTask(int i){
        List<Task> tasks=[];
        for(int n=0;n<i;n++){
            tasks.add(Task(id: n,   title: "title $n", tags: ['tag $n','tag${n+1}'], nbhours: n, difficulty: n, description: '$n'));
        }
        return tasks;
    }
}