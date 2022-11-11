//
//  Constants.swift
//  TestTaskAvito
//
//  Created by Антон Денисюк on 11.11.2022.
//

import UIKit

enum Constants {
    enum Colors {
        static var backgroundApp = UIColor { traitCollection in
            switch traitCollection.userInterfaceStyle {
            case .dark:
                return UIColor.darkGray
            default:
                return UIColor.systemGray2
            }
        }

        static var backgroundPrimary = UIColor { traitCollection in
            switch traitCollection.userInterfaceStyle {
            case .dark:
                return UIColor.systemBackground
            default:
                return UIColor.systemGray4
            }
        }

        static var backgroundSecondary = UIColor { traitCollection in
            switch traitCollection.userInterfaceStyle {
            case .dark:
                return UIColor.systemGray5
            default:
                return UIColor.systemBackground
            }
        }

        static var backgroundMainBackView: UIColor? { .systemIndigo }
        static var backgroundNameBackView: UIColor? { .systemGreen }
        static var backgroundPhoneBackView: UIColor? { .systemPink }
        static var backgroundSkillsBackView: UIColor? { .systemBlue }

        static var borderMainBackView: CGColor? { #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1).cgColor }
        static var borderNameBackView: CGColor? { #colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 1).cgColor }
        static var borderPhoneBackView: CGColor? { #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1).cgColor }
        static var borderSkillsBackView: CGColor? { #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1).cgColor }
    }

    enum Fonts {
        static var aeroport28Bold: UIFont? {
            UIFont(name: "Aeroport-Bold", size: 28)
        }

        static var futura22Bold: UIFont? {
            UIFont(name: "Futura-Bold", size: 22)
        }

        static var americanTypewriter20Bold: UIFont? {
            UIFont(name: "AmericanTypewriter-Bold", size: 20)
        }

        static var markerFelt20Wide: UIFont? {
            UIFont(name: "MarkerFelt-Wide", size: 20)
        }
    }

    enum Text {
        static let customCell = "customCell"
        static let defaultCell = "defaultCell"
    }

    enum Images {
        static let avitoLogo = UIImage(named: "AvitoLogo")
        static let personCircle = UIImage(systemName: "person.circle")
        static let phoneCircle = UIImage(systemName: "phone.circle")
        static let gearCircle = UIImage(systemName: "gear.circle")
    }
}
