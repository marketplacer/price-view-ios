# iOS control for showing price.

This control shows tow prices next to each other: regular price and price before discount.
The latter price is crossed out.

<img src='https://dl.dropboxusercontent.com/u/11143285/bikeexchange/github_images/price-view-ios-screenshot.png' width='160' alt='Price control for iOS'>

 
## Usage

```
let priceView = TegPriceView()
priceView.showPrice('$199')
priceView.showPrice('$199', '$299') # second price is the price before discount
```

One can also use TegPriceView with the storyboard.

## Repository home

[https://github.com/exchangegroup/price-view-ios](https://github.com/exchangegroup/price-view-ios)
