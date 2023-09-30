import UIKit

class ViewController: UIViewController {
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        let imageSize = CGSize(width: 200, height: 200) // Set your preferred size

        
        // Set the image for the image view
        if let image = UIImage(named: "firebase") {
            imageView.image = resizeImage(image, targetSize: imageSize)
            
            
            
            let maskLayer = CAShapeLayer()
            maskLayer.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
            maskLayer.contents = image.cgImage
            
            
            
            imageView.backgroundColor = .red
            
            
            imageView.layer.mask = maskLayer
            
            
            view.addSubview(imageView)
            
            imageView.image = image
        }
        // Set constraints for the image view (optional)
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 200), // Set your preferred width
            imageView.heightAnchor.constraint(equalToConstant: 200), // Set your preferred height
        ])
    }
}

func resizeImage(_ image: UIImage, targetSize: CGSize) -> UIImage {
       let rect = CGRect(x: 0, y: 0, width: targetSize.width, height: targetSize.height)
       UIGraphicsBeginImageContextWithOptions(targetSize, false, 0.0)
       image.draw(in: rect)
       let newImage = UIGraphicsGetImageFromCurrentImageContext()
       UIGraphicsEndImageContext()
       return newImage ?? image
   }
