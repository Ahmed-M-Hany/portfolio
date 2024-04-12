
abstract class ProjectsData {
  static const List<Project> projects = const [
    Project(
      name: 'My Portfolio',
      description: 'My personal web portfolio that showcases my projects and skills.',
      image: 'assets/images/portfolioImage.png',
      videoID: '',
    ),
    //VCare app
    Project(
      name: 'VCare',
      description:
          'A mobile app that allows users to book appointments with doctors, view your history, and get prescriptions.',
      image: 'assets/images/projects_images/VCare.PNG',
      videoID: '9Q1fzDsdulk',
    ),
    Project(
      name: 'Book Store',
      description:
          'A book store app that allows users to browse books, add them to cart, and purchase them. The app also allows users to search for books by name.',
      image: 'assets/images/BookStore.jpg',
      videoID: '',
    ),
    //deraya education
    Project(
      name: 'Deraya Education',
      description:
          'A mobile app that allows students to access their courses and buy them.',
      image: 'assets/images/Deraya.jpg',
      videoID: 'nlcf5ZwMXng',
    ),
    //simple chat app with firebase
    Project(
      name: 'Chat App',
      description:
          'A chat app that allows users to chat with each other in real-time using Firebase.',
      image: 'assets/images/chat_app.jpeg',
      videoID: 'EoL9kQDW_NM',
    ),

    Project(
      name: 'Weather App',
      description:
          'A weather app that allows users to check the weather in their location.',
      image: 'assets/images/projects_images/clima.jpeg',
      videoID: 'dr1EnV-FaEA',
    ),
  ];

}
class Project {
  const Project({required this.name, required this.description, required this.image, required this.videoID});
  final String name;
  final String description;
  final String image;
  final String videoID;
}