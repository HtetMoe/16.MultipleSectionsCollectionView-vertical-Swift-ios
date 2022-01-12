//
//  ViewController.swift
//  MultipleSectionCV
//  Link >>  https://www.youtube.com/watch?v=pWOdOniuHNE
//  Created by Htet Moe Phyu on 12/01/2022.
//

import UIKit
class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var categs = [Category(categoryName: "Category1",
                           items: [
                            Item(itemName: "Item 1", price: "$ 300", itemImage: UIImage(named: "item")!),
                            Item(itemName: "Item 2", price: "$ 200", itemImage: UIImage(named: "item")!),
                            Item(itemName: "Item 3", price: "$ 400", itemImage: UIImage(named: "item")!),
                            Item(itemName: "Item 4", price: "$ 600", itemImage: UIImage(named: "item")!),
                            Item(itemName: "Item 5", price: "$ 1700", itemImage: UIImage(named: "item")!)]),
                  Category(categoryName: "Category2",
                           items: [
                            Item(itemName: "Item 1", price: "$ 300", itemImage: UIImage(named: "item")!),
                            Item(itemName: "Item 2", price: "$ 200", itemImage: UIImage(named: "item")!),
                            Item(itemName: "Item 3", price: "$ 400", itemImage: UIImage(named: "item")!),
                            Item(itemName: "Item 4", price: "$ 600", itemImage: UIImage(named: "item")!)]),
                  Category(categoryName: "Category3",
                           items: [
                            Item(itemName: "Item 1", price: "$ 300", itemImage: UIImage(named: "item")!),
                            Item(itemName: "Item 2", price: "$ 200", itemImage: UIImage(named: "item")!),
                            Item(itemName: "Item 3", price: "$ 400", itemImage: UIImage(named: "item")!),
                            Item(itemName: "Item 4", price: "$ 600", itemImage: UIImage(named: "item")!),
                            Item(itemName: "Item 5", price: "$ 1700", itemImage: UIImage(named: "item")!),
                            Item(itemName: "Item 6", price: "$ 1600", itemImage: UIImage(named: "item")!),
                            Item(itemName: "Item 7", price: "$ 2300", itemImage: UIImage(named: "item")!)])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "ItemCollectionViewCell", bundle: nibBundle), forCellWithReuseIdentifier: "ItemCollectionViewCell")
        
        //categs.reverse()
    }
}

extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return categs.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categs[section].items.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCollectionViewCell", for: indexPath) as! ItemCollectionViewCell
        cell.itemName.text   = categs[indexPath.section].items[indexPath.row].itemName
        cell.itemPrice.text  = categs[indexPath.section].items[indexPath.row].price
        cell.itemImage.image = categs[indexPath.section].items[indexPath.row].itemImage
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width * 0.3, height: collectionView.frame.height * 0.3)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as! HeaderView
        header.categoryName.text = categs[indexPath.section].categoryName
        header.seeAllButton.addTarget(self, action: #selector(seeMore), for: UIControl.Event.touchUpInside)
        return header
    }
    
    @objc func seeMore(){
        print("Pressed!")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
}

struct Category{
    var categoryName : String
    var items : [Item]
}

struct Item{
    var itemName : String
    var price : String
    var itemImage : UIImage
}

