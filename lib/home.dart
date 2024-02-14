import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    Color lightTransparentBlue = Colors.blue.withOpacity(0.3);

    // Define a list of image URLs
    List<String> imageUrls = [
      'https://th.bing.com/th/id/OIP.iqZg0aC9myBQYxcsCcfmxgHaH_?w=163&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7',
      'https://th.bing.com/th/id/OIP.ef5e_eQ-3IZGBOm_UJDVEAAAAA?w=236&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7',
      'https://d2gg9evh47fn9z.cloudfront.net/1600px_COLOURBOX5512675.jpg',
      'https://th.bing.com/th/id/OIP.RZFYSxpTaoFm8XKynQVr-QHaHa?rs=1&pid=ImgDetMain',
    ];
    List<String> pictures = [
      'https://d36tnp772eyphs.cloudfront.net/blogs/1/2019/09/Taj-Mahal-1200x849.jpg',
      'https://th.bing.com/th/id/R.20ed9ad1b5dedcd848293191595b19fc?rik=yVGXA7e7shDJKA&riu=http%3a%2f%2f1.bp.blogspot.com%2f-pvtXgeafeIM%2fUQgNer8SWeI%2fAAAAAAAAjq8%2fUc8kd039seU%2fs1600%2feiffil-tower-eiffel-paris-france-park-cities-269184.jpg&ehk=JNzB3Rs1WjNHbZIGh4YwvyCK4mtgTK47gmTCzsvKCEA%3d&risl=&pid=ImgRaw&r=0',
      'https://i1.wp.com/handluggageonly.co.uk/wp-content/uploads/2015/05/Hand-Luggage-Only-7.jpg?fit=1600%2C1067&ssl=1',
      'https://4.bp.blogspot.com/_e90BZrQRlsA/TJsVAtZE7DI/AAAAAAAAAQQ/TltjYEae5WU/s1600/Tower_Bridge.jpg',
      'https://th.bing.com/th/id/R.9ba4f508bee3fcea5a3414b2bfcc3924?rik=Br7G3n8Ko4a66w&riu=http%3a%2f%2fstatic1.businessinsider.com%2fimage%2f55d34a70371d22ce178c0747%2fthe-10-best-tourist-attractions-in-the-world-according-to-lonely-planet.jpg&ehk=K4ZD8Po%2blS0NZeFZXytxXzbA6ysQOGK24ribUsyyoPg%3d&risl=&pid=ImgRaw&r=0',
      'https://th.bing.com/th/id/R.be45b55d73734a42e2c380e3169eaf44?rik=7c7GLipna8jLyA&riu=http%3a%2f%2fwww.inviul.com%2fwp-content%2fuploads%2f2017%2f10%2f10-travel-destinations.jpg&ehk=zqoRHP%2fKXKVHD0LUhgYLaTr55WyF1QJkVrWSN%2f7TZEE%3d&risl=&pid=ImgRaw&r=0&sres=1&sresct=1'
      
    ];
    List<String> discription = ['TajMSahal', 'Effel Tower', 'greece','London', 'Machupichu', 'USA',];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Explore',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'explore your world beauty',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.lightBlue,
                      ),
                    ),
                  ],
                ),
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://th.bing.com/th/id/OIP.knVqMW37aRYuhxId096m4wAAAA?pid=ImgDet&w=182&h=182&c=7&dpr=1.3'),
                )
              ],
            ),

            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.search), // Add search icon
                filled: true, // Add background color
                fillColor: lightTransparentBlue, // Set background color
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              for (String url in imageUrls) _buildSquareAvatar(url),
            ]),
            const SizedBox(
                height: 10), // Add spacing between avatars and text row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildHoverText('New', Colors.blue),
                _buildHoverText('Tour', Colors.blue),
                _buildHoverText('Asia', Colors.blue),
                _buildHoverText('Advanture', Colors.blue),
                _buildHoverText('All', Colors.blue),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 1 / 1,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                  ),
                  itemCount: pictures.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Image.network(
                            pictures[index],
                          ),
                        ),
                        Text(discription[index]),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSquareAvatar(String imageUrl) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          imageUrl,
          width: 60,
          height: 60,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildHoverText(String text, Color hoverColor) {
    return MouseRegion(
        child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
    ));
  }
}
