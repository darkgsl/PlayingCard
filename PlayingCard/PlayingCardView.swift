import UIKit

class PlayingCardView: UIView {
  var rank: Int = 5 {
    didSet {
      setNeedsDisplay()
      setNeedsLayout()
    }
  }
  var suit: String = "♥️" {
    didSet {
      setNeedsDisplay()
      setNeedsLayout()
    }
  }
  var isFAceUp: Bool = true {
    didSet {
      setNeedsDisplay()
      setNeedsLayout()
    }
  }
  
  private var cornerString: NSAttributedString {
    centerAttibutedString("\(rankString)\n\(suit)" , fontSize: cornerFontSize )
    
  }
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    contentMode = .redraw
    
    backgroundColor = .clear
  }
    
    private func centerAttibutedString(_ string: String, fontSize: CGFloat) -> NSAttributedString {
      var font = UIFont.preferredFont(forTextStyle: .body).withSize(fontSize)
      //позволяет увеличивать шрифт для слабовидящих
      font = UIFontMetrics(forTextStyle: .body).scaledFont(for: font)
      
      //центрирование
      let paragrafStyle = NSMutableParagraphStyle()
      paragrafStyle.alignment = .center
      let attributes:[NSAttributedString.Key : Any] = [.paragraphStyle : paragrafStyle, .font : font]
      return NSAttributedString(string: string, attributes: attributes)
    }

  
  override func draw(_ rect: CGRect) {
    /*
     let a = readLine()
     let b = readLine()
     let c = readLine()
     let d = readLine()
     //100  10  12  15
     //100  10  12  1
     let aInt = 100 // Int(a ?? "0")!
     let bInt = 10 // Int(b ?? "0")!
     let cInt = 12 // Int(c ?? "0")!
     let dInt = 1 // Int(d ?? "0")!
     
     var result = aInt
     
     if dInt > bInt {
     result = (dInt - bInt) * cInt + aInt
     }
     
     print(result)
     */
    let center: CGPoint = .init(x: bounds.midX, y: bounds.midY)
    let radius: CGFloat  = 100
    let startAngle: CGFloat = 0
    let endAngle: CGFloat = 2 * CGFloat.pi
    /*
     guard let context = UIGraphicsGetCurrentContext() else { print("context is nil"); return }
     
     
     context.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
     
     context.setLineWidth(5)
     UIColor.green.setFill()
     UIColor.red.setStroke()
     
     context.strokePath()
     context.fillPath()
     */
    
    let pathOval = UIBezierPath()
    pathOval.addArc(withCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
    pathOval.lineWidth = 5
    
//    UIColor.green.setFill()
//    UIColor.red.setStroke()
//
    
     
    let roundedRect = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
    print("cornerRadius ->\(cornerRadius)" )
    roundedRect.addClip()
    UIColor.white.setFill()
    roundedRect.fill()
    
    UIColor.green.setFill()
    UIColor.red.setStroke()
    pathOval.fill()
   pathOval.stroke()
  }
}

extension PlayingCardView {
  private struct SizeRatio {
    static let cornerFontSizeToBoundsHeight: CGFloat = 0.085
    static let cornerRadiusToBoundsHeight: CGFloat = 0.06
    static let cornerOffsetToCornerRadius: CGFloat = 0.33
    static let faceCardImageSizeToBoundsSize: CGFloat = 0.75
  }
  // радиус угла карты
  private var cornerRadius: CGFloat {
    bounds.size.height * SizeRatio.cornerFontSizeToBoundsHeight
  }
  //смещение угла карты
  private var cornerOffset: CGFloat {
    cornerRadius * SizeRatio.cornerOffsetToCornerRadius
  }
  //размер шрифта для угла карт
  private var cornerFontSize: CGFloat {
    bounds.size.height * SizeRatio.cornerFontSizeToBoundsHeight
  }
  
  private var rankString: String {
    switch rank {
    case 1: return "A"
    case 2...10: return String(rank)
    case 11: return "J"
    case 12: return "Q"
    case 13: return "K"
    default: return "?"
    }
  }
}

extension CGRect {
  var leftHalf: CGRect {
    CGRect(x: minX, y: minY, width: width / 2, height: height)
  }
  var rightHalf: CGRect {
    CGRect(x: midX, y: minY, width: width / 2, height: height)
  }
  func inset(by size: CGSize) -> CGRect {
    insetBy(dx: size.width, dy: size.height)
  }
  func sized(to size: CGSize) -> CGRect {
    CGRect(origin: origin, size: size)
  }
  func zoom(by scale: CGFloat) -> CGRect {
    let newWight = width * scale
    let newHeight = height * scale
    return insetBy(dx: (width - newWight) / 2, dy: (height - newHeight) / 2)
  }
}
extension CGPoint {
  func offSet(dx: CGFloat, dy: CGFloat) -> CGPoint {
    CGPoint(x: x + dx, y: y + dy)
  }
}
