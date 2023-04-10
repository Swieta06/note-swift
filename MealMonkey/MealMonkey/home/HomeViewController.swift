//
//  HomeViewController.swift
//  MealMonkey
//
//  Created by MacBook Pro on 03/04/23.
//

import UIKit

class HomeViewController: UIViewController{

    @IBOutlet weak var tableView: UITableView!
    weak var mostPopularCollectionView:UICollectionView?
    
    enum Section{
        case location
        case search
        case popular
        case mostPopular
    }
    
    var sections:[Section]=[.location, .search, .popular, .mostPopular]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUp()
    }
    func setUp(){
        tableView.dataSource=self
        tableView.delegate=self
    }
    @objc func showPopularRestos(_ sender:Any){
        showPopularRestoViewController()
    }
}

extension HomeViewController:UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let value=sections[section]
        switch value{
        case .location:
            return 1
        case .search:
            return 1
        case .popular:
            return 3
        case .mostPopular:
            return 1
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let value=sections[indexPath.section]
        switch value{
        case .location:
            return tableView.dequeueReusableCell(withIdentifier: "location_cell", for: indexPath)
        case .search:
            return tableView.dequeueReusableCell(withIdentifier: "search_cell", for: indexPath)
        case .popular:
            return tableView.dequeueReusableCell(withIdentifier: "popular_resto", for: indexPath)
        case .mostPopular:
            let cell = tableView.dequeueReusableCell(withIdentifier: "most_popular_resto_cell", for: indexPath) as! MostPopularRestoViewCell
            cell.collectionView.dataSource=self
            cell.collectionView.delegate=self
            cell.collectionView.reloadData()
            return cell
        }
    }
    
}
extension HomeViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let value=sections[section]
        switch value{
        case .popular, .mostPopular:
            let view=UIView(frame: .zero)
            let lable=UILabel(frame: .zero)
            lable.textColor=UIColor(named: "PrimaryText")
            lable.font=UIFont.systemFont(ofSize: 20,weight: .semibold)
          
            view.addSubview(lable)
            
            
            lable.translatesAutoresizingMaskIntoConstraints=false
            NSLayoutConstraint.activate([
                lable.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
                lable.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -20)
                
            ])
            let button=UIButton(type: .system)
            button.tintColor=UIColor(named: "Main")
            button.setTitle("See All", for: .normal)
            button.titleLabel?.font=UIFont.systemFont(ofSize: 14,weight: .medium)
            view.addSubview(button)
            
            button.translatesAutoresizingMaskIntoConstraints=false
            NSLayoutConstraint.activate([
                button.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
                button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
            switch value{
            case .popular:
                lable.text = "Popular Restaurants"
                button.addTarget(self, action: #selector(self.showPopularRestos(_:)), for: .touchUpInside)
            case .mostPopular:
                lable.text = "Popular Restaurants"
            default:
                break
            }
            
            return view
            
            
        default:
            return nil
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let value=sections[section]
        switch value{
        case .popular, .mostPopular:
            return 64
        default:
            return 0.0001
        }
 
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.0001
    }
}
extension HomeViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: "resto_cell", for: indexPath)
    }
}
extension HomeViewController:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 228, height: 180)
    }
}


