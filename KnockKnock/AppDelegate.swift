//
//  AppDelegate.swift
//  KnockKnock
//
//  Created by 다은 on 2023/06/23.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
//        UNUserNotificationCenter.current().delegate = self
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
                    if granted {
                        DispatchQueue.main.async {
                            application.registerForRemoteNotifications()
                        }
                    } else {
                        // 사용자가 알림 권한을 거부한 경우 처리
                    }
                }
        return true
    }
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
            let token = deviceToken.map { String(format: "%02.2hhx", $0) }.joined()
            print("Device Token: \(token)")
            // 서버에 디바이스 토큰을 등록하는 등의 작업을 수행
        }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "KnockKnock")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}
//extension AppDelegate: UNUserNotificationCenterDelegate {
//    func userNotificationCenter(_ center: UNUserNotificationCenter,
//                                willPresent notification: UNNotification,
//                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
//        completionHandler([.alert, .badge, .sound])
//    }
//
//    func userNotificationCenter(_ center: UNUserNotificationCenter,
//                                didReceive response: UNNotificationResponse,
//                                withCompletionHandler completionHandler: @escaping () -> Void) {
//
//        // deep link처리 시 아래 url값 가지고 처리
//        let url = response.notification.request.content.userInfo
//        // 푸시알림 클릭시 화면 이동
//        if let apsData = url["aps"] as? [String : AnyObject] {
//            if let alertData = apsData["alert"] as? [String : Any] {
//                // 내가 필요한 pidx라는 데이터는 aps > alert > pidx 에 들어있었다.
//                if let postIndex = alertData["pidx"] as? String {
////                     현재 뷰컨트롤러 구하기
////                    let currentVC = UIApplication.getMostTopViewController()
////                    // 이동해야 하는 뷰컨트롤러
////                    let postDetailVC = PostDetailViewController()
////
////                    // 이동해야 할 뷰컨트롤러에 필요한 데이터 매칭
////                    postDetailVC.user.sid = UserDefaults.standard.string(forKey: "Sid")
////                    postDetailVC.idx = try! Int(value: postIndex)
////
////                    // 현재 뷰컨에서 네비게이션컨트롤러로 이동해야할 뷰컨을 push해준다.
////                    currentVC?.navigationController?.pushViewController(postDetailVC, animated: true)
//                }
//            }
//        }
//        completionHandler()
//    }
//}

