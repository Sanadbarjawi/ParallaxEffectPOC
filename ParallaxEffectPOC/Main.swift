//
//  Main.swift
//  ParallaxEffectPOC
//
//  Created by Sanad  on 2/11/18.
//  Copyright © 2018 Sanad . All rights reserved.
//

import UIKit

class Main: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDelegate,UITableViewDataSource {
  
    
    @IBOutlet weak var sideMenuTableView: UITableView!
    @IBOutlet weak var sideMenuLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var sideMenu: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    let mainMenu = ["iceCream","iceCream1","Profile","lolipop"]
    override func viewDidLoad() {
        super.viewDidLoad()
        sideMenu.layer.shadowOpacity = 1
        sideMenu.layer.shadowRadius = 5
        let nibName = UINib(nibName: "CollectionViewCustomCellCollectionViewCell", bundle:nil)
        collectionView.register(nibName, forCellWithReuseIdentifier: "CollectionViewCustomCellCollectionViewCell")
        
        let nibTable = UINib(nibName: "sideMenuTableViewCell", bundle:nil)
        sideMenuTableView.register(nibTable, forCellReuseIdentifier: "sideMenuTableViewCell")
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        let swipeLift = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        sideMenu.isUserInteractionEnabled = true
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        swipeLift.direction = UISwipeGestureRecognizerDirection.left
        sideMenu.addGestureRecognizer(swipeRight)
        sideMenu.addGestureRecognizer(swipeLift)
        
     
    }
    
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer)
    {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer
        {
            switch swipeGesture.direction
            {
            case UISwipeGestureRecognizerDirection.right:
                //write your logic for right swipe
                print("Swiped right")
                sideMenuLeadingConstraint.constant = 0
            case UISwipeGestureRecognizerDirection.left:
                //write your logic for left swipe
                print("Swiped left")
                sideMenuLeadingConstraint.constant = -190
            default:
                break
            }
            
            UIView.animate(withDuration: 0.5, animations: {
                self.view.layoutIfNeeded()
                
            })
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return mainMenu.count
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sideMenuTableViewCell", for: indexPath) as! sideMenuTableViewCell
        
        cell.imageOutlet.image = UIImage(named:mainMenu[indexPath.row])
        cell.nameLbl.text = mainMenu[indexPath.row]
        //selectedDate//Selected date from calendar
        sideMenuTableView.tableFooterView = UIView()
        //for removing extra seperators while row is empty
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mainMenu.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCustomCellCollectionViewCell", for: indexPath) as! CollectionViewCustomCellCollectionViewCell
        
        cell.imageView.image = UIImage(named:mainMenu[indexPath.row])
        cell.labelCell.text = mainMenu[indexPath.row].capitalized
        
        
        return cell
    }
    
    
    
}
