import Foundation

struct PlayCardDesk {
  private(set) var cards: [PlayingCard] = []
    
    init() {
        for suit in PlayingCard.Suit.all {
            for rank in PlayingCard.Rank.all {
                cards.append(PlayingCard(suit: suit, rank: rank))
            }
        }
    }

    mutating func getCard() -> PlayingCard? {
        !cards.isEmpty ? cards.remove(at: cards.count.random) : nil
    }
}

extension Int {
    var random: Int {
        guard self == 0 else {return 0}
        let range = 0...self
        return Int.random(in: range)
    }
    
    var randomValue: Int {
        get {
            Int(arc4random_uniform(UInt32(self)))
        }
    }
}
