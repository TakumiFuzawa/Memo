//
//  MemoDetailViewController.swift
//  Memo
//
//  Created by Takumi Fuzawa on 2022/05/02.
//

import Foundation
import UIKit


class MemoDetailViewController: UIViewController{
    
    @IBOutlet weak var textView: UITextView!
    
    var text: String = ""
    var recoadDate: Date = Date()
    var dateFormat: DateFormatter{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "ydMMM", options: 0, locale: Locale(identifier: "ja_JP"))
        return dateFormatter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayData()
    }
    
    func configure(memo: MemoDataModel){
        text = memo.text
        recoadDate = memo.recordDate
        print("データは\(text)と\(recoadDate)です")
    }
    
    func displayData(){
        textView.text = text
        navigationItem.title = dateFormat.string(from: recoadDate)
    }
}
