//
//  HomeViewController.swift
//  Memo
//
//  Created by Takumi Fuzawa on 2022/05/01.
//

import Foundation
import UIKit

class HomeViewController: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!

    var memoDataList: [MemoDataModel] = []
    
    override func viewDidLoad() {
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        setMemoData()
        
    }
    
    func setMemoData() {
        for i in 1...5 {
            let memoDataModel = MemoDataModel(text: "このメモは\(i)番目のメモです", recordDate: Date())
            memoDataList.append(memoDataModel)
        }
    }
}

extension HomeViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memoDataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        let memoDataModel: MemoDataModel = memoDataList[indexPath.row]
        cell.textLabel?.text = memoDataModel.text
        cell.detailTextLabel?.text = "\(memoDataModel.recordDate)"
        return cell
    }
    
    
}

extension HomeViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboad = UIStoryboard(name: "Main", bundle: nil)
        let memoDetailViewController = storyboad.instantiateViewController(identifier: "MemoDetailViewController") as! MemoDetailViewController
        //MemoDetailViewControllerにデータを送る
        let memoData = memoDataList[indexPath.row]
        memoDetailViewController.configure(memo: memoData)
        //セルが選択状態のままになってしまうのを防ぐ
        tableView.deselectRow(at: indexPath, animated: true)
        navigationController?.pushViewController(memoDetailViewController, animated: true)
    }
}
