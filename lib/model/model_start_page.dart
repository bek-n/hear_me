class threeItems {
  final String image, text;

  threeItems({required this.image,required this.text});
}


 List<threeItems> items = [
    threeItems(image: 'assets/images/fa.png', text: 'Continue with Facebook'),
    threeItems(image: 'assets/images/goog.png', text: 'Continue with Google'),
    threeItems(
        image: 'assets/images/appleblack.png', text: 'Continue with Apple'),
  ];