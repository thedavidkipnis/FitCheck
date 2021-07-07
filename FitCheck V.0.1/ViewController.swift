//
//  ViewController.swift
//  FitCheck V.0.1
//
//  Created by David Kipnis and Hannah Buzard on 4/7/21.
//  Copyright © 2021 David Kipnis and Hannah Buzard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var isOn: Bool = false
    var cards: [Card] = []
    var labelStrings = [String]()
    var imageCount = 1
    var lastCard: LastCard = LastCard.sharedInstance
    public var lastCardCount = 0
    
    var filterMenu = UIView()
    var filterMenuTable = UITableView()
    var filterMenuHeight: CGFloat = 0
     
    //animating nav bar button clicks
    @IBAction func animateButton(sender: UIButton) {
        sender.transform = CGAffineTransform(scaleX: 0.85, y: 0.85)
        UIView.animate(withDuration: 0.5,
                                   delay: 0,
                                   usingSpringWithDamping: CGFloat(0.20),
                                   initialSpringVelocity: CGFloat(6.0),
                                   options: UIView.AnimationOptions.allowUserInteraction,
                                   animations: {
                                    sender.transform = CGAffineTransform.identity
            },
                                   completion: { Void in()  }
        )
    }
    
    //clicking the socials page button
    @IBAction func SocialClick(_ sender: UIButton) {
        isOn.toggle()
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "social") as! SocialsPage
        self.view.window?.rootViewController = nextViewController
        self.present(nextViewController, animated: true, completion: {
            nextViewController.presentationController?.presentedView?.gestureRecognizers?[0].isEnabled = false
        })}
    
    //clicking the home page button
    @IBAction func mainButtonPress(_ sender: UIButton) {
        isOn.toggle()
    }
    
    //clicking the closet page button
    @IBAction func ClosetClick(_ sender: UIButton) {
        isOn.toggle()
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "closet") as! Closet
        self.view.window?.rootViewController = nextViewController
        self.present(nextViewController, animated: true, completion: {
            nextViewController.presentationController?.presentedView?.gestureRecognizers?[0].isEnabled = false
        })
    }
    
    //clicking the likes page button
    @IBAction func LikesClick(_ sender: UIButton) {
        isOn.toggle()
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "likes") as! LikesPage
        self.view.window?.rootViewController = nextViewController
        self.present(nextViewController, animated: true, completion: {
            nextViewController.presentationController?.presentedView?.gestureRecognizers?[0].isEnabled = false
        })}
    
    //clicking the filter button
    @IBAction func FilterClick(_ sender: UIButton) {
        filterMenuHeight = view.bounds.size.height - 100
        let window = self.view
        filterMenu.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        filterMenu.frame = self.view.frame
        window?.addSubview(filterMenu)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(slideUpViewTapped))
        filterMenu.addGestureRecognizer(tapGesture)
        
        filterMenu.alpha = 0
        UIView.animate(withDuration: 0.5,
                       delay: 0, usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 1.0,
                       options: .curveEaseInOut, animations: {
          self.filterMenu.alpha = 0.8
        }, completion: nil)
        
        let screenSize = UIScreen.main.bounds.size
        filterMenuTable.frame = CGRect(x: 0, y: screenSize.height, width: screenSize.width, height: filterMenuHeight)
        filterMenuTable.separatorStyle = .none
        window?.addSubview(filterMenuTable)
        
        UIView.animate(withDuration: 0.5,
                       delay: 0, usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 1.0,
                       options: .curveEaseInOut, animations: {
          self.filterMenu.alpha = 0.8
          self.filterMenuTable.frame = CGRect(x: 0, y: screenSize.height - self.filterMenuHeight, width: screenSize.width, height: self.filterMenuHeight)
        }, completion: nil)
    }
    
    //function for sliding the filter menu
    @objc func slideUpViewTapped() {
        filterMenuHeight = view.bounds.size.height - 100
        let screenSize = UIScreen.main.bounds.size
        UIView.animate(withDuration: 0.5,
                       delay: 0, usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 1.0,
                       options: .curveEaseInOut, animations: {
          self.filterMenu.alpha = 0
            self.filterMenuTable.frame = CGRect(x: 0, y: screenSize.height, width: screenSize.width, height: self.filterMenuHeight)
          }, completion: nil)
    }
    
    //outlets for the card and the two like icons on the card for swiping
    @IBOutlet weak var imageLabel: UILabel!
    @IBOutlet weak var Card: UIImageView!
    @IBOutlet weak var likeIcon: UIImageView!
    @IBOutlet weak var dislikeIcon: UIImageView!
    @IBOutlet weak var navBar: UIView!
    @IBOutlet weak var logoLabel: UILabel!
    //outlets for buttons
    @IBOutlet weak var socialsButton: UIButton!
    @IBOutlet weak var mainButton: UIButton!
    @IBOutlet weak var closetButton: UIButton!
    @IBOutlet weak var likesButton: UIButton!
    @IBOutlet weak var filterButton: UIButton!
    
    //card Swiping
    @IBAction func panCard(_ sender: UIPanGestureRecognizer) {
        var leftRotate = false
        var regenFlag = false
        let card = sender.view!
        let ogy = self.view.center.y - 50
        let point = sender.translation(in: view)
        let xFromCenter = card.center.x - view.center.x
            
        if xFromCenter > 0 {
            likeIcon.alpha = xFromCenter / 75
            dislikeIcon.alpha = 0
        } else {
            dislikeIcon.alpha = xFromCenter / -75
            likeIcon.alpha = 0
        }
        
        card.center = CGPoint(x: view.center.x + point.x, y: view.center.y + point.y - 50)
        
        //when user stops holding the card, check if it passed boundaries
        if sender.state == UIGestureRecognizer.State.ended {
            //move card off screen to the left
            if card.center.x < 75 {
                leftRotate = true
                UIView.animate(withDuration: 0.2, animations: {
                    card.center = CGPoint(x: card.center.x - 200, y: card.center.y + 75)
                    card.transform = card.transform.rotated(by: -.pi/10)
                    card.alpha = 0
                })
                imageCount = imageCount + 1
                regenFlag = true
            }
            //move card off screen to the right
            else if card.center.x > (view.frame.width - 75) {
                leftRotate = false
                UIView.animate(withDuration: 0.2, animations: {
                    card.center = CGPoint(x: card.center.x + 200, y: card.center.y + 75)
                    card.transform = card.transform.rotated(by: .pi/10)
                    card.alpha = 0
                })
                imageCount = imageCount + 1
                regenFlag = true
            }
            
            //checking if we need to generate a new card
            //case 1 - no need to regen card
            if regenFlag == false {
            UIView.animate(withDuration: 0.2, animations: {
                card.center = CGPoint(x: self.view.center.x, y: ogy)
                self.likeIcon.alpha = 0
                self.dislikeIcon.alpha = 0
                })
            }
            //case 2 - need to regen card
            else {
                if imageCount > cards.count - 1 {
                    imageCount = 1
                }
                let cardIcon = cards[imageCount - 1]
                likeIcon.alpha = 0
                dislikeIcon.alpha = 0
                card.center = CGPoint(x: self.view.center.x, y: ogy)
                if leftRotate == true {
                    card.transform = card.transform.rotated(by: .pi/10)
                } else {
                    card.transform = card.transform.rotated(by: -.pi/10)
                }
                card.alpha = 1
                
                //setting new card image
                let image = UIImage(named: cardIcon.fileName)
                Card.image = image
                
                //set label for card to be the product name
                imageLabel.text = (cardIcon.labelName)
                
                //rearranging the label and like/dislike buttons
                Card.bringSubviewToFront(imageLabel)
                Card.bringSubviewToFront(likeIcon)
                Card.bringSubviewToFront(dislikeIcon)
                
                //setting memory for last card count
                lastCard.lastCardCount = imageCount - 1
            }
        }
    }
    
    //main start up method for loading app
    override func viewDidLoad() {
        lastCardCount = lastCard.lastCardCount
        imageCount = lastCardCount + 1
        imageLabel.adjustsFontSizeToFitWidth = true
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        animateButton(sender: mainButton)
        mainButton.tintColor = UIColor.systemYellow
        view.sendSubviewToBack(logoLabel)
        view.sendSubviewToBack(filterButton)
        
        // Get each image in images folder and create array of images
        labelStrings = ["H&M Purple Tie Crop Top", "LuluLemon Reflective Trenchcoat", "Lululemon All Sport Bra III","Womens Yellow Old Skool vans","American Eagle Lightwash Jeans", "LuluLemon Wunder Under High-Rise", "American Eagle Brown Knit Sweater","Lulus White Lace Dress", "American Eagle Tri-Color Knit Sweater",
        "H&M ACDC Crop Top", "Womens Dr. Martens boot"]
        let fileManager = FileManager.default
        let bundleURL = Bundle.main.bundleURL
        let assetURL = bundleURL.appendingPathComponent("images.bundle")

        do {
          let contents = try fileManager.contentsOfDirectory(at: assetURL, includingPropertiesForKeys: [URLResourceKey.nameKey, URLResourceKey.isDirectoryKey], options: .skipsHiddenFiles)
            //print("Length of contents")
            //print(contents.count)
            for i in 0 ... contents.count - 1
          {
            //print(contents[i])
            let filename = contents[i].lastPathComponent
            let splitString = filename.components(separatedBy: ".")
            let file: String = splitString[0]
                cards.append(FitCheck_V_0_1.Card(fileName: file, labelName: labelStrings[i]))
          }
        }
        catch let error as NSError {
          print(error)
        }
        
        //generating and adding image to first card
        var firstcard : Card
        firstcard = cards[lastCardCount]
        let image = UIImage(named: firstcard.fileName)
        Card.image = image
        Card.contentMode = .scaleAspectFill
        Card.layer.masksToBounds = true
        Card.layer.borderWidth = 1
        Card.layer.borderColor = UIColor.lightGray.cgColor
        imageLabel.text = (firstcard.labelName)
        imageLabel.backgroundColor = UIColor.white
        imageLabel.layer.masksToBounds = true
        imageLabel.layer.borderWidth = 1
        imageLabel.layer.borderColor = UIColor.lightGray.cgColor
        imageLabel.layer.cornerRadius = 40
        imageLabel.textAlignment = .center
        Card.bringSubviewToFront(imageLabel)
        Card.bringSubviewToFront(likeIcon)
        Card.bringSubviewToFront(dislikeIcon)
    }
}

