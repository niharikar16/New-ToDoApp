class ImageModel{
  final String title;
  final String content;
  final String imageName;
  ImageModel(this.title, this.content, this.imageName);
}

List<ImageModel> dataList = [
  ImageModel("Welcome","Plan your tomorrow", "assets/imageOne.png"),
  ImageModel("Work Happens","Get Notified when Work Happens", "assets/imageTwo.png"),
  ImageModel("Tasks and Assign","Tasks and Assign them to Colleague", "assets/imageThree.png"),
];