import UIKit

struct ResourceSection {
    let title: String
    let items: [ResourceItem]
}

struct ResourceItem {
    let title: String
    let backgroundColor: UIColor
    let linkURL: URL?
    let imageName: String?
   // let imageName: UIImage
}
