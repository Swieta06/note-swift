//
//  ViewController.swift
//  Latihan3-TableViewUIKit
//
//  Created by MacBook Pro on 24/03/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var TableView: UITableView!
    weak var searchController:UISearchController!
    
    var emojis:[EmojiModel]=[]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emojis=EmojiProvider.all()
        // Do any additional setup after loading the view.
        TableView.dataSource = self
        TableView.delegate=self
        
        let search=UISearchController()
        navigationItem.searchController=search
        self.searchController=search
        search.searchBar.placeholder="Search emoji"
        navigationItem.hidesSearchBarWhenScrolling=false
        search.searchBar.delegate=self
    }
 
}
extension ViewController:UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty{
            emojis=EmojiProvider.all()
        }else{
                emojis=EmojiProvider.all()
                    .filter({ emoji in
                        return emoji.name.lowercased().contains(searchText.lowercased()) ||
                        emoji.emoji.contains(searchText)
                        
                    })
            
        }
        
        TableView.reloadData()
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        emojis = EmojiProvider.all()
               TableView.reloadData()
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        TableView.deselectRow(at:indexPath,animated:true)
        let emoji=emojis[indexPath.row]
        showEmojiViewController(emoji: emoji)

    }
}

extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojis.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "emoji_cell",for:indexPath) as! EmojiViewCell
        let emoji = emojis[indexPath.row]
        cell.EmojiLable.text=emoji.emoji
        cell.titleLabel.text=emoji.name
        return cell
    }
 }
