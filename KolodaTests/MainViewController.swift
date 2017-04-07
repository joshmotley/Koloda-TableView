//
//  ViewController.swift
//  KolodaTests
//
//  Created by Josh Motley on 4/6/17.
//  Copyright © 2017 Josh Motley. All rights reserved.
//

import UIKit
import Koloda

class ViewController: UIViewController, KolodaViewDelegate, KolodaViewDataSource, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var kolodaView: KolodaView!
    
    var carlist: [[UIImage]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        kolodaView.dataSource = self
        kolodaView.delegate = self
        loadCars()
    }
    
    func loadCars() {
        carlist = [[UIImage(named:"Car.jpeg")!, UIImage(named:"Car.jpeg")!], [UIImage(named:"Car.jpeg")!, UIImage(named:"Car.jpeg")!, UIImage(named:"Car.jpeg")!], [UIImage(named:"Car.jpeg")!, UIImage(named:"Car.jpeg")!, UIImage(named:"Car.jpeg")!, UIImage(named:"Car.jpeg")!]]
        
        kolodaView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
        
    func kolodaNumberOfCards(_ koloda:KolodaView) -> Int {
        return carlist.count
    }
    
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        
        let tableView = UITableView(frame: self.view.frame)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "KolodaTableViewCell", bundle: nil), forCellReuseIdentifier: "kolodaCell")
        tableView.tag = index
        
        return tableView
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return carlist[kolodaView.currentCardIndex].count
    }
    
    func koloda(_ koloda: KolodaView, shouldSwipeCardAt index: Int, in direction: SwipeResultDirection) -> Bool {
        
        kolodaView.reloadCardsInIndexRange(index+1..<index+2)
        
        return true
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "kolodaCell", for: indexPath) as! KolodaTableViewCell
        cell.carImageView.image = carlist[kolodaView.currentCardIndex][indexPath.row]

        return cell
    }
}

