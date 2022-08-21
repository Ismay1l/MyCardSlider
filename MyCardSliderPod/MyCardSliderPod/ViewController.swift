//
//  ViewController.swift
//  SlidingCards
//
//  Created by Ismayil Ismayilov on 12.08.22.
//

import UIKit
import CardSlider
import SnapKit

struct Item: CardSliderItem {
    var image: UIImage
    var rating: Int?
    var title: String
    var subtitle: String?
    var description: String?
}

class ViewController: UIViewController, CardSliderDataSource {
    
    var data = [Item]()
    
    private lazy var myButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .link
        button.setTitle("Show Card Slider", for: .normal)
        button.addTarget(self,
                         action: #selector(onTap),
                         for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(myButton)
        
        data.append(
            Item(image: UIImage(named: "turtle")!,
                 rating: nil,
                 title: "Turtles",
                 subtitle: "Get excited about turtles",
                 description: "You can  add bookmarks now"))
        
        data.append(
            Item(image: UIImage(named: "cat")!,
                 rating: nil,
                 title: "Cats",
                 subtitle: "Get excited about cats",
                 description: "You can  add bookmarks now"))
        
        data.append(
            Item(image: UIImage(named: "dog")!,
                 rating: nil,
                 title: "Dogs",
                 subtitle: "Get excited about dogs",
                 description: "You can  add bookmarks now"))
        
        myButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalToSuperview().offset(100)
            make.height.equalTo(50)
        }
    }
    
    @objc func onTap() {
        
        let vc = CardSliderViewController.with(dataSource: self)
        
        vc.title = "Welcome!"
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
     }
    
    func item(for index: Int) -> CardSliderItem {
        data[index]
    }
    
    func numberOfItems() -> Int {
        data.count
    }
}



