//
//  ViewController.swift
//  PazudoraSolve
//
//  Created by 桑島侑己 on 2017/10/22.
//  Copyright © 2017年 桑島侑己. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    /* 11 12 13 14 15 
       21 22 23 24 25 
       31 32 33 34 35
       41 42 43 44 45 */
    
    @IBOutlet var modeChanger: UISegmentedControl!
    
    var p11 = UIImageView()
    var p12 = UIImageView()
    var p13 = UIImageView()
    var p14 = UIImageView()
    var p15 = UIImageView()
    
    var p21 = UIImageView()
    var p22 = UIImageView()
    var p23 = UIImageView()
    var p24 = UIImageView()
    var p25 = UIImageView()
    
    var p31 = UIImageView()
    var p32 = UIImageView()
    var p33 = UIImageView()
    var p34 = UIImageView()
    var p35 = UIImageView()
    
    var p41 = UIImageView()
    var p42 = UIImageView()
    var p43 = UIImageView()
    var p44 = UIImageView()
    var p45 = UIImageView()
    
    var colorBoard = UIImageView()
    
    var passTouch = CGPoint()
    var passTouchM = CGPoint()
    var passMovingTouch = UITouch()
    
    func judgeColor(){
        //from photo (if possible)
    }
    enum PosNum{
        case n11
        case n12
        case n13
        case n14
        case n15
        
        case n21
        case n22
        case n23
        case n24
        case n25
        
        case n31
        case n32
        case n33
        case n34
        case n35
        
        case n41
        case n42
        case n43
        case n44
        case n45
    }
    
    enum ColorType{
        case red
        case blue
        case light
        case dark
        case green
        case clear
    }

    func detectPosition(_ touch: CGPoint) -> PosNum{
        if touch.y < 439{
            if touch.x < 77{
                return .n11
            } else if touch.x >= 77 && touch.x < 150{
                return .n12
            } else if touch.x >= 150 && touch.x < 224{
                return .n13
            } else if touch.x >= 224 && touch.x < 298{
                return .n14
            } else if touch.x >= 298{
                return .n15
            }
        } else if touch.y >= 439 && touch.y < 512{
            if touch.x < 77{
                return .n21
            } else if touch.x >= 77 && touch.x < 150{
                return .n22
            } else if touch.x >= 150 && touch.x < 224{
                return .n23
            } else if touch.x >= 224 && touch.x < 298{
                return .n24
            } else if touch.x >= 298{
                return .n25
            }
        } else if touch.y >= 512 && touch.y < 586{
            if touch.x < 77{
                return .n31
            } else if touch.x >= 77 && touch.x < 150{
                return .n32
            } else if touch.x >= 150 && touch.x < 224{
                return .n33
            } else if touch.x >= 224 && touch.x < 298{
                return .n34
            } else if touch.x >= 298{
                return .n35
            }
        } else if touch.y >= 586{
            if touch.x < 77{
                return .n41
            } else if touch.x >= 77 && touch.x < 150{
                return .n42
            } else if touch.x >= 150 && touch.x < 224{
                return .n43
            } else if touch.x >= 224 && touch.x < 298{
                return .n44
            } else if touch.x >= 298{
                return .n45
            }
        }
        
        return .n12 //change here
    }
    
    var selectedColor: ColorType!
    
    func changeColor(_ sender: UIPanGestureRecognizer){
        if judgeMode() == .Color{
//            let loc: CGPoint = sender.location(in: self.view)
            let location: CGPoint = sender.translation(in: self.view)
            print(location)
            if location.x >= 5 || location.x <= -5 || location.y >= 5 || location.y <= 5{
                colorBoard.layer.position = detectFrameCenter(detectPosition(passTouch))
                self.view.bringSubview(toFront: colorBoard)
                colorBoard.isHidden = false
                print(detectAngle(detectPosition(passTouch), passMovingTouch))
                switch detectAngle(detectPosition(passTouch), passMovingTouch) {
                case .up:
                    colorBoard.image = UIImage(named: "PazChangeColorSelectedUp")
//                    setColor(detectPosition(passTouch), .red)
                    selectedColor = .red
                case .right:
                    colorBoard.image = UIImage(named: "PazChangeColorSelectedRight")
//                    setColor(detectPosition(passTouch), .blue)
                    selectedColor = .blue
                case .left:
                    colorBoard.image = UIImage(named: "PazChangeColorSelectedLeft")
//                    setColor(detectPosition(passTouch), .green)
                    selectedColor = .green
                case .rightDown:
                    colorBoard.image = UIImage(named: "PazChangeColorSelectedRightDown")
//                    setColor(detectPosition(passTouch), .light)
                    selectedColor = .light
                case .leftDown:
                    colorBoard.image = UIImage(named: "PazChangeColorSelectedLeftDown")
//                    setColor(detectPosition(passTouch), .dark)
                    selectedColor = .dark
                default:
                    colorBoard.image = UIImage(named: "PazChangeColor")
                }
            }
        }
    }
    func setColor(_ n: PosNum, _ ct: ColorType){
        var c: String = ""
        switch ct {
        case .red:
            c = "PazColorRed"
        case .blue:
            c = "PazColorBlue"
        case .green:
            c = "PazColorGreen"
        case .light:
            c = "PazColorYellow"
        case .dark:
            c = "PazColorPurple"
        default:
            break
        }
        switch n {
        case .n11:
            p11.image = UIImage(named: c)
        case .n12:
            p12.image = UIImage(named: c)
        case .n13:
            p13.image = UIImage(named: c)
        case .n14:
            p14.image = UIImage(named: c)
        case .n15:
            p15.image = UIImage(named: c)
        case .n21:
            p21.image = UIImage(named: c)
        case .n22:
            p22.image = UIImage(named: c)
        case .n23:
            p23.image = UIImage(named: c)
        case .n24:
            p24.image = UIImage(named: c)
        case .n25:
            p25.image = UIImage(named: c)
        case .n31:
            p31.image = UIImage(named: c)
        case .n32:
            p32.image = UIImage(named: c)
        case .n33:
            p33.image = UIImage(named: c)
        case .n34:
            p34.image = UIImage(named: c)
        case .n35:
            p35.image = UIImage(named: c)
        case .n41:
            p41.image = UIImage(named: c)
        case .n42:
            p42.image = UIImage(named: c)
        case .n43:
            p43.image = UIImage(named: c)
        case .n44:
            p44.image = UIImage(named: c)
        case .n45:
            p45.image = UIImage(named: c)
        default:
            break
        }
    }
    enum Angle{
        case up
        case right
        case rightDown
        case left
        case leftDown
        case error
    }
    func detectAngle(_ n: PosNum, _ touchPos: UITouch) -> Angle{
        let touchLoc = touchPos.location(in: self.view)
        let relativeLocX = touchLoc.x - detectFrameCenter(n).x
        let relativeLocY = detectFrameCenter(n).y - touchLoc.y
        print(relativeLocX, relativeLocY)
        if relativeLocX != 0 && relativeLocY != 0{
            if relativeLocY > 0{
                if relativeLocX > 0{
                    if relativeLocY / relativeLocX >= 1.34615385{ //up right
                        print("now faced up")
                        return .up
                    }
                    if relativeLocY / relativeLocX <= 1.34615385{ //right up
                        return .right
                    }
                }
                if relativeLocX < 0{
                    if relativeLocY / relativeLocX <= -1.34615385{ //up left
                        return .up
                    }
                    if relativeLocY / relativeLocX >= -1.34615385{ //left up
                        return .left
                    }
                }
            } else if relativeLocY < 0{
                if relativeLocX > 0{
                    if relativeLocY / relativeLocX >= -0.36111111{ //right down
                        return .right
                    }
                    if relativeLocY / relativeLocX <= -0.36111111{ //rightDown
                        return .rightDown
                    }
                }
                if relativeLocX < 0{
                    if relativeLocY / relativeLocX <= 0.36111111{ //left down
                        return .left
                    }
                    if relativeLocY / relativeLocX >= 0.36111111{ //leftDown
                        return .leftDown
                    }
                }
            }
        } else if relativeLocX == 0{
            if relativeLocY > 0{
                return .up
            }
        } else if relativeLocY == 0{
            if relativeLocX > 0{
                return .right
            }
            if relativeLocX < 0{
                return .left
            }
        }
        return .error
    }
    func detectFrameCenter(_ n: PosNum) -> CGPoint{
        switch n {
        case .n11:
            return CGPoint(x: 39, y: 402)
        case .n12:
            return CGPoint(x: 114, y: 402)
        case .n13:
            return CGPoint(x: 188, y: 402)
        case .n14:
            return CGPoint(x: 262, y: 402)
        case .n15:
            return CGPoint(x: 336, y: 402)
        case .n21:
            return CGPoint(x: 39, y: 476)
        case .n22:
            return CGPoint(x: 114, y: 476)
        case .n23:
            return CGPoint(x: 188, y: 476)
        case .n24:
            return CGPoint(x: 262, y: 476)
        case .n25:
            return CGPoint(x: 336, y: 476)
        case .n31:
            return CGPoint(x: 39, y: 550)
        case .n32:
            return CGPoint(x: 114, y: 550)
        case .n33:
            return CGPoint(x: 188, y: 550)
        case .n34:
            return CGPoint(x: 262, y: 550)
        case .n35:
            return CGPoint(x: 336, y: 550)
        case .n41:
            return CGPoint(x: 39, y: 624)
        case .n42:
            return CGPoint(x: 114, y: 624)
        case .n43:
            return CGPoint(x: 188, y: 624)
        case .n44:
            return CGPoint(x: 262, y: 624)
        case .n45:
            return CGPoint(x: 336, y: 624)
        default:
            break
        }
        return CGPoint(x: 0, y: 0)
    }
//    func showDirectionBoard(_ sender: UILongPressGestureRecognizer){
//        if judgeMode() == .Color{
//            print("longPress")
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let viewWidth = self.view.frame.size.width
//        let viewHeight = self.view.frame.size.height
        
        colorBoard.image = UIImage(named: "PazChangeColor")
        colorBoard.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        self.view.addSubview(colorBoard)
        colorBoard.isHidden = true
        
        let pan = UIPanGestureRecognizer(target: self, action: #selector(self.changeColor(_:)))
        self.view.addGestureRecognizer(pan)
        pan.cancelsTouchesInView = false
        
        addImageToVDL()
        
        selectedImage.image = UIImage(named: "PazClear")
        selectedImage.frame = CGRect(x: 0, y: 0, width: 75, height: 75)
        self.view.addSubview(selectedImage)
        self.view.bringSubview(toFront: selectedImage)
        
//        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(self.showDirectionBoard(_:)))
//        self.view.addGestureRecognizer(longPress)
//        longPress.cancelsTouchesInView = false
//        longPress.minimumPressDuration = 0.3
//        longPress.allowableMovement = 20
    }
    func addImageToVDL(){
        p11.image = UIImage(named: "PazClear")
        p11.frame = CGRect(x: 2, y: 364, width: 75, height: 75)
        self.view.addSubview(p11)
        p12.image = UIImage(named: "PazClear")
        p12.frame = CGRect(x: 76, y: 364, width: 75, height: 75)
        self.view.addSubview(p12)
        p13.image = UIImage(named: "PazClear")
        p13.frame = CGRect(x: 150, y: 364, width: 75, height: 75)
        self.view.addSubview(p13)
        p14.image = UIImage(named: "PazClear")
        p14.frame = CGRect(x: 224, y: 364, width: 75, height: 75)
        self.view.addSubview(p14)
        p15.image = UIImage(named: "PazClear")
        p15.frame = CGRect(x: 298, y: 364, width: 75, height: 75)
        self.view.addSubview(p15)
        
        p21.image = UIImage(named: "PazClear")
        p21.frame = CGRect(x: 2, y: 438, width: 75, height: 75)
        self.view.addSubview(p21)
        p22.image = UIImage(named: "PazClear")
        p22.frame = CGRect(x: 76, y: 438, width: 75, height: 75)
        self.view.addSubview(p22)
        p23.image = UIImage(named: "PazClear")
        p23.frame = CGRect(x: 150, y: 438, width: 75, height: 75)
        self.view.addSubview(p23)
        p24.image = UIImage(named: "PazClear")
        p24.frame = CGRect(x: 224, y: 438, width: 75, height: 75)
        self.view.addSubview(p24)
        p25.image = UIImage(named: "PazClear")
        p25.frame = CGRect(x: 298, y: 438, width: 75, height: 75)
        self.view.addSubview(p25)
        
        p31.image = UIImage(named: "PazClear")
        p31.frame = CGRect(x: 2, y: 512, width: 75, height: 75)
        self.view.addSubview(p31)
        p32.image = UIImage(named: "PazClear")
        p32.frame = CGRect(x: 76, y: 512, width: 75, height: 75)
        self.view.addSubview(p32)
        p33.image = UIImage(named: "PazClear")
        p33.frame = CGRect(x: 150, y: 512, width: 75, height: 75)
        self.view.addSubview(p33)
        p34.image = UIImage(named: "PazClear")
        p34.frame = CGRect(x: 224, y: 512, width: 75, height: 75)
        self.view.addSubview(p34)
        p35.image = UIImage(named: "PazClear")
        p35.frame = CGRect(x: 298, y: 512, width: 75, height: 75)
        self.view.addSubview(p35)
        
        p41.image = UIImage(named: "PazClear")
        p41.frame = CGRect(x: 2, y: 586, width: 75, height: 75)
        self.view.addSubview(p41)
        p42.image = UIImage(named: "PazClear")
        p42.frame = CGRect(x: 76, y: 586, width: 75, height: 75)
        self.view.addSubview(p42)
        p43.image = UIImage(named: "PazClear")
        p43.frame = CGRect(x: 150, y: 586, width: 75, height: 75)
        self.view.addSubview(p43)
        p44.image = UIImage(named: "PazClear")
        p44.frame = CGRect(x: 224, y: 586, width: 75, height: 75)
        self.view.addSubview(p44)
        p45.image = UIImage(named: "PazClear")
        p45.frame = CGRect(x: 298, y: 586, width: 75, height: 75)
        self.view.addSubview(p45)
    }
    
    func snapColor(){
        if judgeMode() == .Move{
            selectedImage.layer.position = detectFrameCenter(detectPosition(selectedImage.layer.position))
        }
    }
    
    func detectColorType(_ i: UIImageView) -> ColorType{
        if i.image == UIImage(named: "PazColorRed"){
            return .red
        } else if i.image == UIImage(named: "PazColorBlue"){
            return .blue
        } else if i.image == UIImage(named: "PazColorGreen"){
            return .green
        } else if i.image == UIImage(named: "PazColorYellow"){
            return .light
        } else if i.image == UIImage(named: "PazColorPurple"){
            return .dark
        }
        return .clear
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    enum Mode{
        case Color
        case Move
    }
    func judgeMode() -> Mode{
        let mode = modeChanger.selectedSegmentIndex
        switch mode {
        case 0:
            print("Color Mode")
            return .Color
        case 1:
            print("Move Mode")
            return .Move
        default:
            return .Color
        }
    }
    func posToImg(_ n: PosNum) -> UIImageView{
        switch n {
        case .n11:
            return p11
        case .n12:
            return p12
        case .n13:
            return p13
        case .n14:
            return p14
        case .n15:
            return p15
        case .n21:
            return p21
        case .n22:
            return p22
        case .n23:
            return p23
        case .n24:
            return p24
        case .n25:
            return p25
        case .n31:
            return p31
        case .n32:
            return p32
        case .n33:
            return p33
        case .n34:
            return p34
        case .n35:
            return p35
        case .n41:
            return p41
        case .n42:
            return p42
        case .n43:
            return p43
        case .n44:
            return p44
        case .n45:
            return p45
        default:
            break
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if judgeMode() == .Move{
            print("touchesBegan")
            let touch = touches.first!
            passTouchM = touch.location(in: self.view)
            selectedImage.image = posToImg(detectPosition(passTouchM)).image
            posToImg(detectPosition(passTouchM)).image = UIImage(named: "PazClear")
            posNumHistory = detectPosition(passTouchM)
        }
        if judgeMode() == .Color{
            print("touchesBegan")
            let touch = touches.first!
            passTouch = touch.location(in: self.view)
        }
    }
    var selectedImage = UIImageView()
    var posNumHistory: PosNum!
    var passMovingTouchLoc = CGPoint()
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if judgeMode() == .Move{
            print("touchesMoved")
            let touch = touches.first!
            passMovingTouchLoc = touch.location(in: self.view)
            let locationX = touch.location(in: self.view).x
            let locationY = touch.location(in: self.view).y
//            selectedImage = posToImg(detectPosition(passTouchM))
            selectedImage.layer.position.x = locationX
            selectedImage.layer.position.y = locationY
            if detectPosition(passMovingTouchLoc) != posNumHistory{
                posToImg(posNumHistory).image = posToImg(detectPosition(passMovingTouchLoc)).image
                posToImg(detectPosition(passMovingTouchLoc)).image = UIImage(named: "PazClear")
                posNumHistory = detectPosition(passMovingTouchLoc)
            }
        }
        if judgeMode() == .Color{
            print("touchesMoved")
            let touch = touches.first!
            passMovingTouch = touch
        }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if judgeMode() == .Move{
            print("touchesEnded")
            snapColor()
            let touch = touches.first!
            let passTouchE = touch.location(in: self.view)
            posToImg(detectPosition(passTouchE)).image = selectedImage.image
            selectedImage.image = UIImage(named: "PazClear")
            dicPosAndColor()
        }
        if judgeMode() == .Color{
            colorBoard.isHidden = true
            colorBoard.image = UIImage(named: "PazChangeColor")
            setColor(detectPosition(passTouch), selectedColor)
        }
    }
    var posColor: [PosNum: ColorType] = [:]
    func dicPosAndColor(){
        for a in posNumArray{
            posColor[a] = detectColorType(posToImg(a))
        }
    }
    var redCount = 0
    var blueCount = 0
    var greenCount = 0
    var lightCount = 0
    var darkCount = 0
    var hasClear: Bool = false
    func countEachColor(_ c: ColorType){
        switch c {
        case .red:
            redCount += 1
        case .blue:
            blueCount += 1
        case .green:
            greenCount += 1
        case .light:
            lightCount += 1
        case .dark:
            darkCount += 1
        default:
            hasClear = true
        }
    }
    func resetCount(){
        redCount = 0
        blueCount = 0
        greenCount = 0
        lightCount = 0
        darkCount = 0
        hasClear = false
    }
    func countEachColorWithPos(){
        for a in 0...19{
            countEachColor(detectColorType(posToImg(posNumArray[a])))
        }
    }
    @IBAction func solve(){
        solveAll()
    }
    public var colorArray: [Int] = []
    func solveAll(){
        resetCount()
        countEachColorWithPos()
        guard hasClear == false else {
            return
        }
        var posPointArray: [CGPoint] = []
        colorArray = [redCount, blueCount, greenCount, lightCount, darkCount]
        print("solveAll: \(colorArray)")
//        for a in 0...4{
//            if colorArray[a] >= 3{
//                posPointArray.append(checkAveragePosition(colorTypeArray[a]))
//            }
//        }
        for aaa in 0...posPointArray.count - 1{
            print(posPointArray[aaa])
        }
    }
    let posNumArray: [PosNum] = [.n11,.n12,.n13,.n14,.n15,.n21,.n22,.n23,.n24,.n25,.n31,.n32,.n33,.n34,.n35,.n41,.n42,.n43,.n44,.n45]
    let colorTypeArray: [ColorType] = [.red,.blue,.green,.light,.dark]
    enum error: Error{
        case errorHasClear
    }
    func checkAveragePosition(_ c: ColorType) -> CGPoint{
        var colorPNArray: [PosNum] = []
        for a in 0...19{
            if detectColorType(posToImg(posNumArray[a])) == c{
                colorPNArray.append(posNumArray[a])
                print(colorPNArray)
            }
        }
        var sumX: CGFloat = 0
        var sumY: CGFloat = 0
        for b in 0...colorPNArray.count - 1{
            sumX += detectFrameCenter(colorPNArray[b]).x
            sumY += detectFrameCenter(colorPNArray[b]).y
        }
        var averageX: CGFloat = 0
        var averageY: CGFloat = 0
        averageX = sumX / CGFloat(colorPNArray.count)
        averageY = sumY / CGFloat(colorPNArray.count)
        return CGPoint(x: averageX, y: averageY)
    }


}

