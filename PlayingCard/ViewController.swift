//
//  ViewController.swift
//  PlayingCard
//
//  Created by Sergey Gomolko on 2/2/23.
//

import UIKit

class ViewController: UIViewController {

    var deck = PlayCardDesk()
        
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
      for _ in 0...10 {
        guard let card = deck.cards.randomElement() else {return}
          print( "\(card.suit.rawValue)\(card.rank)")
          print(card)
      }
   //  print(deck.getCard() != nil ?  deck.cards.randomElement() : "deck is empty" )
  }


}

