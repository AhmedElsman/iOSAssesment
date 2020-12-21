//
//  TracksTableViewCell.swift
//  iOSAssesment
//
//  Created by Ahmed Elsman on 20/12/2020.
//

import UIKit
import Reusable

class ArticleTableViewCell: UITableViewCell, NibReusable {
    
    @IBOutlet weak var articleSection : UILabel!
    @IBOutlet weak var articleType: UILabel!
    
    
    public var cellArticle : Article! {
        didSet {
            self.articleSection.text = cellArticle.section
            self.articleType.text = cellArticle.type
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
    }
}
