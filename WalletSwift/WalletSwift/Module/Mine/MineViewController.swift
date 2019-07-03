//
//  MineViewController.swift
//  WalletSwift
//
//  Created by 张春伟 on 2019/6/10.
//  Copyright © 2019 张春伟. All rights reserved.
//

import UIKit
import ObjectiveC
class MineViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
   
    var mineTable: HeaderAnimationTableView!
    var editBtn: UIButton!
    ///header
    var headerImgView: UIImageView!
    let dataArray = [NSLocalizedString("我的钱包", comment: ""), NSLocalizedString("交易记录", comment: ""), NSLocalizedString("消息中心", comment: ""), NSLocalizedString("设置", comment: ""), NSLocalizedString("关于我们", comment: ""), "Image-9", "Image-10", "Image-11", "Image-12", "Image-13"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isTranslucent = false
        //self.navigationController?.navigationBar.backgroundColor = .red
        self.view.backgroundColor = .cyan
        // Do any additional setup after loading the view.
        
        self.createTable()
        self.createNavView()

        self.createRX()
    }
    
    func createRX() -> Void {
        mineTable.rx.itemSelected.subscribe { (indexPath) in
            DLog(indexPath.element?.row)
        }.disposed(by: dispostBag)
        
        editBtn.rx.tap.subscribe { (event) in
            DLog("编辑")
        }.disposed(by: dispostBag)
        
        mineTable.rx.contentOffset.subscribe { (contentOffset) in
            DLog(contentOffset.element?.y)
        }.disposed(by: dispostBag)
        
        NotificationCenter.default.rx.notification(Notification.Name(rawValue: "test")).takeUntil(self.rx.deallocated).subscribe { (notification) in
            //DLog()
            let dic: Dictionary = (notification.element?.userInfo)!
            DLog(dic["a"])
        }.disposed(by: dispostBag)
        
        
//        token(param: "123", success: { (succecc) in
//            DLog(succecc)
//            userInfo(token: succecc, success: { (user) in
//                DLog(user)
//            }, failure: { (error) in
//                DLog(error)
//            })
//        }) { (failure) in
//            DLog(failure)
//        }
//
//        let ss = rxToken(param: "123")
//        DLog(ss)
    }
    
    
//    func rxToken(param: String) -> Observable<String> {
//        if param == "123" {
//            return Observable.just("asdf").subscribe() as! Observable<String>
//        }else{
//            return Observable.error("error" as! Error)
//        }
//    }
    
    
    func token(param: String, success: (String) -> Void, failure: (String) -> Void) {
        
        if param == "123" {
            success("asdf")
        }else{
            failure("123")
        }
    }
    
    func userInfo(token: String, success: (String) -> Void, failure: (String) -> Void) -> Void {
        if token == "asdf" {
            success("userInfo")
        }else{
            failure("error")
        }
    }
    
    func createHeaderView() -> Void {
        headerImgView = UIImageView.init(frame: CGRect(x: 0, y: 0, width: KSCREEN_WIDTH, height: KSCREEN_WIDTH * 0.67))
        headerImgView.image = KImageNamed("Image-15")
        //mineTable.tableHeaderView = headerImgView
        mineTable.settingInfo.headerViewActualHeight = KSCREEN_WIDTH * 0.67
        mineTable.settingInfo.followAnimationType = .FollowAndStretch
        mineTable.settingInfo.stretchType = .StretchSameRate
        mineTable.topView = headerImgView
    }
    
    func createTable() -> Void {
        mineTable = HeaderAnimationTableView.init(frame: CGRect(x: 0, y: 0, width: KSCREEN_WIDTH, height: KSCREEN_HEIGHT - KBottomAreaHeight() - 49), style: .plain)
        self.view.addSubview(mineTable)
        mineTable.dataSource = self as UITableViewDataSource
        mineTable.delegate = self as UITableViewDelegate
        mineTable.backgroundColor = KBgColor()
        mineTable.separatorColor = KRGBColor(red: 51, green: 51, blue: 64)
        mineTable.separatorInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        mineTable.tableFooterView = UIView.init()
        mineTable.register(MineTableViewCell.self, forCellReuseIdentifier: "cell")
        
        self.createHeaderView()
    }
    
    func createNavView() -> Void {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        let titleLabel = UILabel.init()
        self.view.addSubview(titleLabel)
        titleLabel.textColor = .white
        titleLabel.font = KFontWithMedium(18)
        titleLabel.text = NSLocalizedString("我的", comment: "")
        titleLabel.textAlignment = .center
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(KStatusBarHeight())
            make.centerX.equalToSuperview()
            make.height.equalTo(KNavigationBarHeight() - KStatusBarHeight())
        }
        
        editBtn = UIButton.init()
        self.view.addSubview(editBtn)
        editBtn.setImage(KImageNamed("Image-8"), for: .normal)
        editBtn.setImage(KImageNamed("Image-8"), for: .highlighted)
        editBtn.snp.makeConstraints { (make) in
            make.centerY.equalTo(titleLabel)
            make.right.equalToSuperview().offset(KAdap(-15))
            make.size.equalTo(CGSize(width: KAdap(15), height: KAdap(15)))
        }
        editBtn.enlargeClickArea(top: 15, left: 15, bottom: 15, right: 15)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MineTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! MineTableViewCell
        
        cell.titleImgView.image = KImageNamed(dataArray[indexPath.row + 5])
        cell.titleLabel.text = dataArray[indexPath.row]
        
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return KAdap(50)
    }
//
    func scrollViewDidScroll(_ scrollView: UIScrollView){
        mineTable.scrollViewDidScroll(mineTable)
    }
    //}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
