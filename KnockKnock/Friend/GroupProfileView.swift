//
//  GroupProfileView.swift
//  KnockKnock
//
//  Created by 다은 on 2023/07/23.
//

import UIKit
import NMapsMap
class GroupProfileView : UIView {
    
    let memberLabel : UILabel = {
       let label = UILabel()
        label.text = "모임 구성원"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()
    
    let membertableView : UITableView = UITableView(frame: .zero, style: .plain)
    
    let groupAlarmLabel : UILabel = {
        let label = UILabel()
         label.text = "모임 연락 알림"
        label.font = UIFont.boldSystemFont(ofSize: 17)
         return label
    }()
    
    let groupAlarmSwitch : UISwitch = {
        let swit = UISwitch()
        return swit
    }()
    
    let placeLabel : UILabel = {
        let label = UILabel()
         label.text = "만남 장소"
        label.font = UIFont.boldSystemFont(ofSize: 17)
         return label
    }()
    
    let place : BasePaddingLabel = {
       let label = BasePaddingLabel()
        label.layer.borderWidth = 0.5
        label.layer.borderColor = UIColor.systemGray4.cgColor
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    let naverMapView = NMFMapView(frame: UIScreen.main.bounds)
    let marker = NMFMarker()
    let friendData = Friends.shared
    let group = Group.shared
    
    var nameList: Array<String> = []
    var numberList: Array<String> = []
    var bestFriendList : Array<Bool> = []
    
    var searchPlace: String = ""
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setMap()
        setTableView()
        makeSubView()
        makeConstraint()
    }
    
    required init?(coder _: NSCoder) {
        fatalError("Error")
    }
}

extension GroupProfileView : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "groupmemberList") ?? UITableViewCell(style: .subtitle, reuseIdentifier: "groupmemberList")
        let selected = UIImage(named: "BF")?.resizeImageTo(size: CGSize(width: 65, height: 25))
        let unSelected = UIImage(named: "expand")?.resizeImageTo(size: CGSize(width: 25, height:25))
        if bestFriendList[indexPath.row] == true{
            cell.accessoryView = UIImageView(image: selected)
        }else{
            cell.accessoryView = UIImageView(image:unSelected)
        }
        cell.backgroundColor = .systemGray6
        
        cell.textLabel?.text = nameList[indexPath.row]
        cell.detailTextLabel?.text = numberList[indexPath.row]
        cell.textLabel!.font = UIFont.systemFont(ofSize: 15)
        cell.textLabel!.textColor = UIColor.black
       cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 12)
        cell.detailTextLabel?.textColor = UIColor.systemGray2
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        //프로필로 이동
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func setTableView(){
        membertableView.backgroundColor = .systemGray6
        membertableView.separatorStyle = .none
        membertableView.register(UITableViewCell.self, forCellReuseIdentifier: "groupmemberList")
        
        self.membertableView.dataSource = self
        self.membertableView.delegate = self

    }
    
    
}

extension GroupProfileView {
    func makeSubView(){
        addSubview(memberLabel)
        addSubview(membertableView)
        addSubview(groupAlarmLabel)
        addSubview(groupAlarmSwitch)
        addSubview(placeLabel)
        addSubview(place)
        addSubview(naverMapView)
    }
    func makeConstraint(){
        memberLabel.translatesAutoresizingMaskIntoConstraints = false
        membertableView.translatesAutoresizingMaskIntoConstraints = false
        groupAlarmLabel.translatesAutoresizingMaskIntoConstraints = false
        groupAlarmSwitch.translatesAutoresizingMaskIntoConstraints = false
        placeLabel.translatesAutoresizingMaskIntoConstraints = false
        place.translatesAutoresizingMaskIntoConstraints = false
        naverMapView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            memberLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            memberLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            
            membertableView.topAnchor.constraint(equalTo: memberLabel.bottomAnchor, constant: 7),
            membertableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            membertableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            membertableView.heightAnchor.constraint(equalToConstant: 100),
            
            groupAlarmLabel.topAnchor.constraint(equalTo: membertableView.bottomAnchor, constant: 30),
            groupAlarmLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            groupAlarmSwitch.topAnchor.constraint(equalTo: groupAlarmLabel.topAnchor),
            groupAlarmSwitch.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            
            placeLabel.topAnchor.constraint(equalTo: groupAlarmSwitch.bottomAnchor, constant: 30),
            placeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            
            place.topAnchor.constraint(equalTo: placeLabel.bottomAnchor, constant: 7),
            place.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            place.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
        
            naverMapView.topAnchor.constraint(equalTo: place.bottomAnchor, constant: 7),
            naverMapView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            naverMapView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            naverMapView.heightAnchor.constraint(equalToConstant: 300),
        ])
    }
    
    //임시로 적용
    func sortData(){
        var combinedList = zip(nameList,zip(numberList,bestFriendList).map{($0,$1)}).map{($0,$1)}

        // 이름을 기준으로 오름차순 정렬
        combinedList.sort { $0.0 < $1.0 }

        // 혹은 이렇게도 가능합니다.
        // combinedList = combinedList.sorted { $0.0 < $1.0 }

        // 정렬된 결과를 다시 리스트로 분리
        nameList = combinedList.map { $0.0 }
        numberList = combinedList.map{$0.1.0}
        bestFriendList = combinedList.map{$0.1.1}
        
    }
    func setMap(){
        
       
            //아래 지도 코드들을 함수화해서 서버 통신으로 받아온 좌표를 lat,lng에 넣어주면 지도 위치 변경 및 마커 설정 가능
            //지도 설명 잘 되어 있는 링크 https://navermaps.github.io/ios-map-sdk/guide-ko/5-2.html
            //지도 좌표
            self.naverMapView.moveCamera(NMFCameraUpdate(scrollTo: NMGLatLng(lat:37.498015, lng:127.027974)))
            //마커좌표
            self.marker.position = NMGLatLng(lat: 37.498015, lng: 127.027974)
            //마커 크기
            self.marker.width = 25
            self.marker.height = 40
            //글씨 너비
            self.marker.captionRequestedWidth = 100
            //글씨
            self.marker.captionText = "강남역"
            //글씨 위치
            self.marker.captionAligns = [NMFAlignType.top]
            //글씨 간격
            self.marker.captionOffset = 15
            //마커를 네이버 뷰에 띄우는
            self.marker.mapView = self.naverMapView
        
    }
}
