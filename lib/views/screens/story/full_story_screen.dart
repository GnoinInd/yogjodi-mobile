import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../common/constants/color_constants.dart';

class FullStoryScreen extends StatefulWidget {
  final int index;
  const FullStoryScreen({super.key, required this.index});

  @override
  State<FullStoryScreen> createState() => _FullStoryScreenState();
}

class _FullStoryScreenState extends State<FullStoryScreen> {
  late ScrollController _scrollController;
  bool isCollapsed = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.offset > 55 && !isCollapsed) {
        setState(() {
          isCollapsed = true;
        });
      } else if (_scrollController.offset <= 55 && isCollapsed) {
        setState(() {
          isCollapsed = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height / 2.0,
            floating: false,
            snap: false,
            pinned: true,
            backgroundColor: ColorConstants.jazzberryJam,
            foregroundColor: ColorConstants.theWhite,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: isCollapsed
                  ? Text(
                      "Groom ~ Bride",
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                        color: ColorConstants.theWhite,
                        shadows: const [
                          Shadow(
                            color: Colors.black45,
                            blurRadius: 15.0,
                          )
                        ],
                      ),
                      textAlign: TextAlign.center,
                    )
                  : const SizedBox.shrink(),
              background: Stack(
                children: [
                  Hero(
                    tag: widget.index,
                    child: CachedNetworkImage(
                      height: double.infinity,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      imageUrl:
                          'https://plus.unsplash.com/premium_photo-1682090789715-a1acbfe72404',
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 5.0,
                      ),
                      color: Colors.black26,
                      child: Text(
                        "Groom ~ Bride",
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 18.0,
                          color: ColorConstants.theWhite,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SliverFillRemaining(
            child: Padding(
              padding: EdgeInsets.only(left: 15.0, top: 15.0, right: 15.0),
              child: Text(
                "Aisha and Rohan’s journey began in the most unexpected way. "
                "Introduced by mutual friends at a casual gathering, they "
                "instantly connected over their shared love for travel, food, "
                "and adventure. What started as a simple conversation soon "
                "turned into late-night calls, weekend getaways, and endless laughter."
                "As their bond grew stronger, they realized they had found not just "
                "love but a deep-rooted friendship in each other. Despite their "
                "cultural differences, they embraced each other’s traditions, "
                "blending their worlds into one beautiful tapestry of love and "
                "understanding. Their families, initially hesitant, soon saw the "
                "genuine affection and respect they had for each other and gave "
                "their wholehearted blessings."
                "After a dreamy proposal at their favorite beach destination, Aisha "
                "and Rohan tied the knot in a vibrant and heartwarming ceremony "
                "surrounded by their loved ones. Their wedding was a perfect reflection "
                "of their journey – filled with love, laughter, and unforgettable memories."
                "Now, as they embark on this new chapter together, they continue to support "
                "and uplift each other through life’s challenges and joys. Their story is "
                "a testament to the power of love, understanding, and embracing differences."
                "Aisha and Rohan believe that true love is not just about finding someone who shares"
                " your interests but about finding someone who accepts you wholeheartedly and "
                "grows with you every step of the way. Their journey is just beginning, and "
                "they look forward to a lifetime of adventures together!",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 16.0,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
