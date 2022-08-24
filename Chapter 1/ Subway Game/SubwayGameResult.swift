//
//  SubwayGameResult.swift
//  Zoo Company
//
//  Created by josueyeon on 2022/08/24.
//

import Foundation
import UIKit
import SnapKit

class SubwayGameResult {
    let layout_main = UIView()
    let btn_start = UIButton()
    let label_start = UILabel()
    let label_result = UILabel()
    let layout_result = UIImageView()
    
    func initViews(_ view: UIView) {
        view.addSubviews(layout_main)
        layout_main.snp.makeConstraints() { make in
            make.width.equalTo(445)
            make.height.equalTo(203)
            make.center.equalToSuperview()
        }
        layout_main.isHidden = true
        
        layout_main.addSubviews(btn_start, layout_result)
        layout_result.snp.makeConstraints() { make in
            make.edges.equalToSuperview()
        }
        layout_result.image = UIImage(named: "subway_result")
        
        layout_result.addSubview(label_result)
        label_result.snp.makeConstraints() { make in
            make.top.equalToSuperview().offset(55)
            make.centerX.equalToSuperview()
        }
        label_result.text = "temp"
        label_result.textColor = UIColor.black
        label_result.font = UIFont(name: "NeoDunggeunmo-Regular", size: 64)
        label_result.sizeToFit()
        label_result.layer.zPosition = 999
        
        btn_start.snp.makeConstraints() { make in
            make.width.equalTo(123)
            make.height.equalTo(39)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-24)
        }
        btn_start.setChoiceButton(tagValue: 0, ImgName: "choicebox_normal_mini")
        btn_start.layer.zPosition = 999
        
        btn_start.addSubview(label_start)
        label_start.snp.makeConstraints() { make in
            make.center.equalToSuperview()
        }
        label_start.text = "NEXT"
        label_start.textColor = UIColor.black
        label_start.font = UIFont(name: "NeoDunggeunmo-Regular", size: 15)
        label_start.sizeToFit()
    }
    
    func openResult(resultTxt: String) {
        label_result.text = resultTxt
        layout_main.isHidden = false
    }

}
