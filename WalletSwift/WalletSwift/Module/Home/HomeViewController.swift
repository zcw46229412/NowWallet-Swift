//
//  HomeViewController.swift
//  WalletSwift
//
//  Created by 张春伟 on 2019/6/10.
//  Copyright © 2019 张春伟. All rights reserved.
//

import UIKit
import MarqueeLabel
class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    /** 首页*/
    var homeTable: UITableView!
    var rightItemBtn: UIButton! = nil
    /** 零钱*/
    var changePointLabel: UILabel!
    var changeLabel: UILabel!
    /** 总资产*/
    var propertyPointLabel: UILabel!
    var propertyLabel: UILabel!
    /** headerView*/
    var headerView: UIView!
    /** 支付按钮*/
    var paymentBtn: UIButton!
    /** 转账按钮*/
    var transferBtn: UIButton!
    /** 收款按钮*/
    var gatherBtn: UIButton!
    ///零钱
    var changeCardTap: UITapGestureRecognizer!
    ///锁仓
    var lockCardTap: UITapGestureRecognizer!
    ///置换
    var displacesCardTop: UITapGestureRecognizer!
    ///跑马灯
    var scrollLabel: MarqueeLabel!
    ///footer
    var footerImgView: UIImageView!
    var footerTap: UITapGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = .cyan
        
        self.createNavViews()
        self.createTable()
        self.createRX()
    }
    
    func createRX() -> Void {
        
        propertyLabel.text = "222"
        propertyPointLabel.text = NSLocalizedString("总资产" + "(USDT)", comment: "")
        changePointLabel.text = NSLocalizedString("可付款零钱" + "(￥)", comment: "")
        changeLabel.text = "1000000"
        scrollLabel.text = "【BAIC（佰客雲）與優博訊達成戰略合作 將實現數字貨幣移動支付】BAIC（佰客雲）與深圳優博訊(股票代碼：300531)達成戰略合作，雙方就手持智能支付終端產品展開深度合作，優博訊將為BAIC旗下手持智能終端電子產品及對移動支付提供技術支持。本次兩方智能移動支付終端的合作主要針對BAIC（佰客雲）旗下的數字貨幣錢包—N次方中的NowPay功能，NowPay可以為收付款人之間提供數字貨幣資本轉移服務，同時可配置身份信息、交易信息、資金余額，以支持發起交易指令的電子簿記。其支持的商戶號將與合法的N次方錢包進行綁定，錢包賬戶會根據交易指令和NowPay支付商戶號的交易情況做相應的資金扣劃及歸集。簡單來說，可以把NowPay理解為數字貨幣版的支付寶。"

        
        
        paymentBtn.rx.tap.subscribe { (event) in
            DLog("payment")
        }.disposed(by: dispostBag)
        
        
        transferBtn.rx.tap.subscribe { (event) in
            print("transfer")
        }.disposed(by: dispostBag)
        
        
        gatherBtn.rx.tap.subscribe { (event) in
            print("gather")
        }.disposed(by: dispostBag)
        
        changeCardTap.rx.event.subscribe { (event) in
            print("零钱卡")
        }.disposed(by: dispostBag)
        
        lockCardTap.rx.event.subscribe { (event) in
            print("锁仓")
        }.disposed(by: dispostBag)
        
        displacesCardTop.rx.event.subscribe { (event) in
            print("置换")
        }.disposed(by: dispostBag)
        
        footerTap.rx.event.subscribe { (event) in
            print("footerTap")
        }.disposed(by: dispostBag)
    }
    
    func createTableFooterView(){
        let footerView = UIView.init(frame: CGRect(x: 0, y: 0, width: KSCREEN_WIDTH, height: KAdap(110)))
        homeTable.tableFooterView = footerView
        
        footerImgView = UIImageView.init()
        footerImgView.isUserInteractionEnabled = true
        footerImgView.image = KImageNamed("Image-5")
        footerView.addSubview(footerImgView)
        footerImgView.layer.masksToBounds = true
        footerImgView.layer.cornerRadius = KAdap(4)
        footerImgView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: KAdap(335), height: KAdap(80)))
            make.top.equalToSuperview().offset(KAdap(15))
        }
        
        footerTap = UITapGestureRecognizer.init()
        footerImgView.addGestureRecognizer(footerTap)
    }
    
    func createTableHeaderView() -> Void {
        headerView = UIView.init(frame: CGRect(x: 0, y: 0, width: KSCREEN_WIDTH, height: KAdap(372)))
        homeTable.tableHeaderView = headerView
        
        let bgImageView = UIImageView.init()
        bgImageView.isUserInteractionEnabled = true
        headerView.addSubview(bgImageView)
        bgImageView.image = KImageNamed("Image-7")
        bgImageView.layer.masksToBounds = true
        bgImageView.layer.cornerRadius = KAdap(5)
        bgImageView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize.init(width: KAdap(335), height: KAdap(195)))
            make.top.equalToSuperview().offset(KAdap(10))
        }
        
        let nImageView = UIImageView.init()
        nImageView.image = KImageNamed("home_n_logo")
        bgImageView.addSubview(nImageView)
        nImageView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(KAdap(15))
            make.top.equalToSuperview().offset(KAdap(15))
            make.size.equalTo(CGSize.init(width: KAdap(20), height: KAdap(20)))
        }
        
        let nWalletLabel = UILabel.init()
        nWalletLabel.textColor = .white
        nWalletLabel.font = KFontWithSemibold(14)
        bgImageView.addSubview(nWalletLabel)
        nWalletLabel.text = NSLocalizedString("我的钱包", comment: "")
        nWalletLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(nImageView)
            make.left.equalTo(nImageView.snp.right).offset(KAdap(10))
        }
        
        propertyLabel = UILabel.init()
        bgImageView.addSubview(propertyLabel)
        propertyLabel.textColor = .white
        propertyLabel.font = KFontWithSemibold(12)
        propertyLabel.textAlignment = .right
        propertyLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(nWalletLabel)
            make.right.equalToSuperview().offset(-KAdap(16))
        }
        
        
        propertyPointLabel = UILabel.init()
        bgImageView.addSubview(propertyPointLabel)
        propertyPointLabel.textColor = .white
        propertyPointLabel.font = KFontWithSemibold(13)
        propertyPointLabel.textAlignment = .right
        propertyPointLabel.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-KAdap(16))
            make.top.equalTo(propertyLabel.snp.bottom).offset(KAdap(3))
        }

        
        changePointLabel = UILabel.init()
        bgImageView.addSubview(changePointLabel)
        changePointLabel.textAlignment = .center
        changePointLabel.textColor = KRGBColor(red: 156, green: 158, blue: 185)
        changePointLabel.font = KFontWithMedium(12)
        changePointLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(KAdap(111))
        }
        
        changeLabel = UILabel.init()
        bgImageView.addSubview(changeLabel)
        changeLabel.textAlignment = .center
        changeLabel.font = KFontWithSemibold(30)
        changeLabel.textColor = .white
        changeLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(changePointLabel.snp.top).offset(-KAdap(2))
        }
        
        //转账
        transferBtn = UIButton.init()
        bgImageView.addSubview(transferBtn)
        transferBtn.setTitleColor(.white, for: .normal)
        transferBtn.setTitle(NSLocalizedString("转账", comment: ""), for: .normal)
        transferBtn.titleLabel?.font = KFontWithSemibold(14)
        transferBtn.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-KAdap(13))
        }
        transferBtn.enlargeClickArea(top: 5, left: 10, bottom: 5, right: 10)
        
        //付款
        paymentBtn = UIButton.init()
        bgImageView.addSubview(paymentBtn)
        paymentBtn.setTitleColor(.white, for: .normal)
        paymentBtn.setTitle(NSLocalizedString("支付", comment: ""), for: .normal)
        paymentBtn.titleLabel?.font = KFontWithSemibold(14)
        paymentBtn.snp.makeConstraints { (make) in
            make.centerY.equalTo(transferBtn)
            make.right.equalTo(transferBtn.snp.left).offset(-KAdap(80))
        }
        paymentBtn.enlargeClickArea(top: 5, left: 10, bottom: 5, right: 10)
        
        //收款
        gatherBtn = UIButton.init()
        bgImageView.addSubview(gatherBtn)
        gatherBtn.setTitleColor(.white, for: .normal)
        gatherBtn.setTitle(NSLocalizedString("收款", comment: ""), for: .normal)
        gatherBtn.titleLabel?.font = KFontWithSemibold(14)
        gatherBtn.snp.makeConstraints { (make) in
            make.centerY.equalTo(transferBtn)
            make.left.equalTo(transferBtn.snp.right).offset(KAdap(80))
        }
        gatherBtn.enlargeClickArea(top: 5, left: 10, bottom: 5, right: 10)

        let lineView1 = UIView.init()
        bgImageView.addSubview(lineView1)
        lineView1.backgroundColor = KRGBColor(red: 81, green: 82, blue: 107)
        lineView1.layer.masksToBounds = true
        lineView1.layer.cornerRadius = KAdap(1)
        lineView1.snp.makeConstraints { (make) in
            make.centerY.equalTo(transferBtn)
            make.size.equalTo(CGSize.init(width: KAdap(2), height: KAdap(20)))
            make.left.equalTo(paymentBtn.snp.right).offset(KAdap(39))
        }
        
        let lineView2 = UIView.init()
        bgImageView.addSubview(lineView2)
        lineView2.backgroundColor = KRGBColor(red: 81, green: 82, blue: 107)
        lineView2.layer.masksToBounds = true
        lineView2.layer.cornerRadius = KAdap(1)
        lineView2.snp.makeConstraints { (make) in
            make.centerY.equalTo(transferBtn)
            make.size.equalTo(CGSize.init(width: KAdap(2), height: KAdap(20)))
            make.left.equalTo(transferBtn.snp.right).offset(KAdap(39))
        }
        
        let lineImgView = UIImageView.init()
        headerView.addSubview(lineImgView)
        lineImgView.image = KImageNamed("Image-4")
        lineImgView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(KAdap(35))
            make.right.equalToSuperview().offset(KAdap(-35))
            make.height.equalTo(KAdap(6))
            make.centerY.equalTo(bgImageView.snp.bottom)
        }
        
        //零钱卡
        let cardImageView1 = UIImageView.init()
        cardImageView1.image = KImageNamed("Image-2")
        headerView.addSubview(cardImageView1)
        cardImageView1.snp.makeConstraints { (make) in
            make.left.equalTo(bgImageView)
            make.top.equalTo(bgImageView.snp.bottom).offset(KAdap(18))
            make.size.equalTo(CGSize.init(width: KAdap(106), height: KAdap(80)))
        }

        let cardLabel1 = UILabel.init()
        cardImageView1.addSubview(cardLabel1)
        cardLabel1.textAlignment = .right
        cardLabel1.font = KFontWithSysBold(14)
        cardLabel1.textColor = .white
        cardLabel1.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(KAdap(10))
            make.right.equalToSuperview().offset(-KAdap(10))
        }
        cardLabel1.text = NSLocalizedString("零钱", comment: "")
        
        cardImageView1.isUserInteractionEnabled = true
        changeCardTap = UITapGestureRecognizer.init()
        cardImageView1.addGestureRecognizer(changeCardTap)
        
        
        //锁仓
        let cardImageView2 = UIImageView.init()
        cardImageView2.image = KImageNamed("Image-3")
        headerView.addSubview(cardImageView2)
        cardImageView2.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.size.equalTo(cardImageView1)
            make.top.equalTo(bgImageView.snp.bottom).offset(KAdap(18))
        }
        
        let cardLabel2 = UILabel.init()
        cardImageView2.addSubview(cardLabel2)
        cardLabel2.textAlignment = .right
        cardLabel2.font = KFontWithSysBold(14)
        cardLabel2.textColor = .white
        cardLabel2.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(KAdap(10))
            make.right.equalToSuperview().offset(-KAdap(10))
        }
        cardLabel2.text = NSLocalizedString("锁仓", comment: "")
        
        cardImageView2.isUserInteractionEnabled = true
        lockCardTap = UITapGestureRecognizer.init()
        cardImageView2.addGestureRecognizer(lockCardTap)
        
        //置换
        let cardImageView3 = UIImageView.init()
        cardImageView3.image = KImageNamed("Image-1")
        headerView.addSubview(cardImageView3)
        cardImageView3.snp.makeConstraints { (make) in
            make.size.equalTo(cardImageView1)
            make.top.equalTo(bgImageView.snp.bottom).offset(KAdap(18))
            make.right.equalTo(bgImageView)
        }
        
        let cardLabel3 = UILabel.init()
        cardImageView3.addSubview(cardLabel3)
        cardLabel3.textAlignment = .right
        cardLabel3.font = KFontWithSysBold(14)
        cardLabel3.textColor = .white
        cardLabel3.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(KAdap(10))
            make.right.equalToSuperview().offset(-KAdap(10))
        }
        cardLabel3.text = NSLocalizedString("置换", comment: "")
        
        cardImageView3.isUserInteractionEnabled = true
        displacesCardTop = UITapGestureRecognizer.init()
        cardImageView3.addGestureRecognizer(displacesCardTop)
        
        //跑马灯
        scrollLabel = MarqueeLabel.init(frame: .zero, duration: 30, fadeLength: 10)
        headerView.addSubview(scrollLabel)
        scrollLabel.textColor = .white
        scrollLabel.font = KFontWithMedium(12)
        scrollLabel.snp.makeConstraints { (make) in
            make.left.right.equalTo(bgImageView)
            make.top.equalTo(cardImageView1.snp.bottom).offset(KAdap(15))
            //make.bottom.equalToSuperview().offset(-KAdap(15))
        }
        
        //诺信钱包
        let titleLabel = UILabel.init()
        headerView.addSubview(titleLabel)
        titleLabel.font = KFontWithMedium(18)
        titleLabel.textColor = .white
        titleLabel.text = NSLocalizedString("诺信钱包", comment: "")
        titleLabel.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(KAdap(33))
        }
        
        let titleImgView = UIImageView.init()
        headerView.addSubview(titleImgView)
        titleImgView.image = KImageNamed("Image")
        titleImgView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(KAdap(20))
            make.size.equalTo(CGSize.init(width: KAdap(3), height: KAdap(20)))
            make.centerY.equalTo(titleLabel)
        }
    }
    
    func createTable(){
        homeTable = UITableView.init(frame: .zero, style: .grouped)
        self.view.addSubview(homeTable)
        homeTable.dataSource = self as UITableViewDataSource
        homeTable.delegate = self as UITableViewDelegate
        homeTable.backgroundColor = KBgColor()
        homeTable.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.height.equalTo(KSafeAreaHeight() - 49)
            make.top.equalToSuperview().offset(KNavigationBarHeight())
        }
        homeTable.register(HomeFinancialTableViewCell.self, forCellReuseIdentifier: "cell")
        homeTable.separatorStyle = .none
        self.createTableHeaderView()
        self.createTableFooterView()
    }
    
    func createNavViews(){
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        let navView = UIView.init()
        self.view.addSubview(navView)
        navView.backgroundColor = KBgColor()
        navView.snp.makeConstraints { (make) in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(KNavigationBarHeight())
        }
        
        let titleLabel = UILabel.init()
        navView.addSubview(titleLabel)
        titleLabel.font = KFontWithSysBold(28)
        titleLabel.textColor = .white
        titleLabel.text = NSLocalizedString("诺信钱包", comment: "")
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(KStatusBarHeight())
            make.height.equalTo(KNavigationBarHeight() - KStatusBarHeight())
            make.left.equalToSuperview().offset(KAdap(15))
        }
        
        rightItemBtn = UIButton.init()
        navView.addSubview(rightItemBtn)
        rightItemBtn.setTitle("闪兑", for: .normal)
        rightItemBtn.setTitleColor(.white, for: .normal)
        rightItemBtn.titleLabel?.font = KFontWithSemibold(12)
        rightItemBtn.setImage(KImageNamed("home_lighting"), for: .normal)
        rightItemBtn.setImage(KImageNamed("home_lighting"), for: .highlighted)
        rightItemBtn.backgroundColor = KRGBColor(red: 39, green: 39, blue: 58)
        rightItemBtn.layer.cornerRadius = 12
        rightItemBtn.snp.makeConstraints { (make) in
            make.centerY.equalTo(titleLabel)
            make.right.equalToSuperview().offset(-KAdap(20))
            make.size.equalTo(CGSize(width: 60, height: 24))
        }
        rightItemBtn.imagePosition(at: .right, space: 4)
        
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell: HomeFinancialTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! HomeFinancialTableViewCell
        
//        if cell == nil {
//            cell = HomeFinancialTableViewCell.init(style: .default, reuseIdentifier: "cell")
//        }
        
        cell.titleLabel.text = "新手加倍盈"
        cell.rateLabel.text = "35.0%"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
}
