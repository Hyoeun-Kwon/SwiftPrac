//
//  TodoTableViewCell.swift
//  TodoList_P
//
//  Created by HyoEun Kwon on 2021/08/21.
//

import UIKit

class TodoTableViewCell: UITableViewCell {

    
    
    
    
    
    @IBOutlet weak var btnTodoCheck: UIButton!
    @IBOutlet weak var btnTodoUnCheck: UIButton!
    @IBOutlet weak var lblTodo: UILabel!
    @IBOutlet weak var btnStar: UIButton!
    
    @IBOutlet weak var btnStarFill: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        if selected {
            contentView.backgroundColor = UIColor.white
        } else {
            contentView.backgroundColor = UIColor.white
        }
    }

}
