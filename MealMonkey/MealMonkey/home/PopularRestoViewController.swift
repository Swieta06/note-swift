//
//  PopularRestoViewController.swift
//  MealMonkey
//
//  Created by MacBook Pro on 10/04/23.
//

import UIKit
import Kingfisher
class PopularRestoViewController: UIViewController {

    @IBOutlet weak var segmentedController: UISegmentedControl!
    @IBOutlet weak var collectionView: UICollectionView!
    weak var refresh:UIRefreshControl!
    
    var allrestos:[Restaurant] = []
    var restos: [Restaurant] = []
    var categories: [String] = [
    "All",
    "western",
    "Indian",
    "Coffee",
    "Italian",
    "Sri Lankan"
    ]
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        loadRestos()
        // Do any additional setup after loading the view.
    }
    func loadRestos(){
        ApiService.shared.loadPopularResto{[weak self] (restos) in
            self?.refresh.endRefreshing()
            self?.allrestos=restos
            self?.filterResto()
            self?.collectionView.reloadData()
        }
        
    }
    func setUp(){
        title="Popular Restaurant"
        collectionView.dataSource=self
        collectionView.delegate=self
        let refreshControl=UIRefreshControl()
        collectionView.refreshControl=refreshControl
        self.refresh=refreshControl
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        segmentedController.removeAllSegments()
        
        for i in 0..<categories.count{
            segmentedController.insertSegment(withTitle: categories[i], at: i, animated: false)
        }
        segmentedController.selectedSegmentIndex = 0
    }
    func filterResto(){
        let category=categories[segmentedController.selectedSegmentIndex]
        if category == "All"{
            restos = allrestos
        }else{
            restos=allrestos.filter({ restaurant in
                return restaurant.categoryName == category
            })
          }
        }
    @IBAction func filterChanged(_ sender: Any) {
        filterResto()
        collectionView.reloadData()
    }
    @objc func refresh(_ sender:Any){
        loadRestos()
    }
}

extension PopularRestoViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return restos.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "resto_cell", for: indexPath) as! PopularRestosItemViewCell
        let resto = restos[indexPath.item]
        cell.ImageView.kf.setImage(with: URL(string:resto.imageUrl))
        cell.nameLable.text = resto.name
        cell.restoCategoryLable.text="Cafe"
        cell.foodCategoryLable.text=resto.categoryName
        cell.ratingLable.text="4.8"
        return cell
    }
}

extension PopularRestoViewController:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item == 0{
            return CGSize(width: UIScreen.main.bounds.width-40, height: 150)
        }else{
            let column: CGFloat = 2
            let spacing: CGFloat = 12
            let inset: CGFloat = 20
            let screenwidth = UIScreen.main.bounds.width
            let totalWidth = screenwidth - (2 * inset) - (column + 1 * spacing)
            let width = floor(totalWidth/column)
            
            return CGSize(width: width, height: width)
        }
    }
    
}
extension UIViewController{
    func showPopularRestoViewController(){
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "PopularRestosViewController") as! PopularRestoViewController
        navigationController?.pushViewController(viewController, animated: true)
    }
}
