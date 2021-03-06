# iOS control for showing price.

This control shows two prices next to each other: regular price and price before discount.
The latter price is crossed out.

<img src='https://raw.githubusercontent.com/marketplacer/price-view-ios/master/graphics/price-view-ios-screenshot.png' width='160' alt='Price control for iOS'>


## Usage

```
let priceView = TegPriceView()
priceView.showPrice('$199')
priceView.showPrice('$199', '$299') # second price is the price before discount

# Customize fonts (optional)
priceView.priceFont = UIFont.boldSystemFontOfSize(15)
priceView.priceBeforeDiscountFont = UIFont.systemFontOfSize(15)

# Customize colors (optional)
priceView.priceColor = UIColor.blackColor()
priceView.priceBeforeDiscountColor = TegColors.grayColor()

priceView.marginBetweenPrices = 5 # optional

```

One can also use TegPriceView with the storyboard.

## Home

[https://github.com/marketplacer/price-view-ios](https://github.com/marketplacer/price-view-ios)
