//
//  ViewController.swift
//  BeritaLima
//
//  Created by MacBook Pro on 27/03/23.
//

import UIKit
import SafariServices

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    weak var pageControl:UIPageControl?
    weak var topNewsCollectionView:UICollectionView?
    var latestNesList:[News]=[]
    var topNewsList:[News]=[]
    func getCoreDataDBPath() {
        let path = FileManager
            .default
            .urls(for: .applicationSupportDirectory, in: .userDomainMask)
            .last?
            .absoluteString
            .replacingOccurrences(of: "file://", with: "")
            .removingPercentEncoding

         print("Core Data DB Path :: \(path ?? "Not found")")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        loadTopNews()
        loadLatesNews()
        getCoreDataDBPath()
        // Do any additional setup after loading the view.
    }
    
    func setup(){
        tableView.dataSource=self
        tableView.delegate=self
        tableView.register(UINib(nibName:"NewsViewCell", bundle: nil), forCellReuseIdentifier: "news_cell")
        //tableView.delegate
    }
    func loadTopNews(){
        NewsProfide.shared.loadTopNews { newsList in
            self.topNewsList=newsList
            self.tableView?.reloadSections(IndexSet([1]),with: .automatic)
        }
    }
    func loadLatesNews(){
        NewsProfide.shared.loadLatesNews{ newsList in
            self.latestNesList=newsList
            self.tableView?.reloadSections(IndexSet([2]),with: .automatic)
        }
    }
    
    
}
extension ViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.section == 2 {
            let news = latestNesList[indexPath.row]
            if let url = URL(string: news.url){
                let viewController = SFSafariViewController(url: url)
                present(viewController,animated:true)
            }
        }
    }
}
extension ViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView)-> Int{
        return 3
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else if section == 1{
            return 1
        }else{
            return latestNesList.count
        }
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "banner_cell", for:indexPath) as! BannerViewCell
            
            //  Covid-19 News: See the latest coverage about Covid-19
            let attText=NSMutableAttributedString(
                string: "Covid-19 News:",
                attributes: [
                    .font:UIFont.preferredFont(forTextStyle: .headline),
                    .foregroundColor:UIColor.systemBlue
                ]
            )
            attText.append(NSAttributedString(
                string: "See the latest coverage about Copvid-19",
                attributes: [
                    .font:UIFont.preferredFont(forTextStyle: .subheadline),
                    .foregroundColor:UIColor.systemGray
                ]
            ))
            
            cell.titleLable.attributedText=attText
            return cell
        }else if indexPath.section == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "top_news_list_cell", for: indexPath) as!
            TopNewsListViewCell
            cell.titleLable.text="News for you"
            cell.subtitleLable.text="Top 20 News Of the Day"
            cell.collectionView.dataSource=self
            cell.collectionView.delegate=self
            cell.collectionView.reloadData()
            topNewsCollectionView=cell.collectionView
            cell.pageControl.numberOfPages=topNewsList.count
            pageControl=cell.pageControl
            
            let width=UIScreen.main.bounds.width-40
            let height = 9/16 * width + 76
            cell.heightConstraint.constant=height
            cell.delegate=self
            cell.layoutIfNeeded()
            return cell
        }else{
            let cell=tableView.dequeueReusableCell(withIdentifier: "news_cell", for:indexPath) as! NewsViewCell
            
            let news=latestNesList[indexPath.row]
            cell.titleLable.text=news.title
            cell.subTitleLable.text="\(news.publishedDate) · \(news.section)"
            
            let urlString=news.media.first?.metaData.last?.url ?? ""
            NewsProfide.shared.downloadImage(urlString: urlString) { image in
                cell.thumbImageView.image=image
            }
            if #available(iOS 13.0, *) {
                if ReadingRepository.shared.isAddedToReadingList(newsId: news.id){
                    cell.bookmarkButton.setImage(UIImage(systemName: "bookmark.fill"), for: .normal)
                }else{
                    cell.bookmarkButton.setImage(UIImage(systemName: "bookmark"), for: .normal)
                }
            }
            cell.delegate=self
            return cell
        }
    }
    
    //buat scrolling
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView == self.topNewsCollectionView{
            let page = Int(scrollView.contentOffset.x/scrollView.frame.width)
            pageControl?.currentPage = page
        }
    }
    
}
extension ViewController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return topNewsList.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "top_news_cell", for: indexPath) as! TopNewsCollectionViewCell
        let news=topNewsList[indexPath.item]
        cell.titleLable.text=news.title
        cell.dateLable.text="\(news.publishedDate) · \(news.section)"
        
        let urlString=news.media.first?.metaData.last?.url ?? ""
        NewsProfide.shared.downloadImage(urlString: urlString) { image in
            cell.imageView.image=image
        }
        
        return cell
    }
}
//Mark:
extension ViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let Imagewidth=UIScreen.main.bounds.width-40
        let height = 9/16 * Imagewidth + 76
        let width = UIScreen.main.bounds.width
        return CGSize(width: width, height: height)
    }
}
extension ViewController:UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let news=topNewsList[indexPath.item]
        if let url=URL(string: news.url){
            let viewController=SFSafariViewController(url:url)
            present(viewController,animated:true)
        }
    }
}
extension ViewController:TopNewsViewCellDelegate{
    func topNewsListViewCellPageControlValueChange(_ cell: TopNewsListViewCell) {
        let page=cell.pageControl.currentPage
        topNewsCollectionView?.scrollToItem(at: IndexPath(item: page, section: 0), at:UICollectionView.ScrollPosition.centeredHorizontally, animated: true)
    }
    
    
}
extension ViewController:NewsViewCellDelegate{
    func newsViewCellBookmarkButtonTapped(_ cell: NewsViewCell) {
        if let indexPath=tableView.indexPath(for: cell){
            let news = latestNesList[indexPath.row]
            if ReadingRepository.shared.isAddedToReadingList(newsId: news.id){
                ReadingRepository.shared.deleteNews(newsId: news.id)
            }else{
                ReadingRepository.shared.saveNews(news)
            }
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
    }
}


