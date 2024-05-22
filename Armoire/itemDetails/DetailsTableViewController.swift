//
//  DetailsViewController.swift
//  Armoire
//
//  Created by Abhay singh on 22/05/24.
//

import UIKit

class DetailsTableViewController: UITableViewController {

    
    @IBOutlet weak var categoriesLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var patternLabel: UILabel!
    
    let categoryLabelIndexPath = IndexPath(row: 0, section: 1)
    let colorLabelIndexPath = IndexPath(row: 2, section: 1)
    let patternLabelIndexPath = IndexPath(row: 4, section: 1)
    let categoryCellIndexPath = IndexPath(row: 1, section: 1)
    let colorCellIndexPath = IndexPath(row: 3, section: 1)
    let patternCellIndexPath = IndexPath(row: 5, section: 1)
    
    @IBOutlet var DetailSTableView: UITableView!
    
    
    var isCategoriesCellVisible : Bool = false{
        didSet{
            categoriesLabel.isHidden = !isCategoriesCellVisible
        }
    }
    
    var isColorCellVisible : Bool = false{
        didSet{
            colorLabel.isHidden = !isColorCellVisible
        }
    }
    
    var isPatternCellVisible : Bool = false{
        didSet{
            patternLabel.isHidden = !isPatternCellVisible
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
        case categoryCellIndexPath:
            if isCategoriesCellVisible{
                return 120
            }
            else{
                return 0
            }
        case colorCellIndexPath:
            if isColorCellVisible{
                return 120
            }
            else{
                return 0
            }
        case patternCellIndexPath:
            if isPatternCellVisible{
                return 120
            }
            else{
                return 0
            }
        default:
            return UITableView.automaticDimension
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath == categoryLabelIndexPath{
            isCategoriesCellVisible.toggle()
            if isColorCellVisible{
                isColorCellVisible.toggle()
            }else if isPatternCellVisible{
                isPatternCellVisible.toggle()
            }
        }
        
        if indexPath == colorLabelIndexPath{
            isColorCellVisible.toggle()
            if isCategoriesCellVisible{
                isCategoriesCellVisible.toggle()
            }else if isPatternCellVisible{
                isPatternCellVisible.toggle()
            }
        }
        
        if indexPath == patternLabelIndexPath{
            isPatternCellVisible.toggle()
            if isCategoriesCellVisible{
                isCategoriesCellVisible.toggle()
            }else if isColorCellVisible{
                isColorCellVisible.toggle()
            }
        }
        
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    

}
