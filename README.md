# iOS control for showing price.

This control shows tow prices next to each other: regular price and price before discount.
The latter price is crossed out.

## Usage

```
let priceView = TegPriceView()
priceView.showPrice('$199')
priceView.showPrice('$199', '$299') # second price is the price before discount
```

One can also use TegPriceView with the storyboard.