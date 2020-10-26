//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport
import Neumann

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        let label = UILabel()
        label.frame = CGRect(x: 150, y: 100, width: 200, height: 20)
        label.text = "Hello World!"
        label.textColor = .black
        view.addSubview(label)

        // Star_1

        let icon = UIImage(icon: UIImage(named: "logo_star"),
                           padding: 5.0,
                           color: .black,
                           borderColor: .red,
                           borderWidth: 1.0,
                           cornerRadius: 4.0,
                           size: CGSize(width: 40.0, height: 40.0))
        let image = UIImageView(image: icon)
        image.frame = CGRect(x: 150.0, y: 150.0, width: 40.0, height: 40.0)
        view.addSubview(image)

        // Star_2

        let icon2 = UIImage(icon: UIImage(named: "logo_star"),
                           padding: 10.0,
                           color: .black,
                           borderColor: .red,
                           borderWidth: 1.0,
                           cornerRadius: 20.0,
                           size: CGSize(width: 40.0, height: 40.0))
        let image2 = UIImageView(image: icon2)
        image2.frame = CGRect(x: 200.0, y: 150.0, width: 40.0, height: 40.0)
        view.addSubview(image2)

        // Label_Image_1

        let text = UIImage(text: "DD", color: .black)
        let icon3 = UIImage(icon: text,
                            color: .clear,
                            borderColor: .black,
                            borderWidth: 1.0,
                            cornerRadius: 20.0,
                            size: CGSize(width: 40.0, height: 40.0))
        let image3 = UIImageView(image: icon3)
        image3.frame = CGRect(x: 150.0, y: 200.0, width: 40.0, height: 40.0)
        view.addSubview(image3)

        // Label_Image_2

        let text2 = UIImage(text: "DD", color: .black)
        let icon4 = UIImage(icon: text2,
                            padding: 10.0,
                            color: .red,
                            cornerRadius: 4.0,
                            size: CGSize(width: 40.0, height: 40.0))
        let image4 = UIImageView(image: icon4)
        image4.frame = CGRect(x: 200.0, y: 200.0, width: 40.0, height: 40.0)
        view.addSubview(image4)

        self.view = view
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
