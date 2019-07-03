//
//  RegisAreaCodeViewController.swift
//  WalletSwift
//
//  Created by 张春伟 on 2019/5/31.
//  Copyright © 2019 张春伟. All rights reserved.
//

import UIKit
import SwiftyJSON
class RegisAreaCodeViewController: BaseLoginViewController, UITableViewDelegate, UITableViewDataSource {

    var areaTable: UITableView!
    var dataArray = [[AreaCodeModel]]()
    var sectionTitles = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let path = Bundle.main.url(forResource: "regionCode", withExtension: "txt")
        let data = try! Data.init(contentsOf: path!)
        
        let jsonData = JSON(data)
        let jsonArr = jsonData["data"].rawString()
        let sourceArray = Mapper<AreaCodeModel>().mapArray(JSONString: jsonArr!)
        
        let collation = UILocalizedIndexedCollation.current()
        let sectionTitleArray = collation.sectionTitles
        sectionTitles = sectionTitleArray
        //创建一维数组
        for _ in 0..<sectionTitleArray.count {
            let array = [AreaCodeModel]()
            dataArray.append(array)
        }
        
        //数据分类
        for area in sourceArray! {
            let sectionIndex = collation.section(for: area, collationStringSelector: #selector(getter: area.zh_hans))
            dataArray[sectionIndex].append(area)
        }
        
        //排序结果数组
        for index in 0..<sectionTitleArray.count {
            let sortedArray = collation.sortedArray(from: dataArray[index], collationStringSelector: #selector(getter: AreaCodeModel.zh_hans))
            dataArray[index] = sortedArray as! [AreaCodeModel]
        }
        
        // 用来保存没有数据的一维数组的下标
        print(dataArray.count)
        for (i , array) in dataArray.enumerated().reversed() {
            if array.count == 0{
                dataArray.remove(at: i)
                sectionTitles.remove(at: i)
            }
        }
        self.createTable()
    }
    
    func createTable() -> Void {
        
        let titleLabel = UILabel.init()
        self.base_navigationItem.addSubview(titleLabel)
        titleLabel.font = KFontWithMedium(16)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .white
        titleLabel.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.left.equalToSuperview().offset(60)
            make.right.equalToSuperview().offset(-60)
        }
        titleLabel.text = NSLocalizedString("国家/地区", comment: "")
        
        
        areaTable = UITableView.init(frame: .zero, style: .plain)
        self.view.addSubview(areaTable)
        areaTable.backgroundColor = KRGBColor(red: 39, green: 39, blue: 53)
        areaTable.delegate = self
        areaTable.dataSource = self
        areaTable.tableFooterView = UIView.init()
        areaTable.separatorStyle = .none;
        
        
        areaTable.register(AreaCodeTableViewCell.self, forCellReuseIdentifier: "cell")
        areaTable.register(AreaCodeHeaderView.self, forHeaderFooterViewReuseIdentifier: "header")
        areaTable.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: KNavigationBarHeight(), left: 0, bottom: 0, right: 0))
        }
        //右侧索引
//        areaTable.sectionIndexBackgroundColor = .clear
        areaTable.sectionIndexColor = .white
    }

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return dataArray[section].count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header: AreaCodeHeaderView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as! AreaCodeHeaderView
        header.titleLabel.text = sectionTitles[section]
        return header
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell: AreaCodeTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! AreaCodeTableViewCell

        let model = dataArray[indexPath.section][indexPath.row]
        
        cell.showModelInfo(model)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return KAdap(28)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return KAdap(44)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int{
        return dataArray.count
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]?{
        return sectionTitles
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
