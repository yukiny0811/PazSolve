//
//  SolveClass.swift
//  PazudoraSolve
//
//  Created by 桑島侑己 on 2017/11/02.
//  Copyright © 2017年 桑島侑己. All rights reserved.
//

import Foundation

class SolveClass{
    
    let viewController = ViewController()
    enum ComboCount{
        case c1
        case c2
        case c3
        case c4
        case c5
        case c6
        case err
    }
    let comboCountArray: [ComboCount] = [.c1,.c2,.c3,.c4,.c5,.c6]
    
    func solveClassMain(){
        var colorArray = viewController.colorArray
        colorArray.sort()
    }
    func f1(_ cA: [Int]) -> ComboCount{
        var colorArray = cA
        colorArray.sort()
        colorArray.reverse()
        var elseArray: [Int] = colorArray
        elseArray.remove(at: 0)
        if colorArray[0] >= 18 {
            return .c1
        } else if colorArray[0] == 17{
            for b in 0...3{
                if elseArray[b] == 3{
                    return .c2
                }
            }
            return .c1
        } else if colorArray[0] == 16{
            for b in 0...3{
                if elseArray[b] == 4{
                    return .c3
                } else if elseArray[b] == 3{
                    return .c3
                }
            }
            return .c2
        } else if colorArray[0] == 15{
            for b in 0...3{
                if elseArray[b] == 5{
                    return .c3
                } else if elseArray[b] == 4{
                    return .c3
                } else if elseArray[b] == 3{
                    return .c3
                }
            }
            return .c2
        } else if colorArray[0] == 14{
            for b in 0...3{
                if elseArray[b] == 6{
                    return .c3
                } else if elseArray[b] == 5{
                    return .c3
                } else if elseArray[b] == 4{
                    return .c3
                } else if elseArray[b] == 3{
                    return .c3
                }
            }
            return .c2
        } else if colorArray[0] == 13{
            for b in 0...3{
                if elseArray[b] == 7{
                    
                }
            }
        }
        return .err
    }
}
