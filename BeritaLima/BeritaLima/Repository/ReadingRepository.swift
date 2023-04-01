//
//  ReadingRepository.swift
//  BeritaLima
//
//  Created by MacBook Pro on 29/03/23.
//

import Foundation
import CoreData
import UIKit
class ReadingRepository{
    static let shared: ReadingRepository = ReadingRepository()
    private init() {}
    
    var context: NSManagedObjectContext{
        let appDelegate=UIApplication.shared.delegate as! AppDelegate
        return appDelegate.context
    }
    
    func saveNews(_ news:News){
        let request=NewsData.fetchRequest()
        request.predicate=NSPredicate(format: "newsId = \(news.id)")
        var newsData: NewsData
        if let data=try?context.fetch(request).last{
            newsData=data
        }else{
            newsData=NewsData(context: context)
        }
        newsData.newsId=Int64(news.id)
        newsData.title=news.title
        newsData.section=news.section
        newsData.abstract=news.abstract
        newsData.publishedDate=news.publishedDate
        newsData.url=news.url
        newsData.mediaUrl=news.media.first?.metaData.last?.url
        try? context.save()
        
        NotificationCenter.default.post(name: .readingListAdded, object: nil)
    }
    func fetcNews() -> [NewsData]{
        let request = NewsData.fetchRequest()
        return (try? context.fetch(request)) ?? []
    }
    func deleteNews(newsId: Int){
        let request=NewsData.fetchRequest()
        request.predicate=NSPredicate(format: "newsId = \(newsId)")
        if let data=try? context.fetch(request).first{
            context.delete(data)
            NotificationCenter.default.post(name: .readingListDeletd, object: nil)
        }
    }
    func isAddedToReadingList(newsId:Int) -> Bool{
        
        let request=NewsData.fetchRequest()
        request.predicate=NSPredicate(format: "newsId = \(newsId)")
        if (try? context.fetch(request).first) != nil{
            return true
        }else{
            return false
        }
    }
}
