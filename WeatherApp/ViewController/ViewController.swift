//
//  ViewController.swift
//  WeatherApp
//
//  Created by Tsimafei Zykau on 10/28/20.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let locationManager = CLLocationManager()
    var location: CLLocation?
    
    var networkManager: NetworkManager!
    
    var tableView: UITableView!
    var headerView: HeaderView!
    var collectionView: HourlyCollectionView!
    
    var currentWeather: CurrentWeather?
    var hourlyWeather = [HourlyWeather]()
    var dailyWeather = [DailyWeather]()
    var cityName: String!
    
    init(networkManager: NetworkManager) {
        super.init(nibName: nil, bundle: nil)
        self.networkManager = networkManager
        self.networkManager = NetworkManager()
        self.cityName = ""
    }


    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//
//        self.headerView = HeaderView(frame: CGRect(x: 0, y: self.view.safeAreaInsets.top, width: self.view.frame.width, height: self.view.frame.width*0.9))
//
//        self.tableView = UITableView(frame: CGRect(x: 0, y: self.view.safeAreaInsets.top, width: self.view.frame.width, height: self.view.frame.height), style: .grouped)
//        self.tableView.register(DailyWeatherTableViewCell.self, forCellReuseIdentifier: "dailyCell")
//        self.tableView.register(StatsTableViewCell.self, forCellReuseIdentifier: "statsCell")
//        self.tableView.register(DefaultTableViewCell.self, forCellReuseIdentifier: "defaultCell")
//        self.tableView.backgroundColor = UIColor(white: 0, alpha: 0)
//        self.tableView.showsVerticalScrollIndicator = false
//        self.tableView.separatorStyle = .none
//        self.tableView.allowsSelection = false
//        self.tableView.contentInset = UIEdgeInsets(top: self.headerView.frame.height, left: 0, bottom: 0, right: 0)
//
//        let collectionViewFlowLayout = UICollectionViewFlowLayout()
//        collectionViewFlowLayout.itemSize = CGSize(width: 40, height: 110)
//        collectionViewFlowLayout.scrollDirection = .horizontal
//        self.collectionView = HourlyCollectionView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 120), collectionViewLayout: collectionViewFlowLayout)
//        self.collectionView.backgroundColor = .blue
//
//        self.tableView.delegate = self
//        self.tableView.dataSource = self
//        self.collectionView.delegate = self
//        self.collectionView.dataSource = self
//        self.locationManager.delegate = self
//
//        self.view.addSubview(self.headerView)
//        self.view.addSubview(self.collectionView)
//        self.view.addSubview(self.tableView)
//        self.tableView.addSubview(self.collectionView)
//
//        self.headerView.translatesAutoresizingMaskIntoConstraints = false
//        self.collectionView.translatesAutoresizingMaskIntoConstraints = false
//        self.tableView.translatesAutoresizingMaskIntoConstraints = false
//        self.headerView.clipsToBounds = true
//        self.collectionView.clipsToBounds = true
//        self.tableView.clipsToBounds = true
//        self.headerView.contentMode = .scaleAspectFit
        
//        NSLayoutConstraint.activate([
//            self.headerView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
//            self.headerView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
//            self.headerView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
//            self.headerView.heightAnchor.constraint(equalToConstant: self.view.frame.width*0.9),
            
//            self.collectionView.topAnchor.constraint(equalTo: self.headerView.bottomAnchor),
//            self.collectionView.widthAnchor.constraint(equalToConstant: self.view.frame.width),
//            self.collectionView.heightAnchor.constraint(equalToConstant: 120),
            
//            self.tableView.topAnchor.constraint(equalTo: self.collectionView.bottomAnchor),
//            self.tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
//            self.tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
//            self.tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor)
//        ])
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.headerView = HeaderView(frame: CGRect(x: 0, y: self.view.safeAreaInsets.top, width: self.view.frame.width, height: self.view.frame.width*0.9))
        self.headerView.backgroundColor = .blue
        
        self.tableView = UITableView(frame: CGRect(x: 0, y: self.view.safeAreaInsets.top, width: self.view.frame.width, height: self.view.frame.height-(self.view.safeAreaInsets.bottom+self.view.safeAreaInsets.top)), style: .grouped)
        self.tableView.register(DailyWeatherTableViewCell.self, forCellReuseIdentifier: "dailyCell")
        self.tableView.register(StatsTableViewCell.self, forCellReuseIdentifier: "statsCell")
        self.tableView.register(DefaultTableViewCell.self, forCellReuseIdentifier: "defaultCell")
        self.tableView.backgroundColor = UIColor(white: 0, alpha: 0)
        self.tableView.showsVerticalScrollIndicator = false
        self.tableView.separatorStyle = .none
        self.tableView.allowsSelection = false
        
        self.tableView.contentInset = UIEdgeInsets(top: self.headerView.frame.height, left: 0, bottom: 0, right: 0)
        
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.itemSize = CGSize(width: 40, height: 110)
        collectionViewFlowLayout.scrollDirection = .horizontal
        self.collectionView = HourlyCollectionView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 120), collectionViewLayout: collectionViewFlowLayout)
        self.collectionView.backgroundColor = .blue
        
        let topGrayBreakline = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 1))
        topGrayBreakline.backgroundColor = .lightGray
        let bottomGrayBreakline = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 1))
        bottomGrayBreakline.backgroundColor = .lightGray
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.locationManager.delegate = self
        
//        self.view.addSubview(self.collectionView)
        self.view.addSubview(self.headerView)
        self.view.addSubview(self.tableView)
        self.tableView.addSubview(self.collectionView)
    
//        self.headerView.translatesAutoresizingMaskIntoConstraints = false
//        self.collectionView.translatesAutoresizingMaskIntoConstraints = false
//        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.headerView.clipsToBounds = true
        
        self.locationManager.startUpdatingLocation()
        self.locationManager.requestWhenInUseAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if !locations.isEmpty, location == nil {
            location = locations.first
            
            locationManager.stopUpdatingHeading()
            guard let location = location else {
                return
            }
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            
            CLGeocoder().reverseGeocodeLocation(location) { (placeMark, error) in
                guard let placeMark = placeMark?.first else {
                    return
                }
                guard let placeName = placeMark.name else {
                    return
                }
                self.cityName = placeName
            }
            
            networkManager.getNewWeather(lat: lat, lon: lon, type: .metric, excludeKey: .minutely) { (weatherResponse, error) in
                if let error = error {
                    print(error)
                    
                    return
                }
                if let weatherResponse = weatherResponse {
                    self.currentWeather = weatherResponse.current
                    self.hourlyWeather = weatherResponse.hourly
                    self.dailyWeather = weatherResponse.daily
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                        self.collectionView.reloadData()
                        
                        guard let currentWeather = self.currentWeather else {
                            return
                        }
                        
                        self.headerView.cityLabel.text = self.cityName
                        self.headerView.summaryLabel.text = "\(currentWeather.weather[0].main)"
                        self.headerView.mainTempLabel.text = "\(Int(currentWeather.temp))°"
                        self.headerView.highestAndLowestTempLabel.text = "H:\(Int(self.dailyWeather[0].temp.max)) L:\(Int(self.dailyWeather[0].temp.min))"
                    }
                }
            }
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == self.tableView {
            let yHeaderView = self.view.frame.width*0.9 - (scrollView.contentOffset.y + self.view.frame.width*0.9)
            let hHeaderView = max(120, yHeaderView)
            let offset = scrollView.contentOffset.y + hHeaderView
            if hHeaderView >= 120 {
                self.collectionView.frame = CGRect(x: 0, y: offset, width: self.view.frame.width, height: 120)
                self.view.bringSubviewToFront(self.headerView)
                self.tableView.bringSubviewToFront(self.collectionView)
            } else {
                self.collectionView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 120)
            }
            self.headerView.frame = CGRect(x: 0, y: self.view.safeAreaInsets.top, width: self.view.frame.width, height: hHeaderView)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hourlyWeather.count == 0 ? 0 : 26
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let isCustom: Bool
        let isSunrise: Bool
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "hourlyCollectionCell", for: indexPath) as! HourlyWeatherCollectionViewCell
        guard let currentWeather = currentWeather else {
            return cell
        }
        let modelDayAndHourTime = convertSecsToDate(dateInSecs: hourlyWeather[indexPath.row].dt, dateFormat: "d HH")
        let currentDayAndHourTime = convertSecsToDate(dateInSecs: Int(Date().timeIntervalSince1970), dateFormat: "d HH")
        let modelHourTime = convertSecsToDate(dateInSecs: hourlyWeather[indexPath.row].dt, dateFormat: "HH")
        
        let sunriseDateTime = convertSecsToDate(dateInSecs: currentWeather.sunrise, dateFormat: "HH:mm")
        let sunsetDateTime = convertSecsToDate(dateInSecs: currentWeather.sunset, dateFormat: "HH:mm")
        
        isCustom = sunriseDateTime.hasPrefix(modelHourTime) || sunsetDateTime.hasPrefix(modelHourTime)
        isSunrise = isCustom && sunriseDateTime.hasPrefix(modelHourTime)
        
        if isCustom {
            if isSunrise {
//            if sunriseDateTime.hasPrefix(modelHourTime) {
                cell.hourLabel.text = sunriseDateTime
                cell.weatherIconImage.image = UIImage(systemName: "sunset.fill")?.withRenderingMode(.alwaysOriginal)
                cell.tempLabel.text = "Sunrise"
                return cell
            } else {
//            if sunsetDateTime.hasPrefix(modelHourTime) {
                cell.hourLabel.text = sunsetDateTime
                cell.weatherIconImage.image = UIImage(systemName: "sunset.fill")?.withRenderingMode(.alwaysOriginal)
                cell.tempLabel.text = "Sunset"
                return cell
            }
        }
        
        if modelDayAndHourTime == currentDayAndHourTime {
            cell.hourLabel.text = "Now"
            cell.hourLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        } else {
            cell.hourLabel.text = modelHourTime
            cell.hourLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        }
        let weatherId = hourlyWeather[indexPath.row].weather[0].id
        
        let iconName = self.weatherIdToIconName(weatherId: weatherId)
        cell.weatherIconImage.image = UIImage(systemName: iconName)?.withRenderingMode(.alwaysOriginal)
        cell.tempLabel.text = "\(Int(hourlyWeather[indexPath.row].temp))°"
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section > 0 {
            let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 1))
            view.backgroundColor = .gray
            return view
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 120
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return dailyWeather.count
        case 2:
            return 9
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            //just don't ask. All code in this task written so bad and needs to be refactored(or better be burned)
            return indexPath.row > 0 ? 40 : 0
        case 2:
            return 60
        default:
            return 80
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            if indexPath.row > 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "dailyCell", for: indexPath) as! DailyWeatherTableViewCell
                let modelDayTime = convertSecsToDate(dateInSecs: dailyWeather[indexPath.row].dt, dateFormat: "EEEE")
                cell.dayLabel.text = "\(modelDayTime)"
                
                let weatherId = dailyWeather[indexPath.row].weather[0].id
                let iconName = self.weatherIdToIconName(weatherId: weatherId)
                cell.iconImageView.image = UIImage(systemName: iconName)?.withRenderingMode(.alwaysOriginal)
                cell.highTempLabel.text = "\(Int(dailyWeather[indexPath.row].temp.max))"
                cell.lowTempLabel.text = "\(Int(dailyWeather[indexPath.row].temp.min))"
                return cell
            } else {
                return UITableViewCell(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
            }
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath) as! DefaultTableViewCell
            guard let currentWeather = currentWeather else {
                return cell
            }
            cell.label.text = "Today: \(currentWeather.weather[0].description) currently. It's \(Int(currentWeather.temp))°; the high today is \(Int(dailyWeather[0].temp.max))°."
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "statsCell", for: indexPath) as! StatsTableViewCell
            guard let currentWeather = currentWeather else {
                return cell
            }
            switch indexPath.row {
            case 0:
                cell.propertyNameLabel.text = "SUNRISE"
                cell.propertyValueLabel.text = "\(self.convertSecsToDate(dateInSecs: currentWeather.sunrise, dateFormat: "HH:MM"))"
            case 1:
                cell.propertyNameLabel.text = "SUNSET"
                cell.propertyValueLabel.text = "\(self.convertSecsToDate(dateInSecs: currentWeather.sunset, dateFormat: "HH:MM"))"
            case 2:
                cell.propertyNameLabel.text = "CHANCE OF RAIN"
                guard let pop = dailyWeather[0].pop else {
                    return UITableViewCell()
                }
                cell.propertyValueLabel.text = "\(Int(pop*100)) %"
            case 3:
                cell.propertyNameLabel.text = "HUMIDITY"
                cell.propertyValueLabel.text = "\(Int(currentWeather.humidity)) %"
            case 4:
                cell.propertyNameLabel.text = "WIND"
                cell.propertyValueLabel.text = "\(self.convertDegToCardinal(deg: currentWeather.wind_deg)) \(Int(currentWeather.wind_speed)) m/s"
            case 5:
                cell.propertyNameLabel.text = "FEELS LIKE"
                cell.propertyValueLabel.text = "\(Int(currentWeather.feels_like))°"
            case 6:
                cell.propertyNameLabel.text = "PRESSURE"
                cell.propertyValueLabel.text = "\(currentWeather.pressure*0.75) mm Hg"
            case 7:
                cell.propertyNameLabel.text = "VISIBILITY"
                cell.propertyValueLabel.text = "\(currentWeather.visibility/1000) km"
            case 8:
                cell.propertyNameLabel.text = "UV INDEX"
                cell.propertyValueLabel.text = "\(Int(currentWeather.uvi))"
            default:
                cell.propertyNameLabel.text = ""
                cell.propertyValueLabel.text = ""
            }
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath) as! DefaultTableViewCell
            cell.label.text = "Weather for \(cityName!)."
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath) as! DefaultTableViewCell
            return cell
        }
        
    }
    
    //TODO: delete these methods from vc
    
    func convertSecsToDate(dateInSecs: Int, dateFormat: String) -> String {
        let dateFormatter = DateFormatter()
        let timeIntervalInSecs = TimeInterval(dateInSecs)
        dateFormatter.dateFormat = dateFormat
        let date = Date(timeIntervalSince1970: timeIntervalInSecs)
        return dateFormatter.string(from: date)
    }
    
    //TODO: add all types of weather icons
    
    func weatherIdToIconName(weatherId: Int) -> String {
        var iconName = ""
        
        switch weatherId {
        case 200...232:
            iconName = "cloud.bolt.rain.fill"
        case 300...321:
            iconName = "cloud.drizzle.fill"
        case 500...531:
            iconName = "cloud.rain.fill"
        case 600...622:
            iconName = "snow"
        case 701...781:
            iconName = "cloud.fog.fill"
        case 800:
            iconName = "sun.max.fill"
        case 801:
            iconName = "cloud.sun.fill"
        case 802...804:
            iconName = "cloud.fill"
        default:
            return ""
        }
        return iconName
    }
    
    func convertDegToCardinal(deg: Int) -> String {
        let compassSector = Int(Double(deg) / 22.5 + 1)
        switch compassSector {
        case 1:
            return "N"
        case 2:
            return "NNE"
        case 3:
            return "NE"
        case 4:
            return "ENE"
        case 5:
            return "E"
        case 6:
            return "ESE"
        case 7:
            return "SE"
        case 8:
            return "SSE"
        case 9:
            return "S"
        case 10:
            return "SSW"
        case 11:
            return "SW"
        case 12:
            return "WSW"
        case 13:
            return "W"
        case 14:
            return "WNW"
        case 15:
            return "NW"
        case 16:
            return "NNW"
        case 17:
            return "N"
        default:
            return ""
        }
    }
    
}

