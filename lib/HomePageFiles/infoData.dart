class Questions {
  List<String> questions = List();
  Questions(this.questions);
}
class SetTodaysMood{
  int todaysMood = 0;
  SetTodaysMood();

  int moodToday(){
    return todaysMood;
  }

  void increTodaysMood(){
    todaysMood++;
  }

  void decreTodaysMood(){
    todaysMood--;
  }

  void printTodaysMood(){
    print(todaysMood);
  }


}