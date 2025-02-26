class ProjectUtils {
  final String image;
  final String title;
  final String subtitle;
  final String? webLink;
  final String? gitLink;

  ProjectUtils({
    required this.image,
    required this.title,
    required this.subtitle,
    this.webLink,
    this.gitLink,
  });
}

//HOBBY PRJECTS
List<ProjectUtils> hobbyProjects = [
  ProjectUtils(
    image: 'assets/projects/youtube.png',
    title: 'My YouTube Channel',
    subtitle: 'An informative channel with software and coding content',
    webLink: 'https://www.youtube.com/@ercanberkay',
  ),
  ProjectUtils(
    image: 'assets/projects/Book.png',
    title: 'My Flutter Learn Book',
    subtitle:
        'The book where I wrote down the information I gained while learning Flutter',
    webLink:
        'https://1drv.ms/w/c/8d0ba4afe9516015/ERVgUemvpAsggI3cIQAAAAABT9ZqhYYOJTgInhaW0M9Rbg?e=fn0Lrd',
  ),
  ProjectUtils(
    image: 'assets/projects/CarParking.jpg',
    title: 'Car Parking System',
    subtitle: 'A project I developed using Arduino',
  ),
];

//WORK PROJECTS
List<ProjectUtils> workProjects = [
  ProjectUtils(
    image: 'assets/projects/cargo_tracking_automation.png',
    title: 'Cargo Tracking Automation',
    subtitle: 'A simple scale automation system that we developed using C#',
    gitLink: 'https://github.com/berkayercan3/Kargo_Takip_Otomosyonu.git',
  ),
  ProjectUtils(
    image: 'assets/projects/otel.png',
    title: 'Hotel Reservation WebSite',
    subtitle: 'A small scale project I developed using dotNet',
    gitLink: 'https://github.com/berkayercan3/OTEL-WEB-UYGULAMASI-2.ADIM.git',
  ),
  ProjectUtils(
    image: 'assets/projects/github.png',
    title: 'My GitHub Profile',
    subtitle:
        'You can access all the projects I have done and am developing here.',
    gitLink: 'https://github.com/berkayercan3',
  ),
];
