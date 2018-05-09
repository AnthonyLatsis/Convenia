import UIKit

enum ScaleMode {

    case width

    case height

    case widthAndHeight
}

extension UIBezierPath {

    func rotate(by angle: CGFloat) {

        return self.apply(CGAffineTransform.rotation(angle: angle))
    }

    func rotated(by value: CGFloat) -> UIBezierPath {

        self.rotate(by: value)

        return self
    }

    func translate(by value: CGFloat) {

        self.apply(CGAffineTransform.init(translation: value))
    }

    func translate(x: CGFloat, y: CGFloat) {

        self.apply(CGAffineTransform.translation(x: x, y: y))
    }

    func translate(x: CGFloat) {

        self.apply(CGAffineTransform.translation(x: x, y: 0))
    }

    func translate(y: CGFloat) {

        self.apply(CGAffineTransform.translation(x: 0, y: y))
    }

    func translated(by value: CGFloat) -> UIBezierPath {

        self.translate(by: value)
        return self
    }

    func translated(x: CGFloat, y: CGFloat) -> UIBezierPath {

        self.translate(x: x, y: y)
        return self
    }

    func translated(x: CGFloat) -> UIBezierPath {

        self.translate(x: x)
        return self
    }

    func translated(y: CGFloat) -> UIBezierPath {

        self.translate(y: y)
        return self
    }

    func scale(by value: CGFloat) {

        self.apply(CGAffineTransform.init(scale: value))
    }

    func scale(x: CGFloat, y: CGFloat) {

        self.apply(CGAffineTransform.scale(x: x, y: y))
    }

    func scale(x: CGFloat) {

        self.apply(CGAffineTransform.scale(x: x, y: 1))
    }

    func scale(y: CGFloat) {

        self.apply(CGAffineTransform.scale(x: 1, y: y))
    }

    func scaled(by value: CGFloat) -> UIBezierPath {

        self.scale(by: value)
        return self
    }

    func scaled(x: CGFloat, y: CGFloat) -> UIBezierPath {

        self.scale(x: x, y: y)
        return self
    }

    func scaled(x: CGFloat) -> UIBezierPath {

        self.scale(x: x)
        return self
    }

    func scaled(y: CGFloat) -> UIBezierPath {

        self.scale(y: y)
        return self
    }
}

extension UIBezierPath {

    func scale(to size: CGFloat, by enclosure: ScaleMode) {

        let scaleFactor: CGFloat = {

            switch enclosure {
            case .width:
                return size / self.bounds.width

            case .widthAndHeight:
                return size / max(self.bounds.width, self.bounds.height)

            case .height:
                return size / self.bounds.height
            }
        }()
        self.apply(CGAffineTransform.scale(x: scaleFactor, y: scaleFactor))
    }
}

extension UIBezierPath {

    class func rect(_ rect: CGRect, cornerRadius: CGFloat = 0) -> UIBezierPath {

        return UIBezierPath.init(roundedRect: rect, cornerRadius: cornerRadius)
    }

    class func rect(_ rect: CGRect, roundedCorners: UIRectCorner, radii: CGSize) -> UIBezierPath {

        return UIBezierPath.init(roundedRect: rect, byRoundingCorners: roundedCorners, cornerRadii: radii)
    }

    class func oval(in rect: CGRect) -> UIBezierPath {

        return UIBezierPath.init(ovalIn: rect)
    }

    class func arc(center: CGPoint, radius: CGFloat, from: CGFloat, to: CGFloat, clockwise: Bool) -> UIBezierPath {

        return UIBezierPath.init(arcCenter: center, radius: radius, startAngle: from, endAngle: to, clockwise: clockwise)
    }
 }
