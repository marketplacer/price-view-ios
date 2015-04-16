import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var priceView: TegPriceView!
  
  override func viewDidLoad() {
    super.viewDidLoad()

    priceView.backgroundColor = nil
  }


  @IBAction func onShowOnePriceTapped(sender: AnyObject) {
    priceView.show("$12.99")
  }

  @IBAction func onShowTwoPricesTapped(sender: AnyObject) {
    priceView.show("$1,200", priceBeforeDiscount: "$1.300")
  }
}

