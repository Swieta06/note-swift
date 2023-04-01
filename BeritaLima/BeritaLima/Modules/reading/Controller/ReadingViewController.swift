//
//  ReadingViewController.swift
//  BeritaLima
//
//  Created by MacBook Pro on 29/03/23.
//

import UIKit

class ReadingViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var readingList: [NewsData] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        loadReadingList()
        NotificationCenter.default.addObserver(self, selector: #selector(self.readingListAdded(_:)), name: .readingListAdded, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.readingListAdded(_:)), name: .readingListDeletd, object: nil)
        // Do any additional setup after loading the view.
    }
    @objc func readingListAdded(_ sender:Any){
        loadReadingList()
        tableView.reloadData()
        NotificationCenter.default.addObserver(self, selector: #selector(self.readingListDeleted(_:)), name: .readingListDeletd, object: nil)
    }
    @objc func readingListDeleted(_ sender: Any){
        tableView.reloadData()
        
    }
    
    func loadReadingList(){
        self.readingList=ReadingRepository.shared.fetcNews()
    }
    
    func setup(){
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UINib(nibName: "NewsViewCell", bundle: nil), forCellReuseIdentifier: "news_cell")
    }
    

}
// mark: - UITableviewDataSource
extension ReadingViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return readingList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "news_cell",for: indexPath) as! NewsViewCell
        let news=readingList[indexPath.row]
        cell.titleLable.text=news.title
        cell.subTitleLable.text="\(news.publishedDate ?? "")· \(news.section ?? "")"
        let imageUrl=news.mediaUrl ?? ""
        NewsProfide.shared.downloadImage(urlString: imageUrl){ image in
            cell.thumbImageView.image=image
            
        }
        cell.bookmarkButton.isHidden=true
        
        return cell
    }
}
extension ReadingViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let action = UIContextualAction(style: .destructive, title: "Delete"){ action, view, completion in
            let news=self.readingList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            DispatchQueue.main.asyncAfter(deadline: .now()+0.5){
                ReadingRepository.shared.deleteNews(newsId: Int(news.newsId))
            }
          
            completion(true)
            
        }
        return UISwipeActionsConfiguration(actions: [action])
    }
}
