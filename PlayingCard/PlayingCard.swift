    import Foundation

struct PlayingCard: CustomStringConvertible {
    var description: String {
        "\(suit)\(rank)"
    }
    
  var suit: Suit
  var rank: Rank
  
    enum Suit: String, CaseIterable, CustomStringConvertible {
        var description: String {
          self.rawValue
        }
        
    case spaders = "♠️" //пики
    case hearts = "♥️" //черви
    case clubs = "♣️" // крести
    case diamonds = "♦️" // бубами
    
    static var all = [Suit.spaders, .hearts, .diamonds, .clubs]
  }
  
//  func ttt() {
//    let hh = Suit.allCases
//  }
  
    enum Rank: CustomStringConvertible {
        var description: String {
          switch self {
          case .ace: return "A"
          case .numeric(let pips): return String(pips)
          case .face(let kind): return kind
          }
        }
        
    case ace
    case face(String) //Валет, Дама, Король.
    case numeric(pipsCount: Int)
    
    
    static var all: [Rank] {
      var allRanks: [Rank] = [Rank.ace]
      for pips in 2...10 {
        allRanks.append(Rank.numeric(pipsCount: pips))
      }
      allRanks += [Rank.face("J"), Rank.face("Q"), Rank.face("K")]
      return allRanks
    }
    
    
    
    
    var order: Int {

      switch self {
      case .ace: return 1
      case .numeric(let pips): return pips
      case .face(let kind) where kind == "J": return 11 //  “совпадения по шаблону” (​pattern matching​),
      case .face(let kind) where kind == "Q": return 12
      case .face(let kind) where kind == "K": return 13
      default: return 0 //плохой дизайн
      }
      
      
    }
    
    /*case two
     case three
     
     case jack
     case queen
     case king
     */
  }
}

