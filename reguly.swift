//
//  reguly.swift
//  projectchess
//
//  Created by Jan Tlaga on 23/06/2022.
//

import Foundation
import UIKit
public class reguly{
    
    
    
    func funkolor(tag:Int, ustawieniefigur:[Int:String]) -> String
    {
        if ustawieniefigur[tag]?[0] == "C"
        {
            return "C"
        }
        else if ustawieniefigur[tag]?[0] != nil
        {
            return "B"
        }
        else
        {
            return "N"
        }
    }
    
    func czyatakowane(pole: Int, kolor: String, zapisgry:[Int], ustawieniefigur:[Int:String]) -> Bool
    {
        let y: Int = (pole-1)/8+1
        var posunieca = pole
        var x = pole
        while x>8
        {
            x = x-8
        }
       
        posunieca = posunieca-1
        if pole<1 || pole>64
        {
            return false
        }
        for _ in 1..<x
        {
            if zapisgry[zapisgry.count-65+posunieca] == 0
            {
                
                posunieca = posunieca-1
            }
            else if funkolor(tag: zapisgry[zapisgry.count-65+posunieca], ustawieniefigur: ustawieniefigur) != kolor
            {
                if ustawieniefigur[zapisgry[zapisgry.count-65+posunieca]]?[0]=="W" || ustawieniefigur[zapisgry[zapisgry.count-65+posunieca]]?[1]=="W" || ustawieniefigur[zapisgry[zapisgry.count-65+posunieca]]?[0]=="Q" || ustawieniefigur[zapisgry[zapisgry.count-65+posunieca]]?[1]=="Q"
                {
                    return true
                }
            }
            else
            {
                break
            }
        }
        posunieca = pole+1
        for _ in 1..<(9-x)
        {
            if zapisgry[zapisgry.count-65+posunieca] == 0
            {
                posunieca = posunieca+1
            }
            else if funkolor(tag: zapisgry[zapisgry.count-65+posunieca], ustawieniefigur: ustawieniefigur) != kolor
            {
                if ustawieniefigur[zapisgry[zapisgry.count-65+posunieca]]?[0]=="W" || ustawieniefigur[zapisgry[zapisgry.count-65+posunieca]]?[1]=="W" || ustawieniefigur[zapisgry[zapisgry.count-65+posunieca]]?[0]=="Q" || ustawieniefigur[zapisgry[zapisgry.count-65+posunieca]]?[1]=="Q"
                {
                    return true
                }
                break
            }
            else
            {
                break
            }
        }
        posunieca = pole+8
        for _ in 1..<9-y
        {
            
            if zapisgry[zapisgry.count-65+posunieca] == 0
            {
                posunieca = posunieca+8
            }
            else if funkolor(tag: zapisgry[zapisgry.count-65+posunieca], ustawieniefigur: ustawieniefigur) != kolor
            {
                if ustawieniefigur[zapisgry[zapisgry.count-65+posunieca]]?[0]=="W" || ustawieniefigur[zapisgry[zapisgry.count-65+posunieca]]?[1]=="W" || ustawieniefigur[zapisgry[zapisgry.count-65+posunieca]]?[0]=="Q" || ustawieniefigur[zapisgry[zapisgry.count-65+posunieca]]?[1]=="Q"
                {
                    return true
                }
                break
            }
            else
            {
                break
            }
        }
        posunieca = pole-8
        for _ in 1..<y
        {
            if zapisgry[zapisgry.count-65+posunieca] == 0
            {
                posunieca = posunieca-8
            }
            else if funkolor(tag: zapisgry[zapisgry.count-65+posunieca], ustawieniefigur: ustawieniefigur) != kolor
            {
                if ustawieniefigur[zapisgry[zapisgry.count-65+posunieca]]?[0]=="W" || ustawieniefigur[zapisgry[zapisgry.count-65+posunieca]]?[1]=="W" || ustawieniefigur[zapisgry[zapisgry.count-65+posunieca]]?[0]=="Q" || ustawieniefigur[zapisgry[zapisgry.count-65+posunieca]]?[1]=="Q"
                {
                    return true
                }
                break
            }
            else
            {
                break
            }
        }
        var it = y
        if x<y
        {
            it  = x
        }
        if it != 1
        {
            posunieca = pole-9
            for _ in 1..<it
            {
                if zapisgry[zapisgry.count-65+posunieca] == 0
                {
                    posunieca=posunieca-9
                }
                
                else if funkolor(tag: zapisgry[zapisgry.count-65+posunieca], ustawieniefigur: ustawieniefigur) != kolor
                {
                    if ustawieniefigur[zapisgry[zapisgry.count-65+posunieca]]?[0]=="G" || ustawieniefigur[zapisgry[zapisgry.count-65+posunieca]]?[1]=="G" || ustawieniefigur[zapisgry[zapisgry.count-65+posunieca]]?[0]=="Q" || ustawieniefigur[zapisgry[zapisgry.count-65+posunieca]]?[1]=="Q"
                    {
                        return true
                    }
                    break
                }
                else
                {
                    break
                }
            }
        }
        it = 9-y
        if x>y
        {
            it  = 9-x
        }
        if it != 8
        {
            posunieca = pole+9
            for _ in 1..<it
            {
                if zapisgry[zapisgry.count-65+posunieca] == 0
                {
                    posunieca=posunieca+9
                }
                
                else if funkolor(tag: zapisgry[zapisgry.count-65+posunieca], ustawieniefigur: ustawieniefigur) != kolor
                {
                    if ustawieniefigur[zapisgry[zapisgry.count-65+posunieca]]?[0]=="G" || ustawieniefigur[zapisgry[zapisgry.count-65+posunieca]]?[1]=="G" || ustawieniefigur[zapisgry[zapisgry.count-65+posunieca]]?[0]=="Q" || ustawieniefigur[zapisgry[zapisgry.count-65+posunieca]]?[1]=="Q"
                    {
                        return true
                    }
                    break
                }
                else
                {
                    break
                }
            }
        }
        it = 9-y
        if x<it
        {
            it = x
        }
            
            posunieca = pole+7
            for _ in 1..<it
            {
                
                if zapisgry[zapisgry.count-65+posunieca] == 0
                {
                    
                    posunieca=posunieca+7
                }
                
                else if funkolor(tag: zapisgry[zapisgry.count-65+posunieca], ustawieniefigur: ustawieniefigur) != kolor
                {
                    if ustawieniefigur[zapisgry[zapisgry.count-65+posunieca]]?[0]=="G" || ustawieniefigur[zapisgry[zapisgry.count-65+posunieca]]?[1]=="G" || ustawieniefigur[zapisgry[zapisgry.count-65+posunieca]]?[0]=="Q" || ustawieniefigur[zapisgry[zapisgry.count-65+posunieca]]?[1]=="Q"
                    {
                        return true
                    }
                    break
                }
                else
                {
                    break
                }
            }
        it = 9-x
        if y<it
        {
            it = y
        }
            posunieca = pole-7
            for _ in 1..<it
            {
                if zapisgry[zapisgry.count-65+posunieca] == 0
                {
                    posunieca=posunieca-7
                }
                
                else if funkolor(tag: zapisgry[zapisgry.count-65+posunieca], ustawieniefigur: ustawieniefigur) != kolor
                {
                    if ustawieniefigur[zapisgry[zapisgry.count-65+posunieca]]?[0]=="G" || ustawieniefigur[zapisgry[zapisgry.count-65+posunieca]]?[1]=="G" || ustawieniefigur[zapisgry[zapisgry.count-65+posunieca]]?[0]=="Q" || ustawieniefigur[zapisgry[zapisgry.count-65+posunieca]]?[1]=="Q"
                    {
                        return true
                    }
                    break
                }
                else
                {
                    break
                }
            }
        
        let dane: [Int] = skoczekruchy(pole: pole, kolor: kolor, zapisgry: zapisgry, ustawieniefigur: ustawieniefigur)
        if dane.count>0
        {
            for int in 0..<dane.count
            {
               
                if funkolor(tag: zapisgry[zapisgry.count-65+dane[int]], ustawieniefigur: ustawieniefigur) != kolor
                {
                    if ustawieniefigur[zapisgry[zapisgry.count-65 + dane[int]]]?[0]=="S" || ustawieniefigur[zapisgry[zapisgry.count-65 + dane[int]]]?[1]=="S"
                    {
                        return true
                    }
                }
        }
        }
        
        if kolor == "C" && y != 8 && (ustawieniefigur[zapisgry[zapisgry.count-65+pole+9]]?[0] == "P" || ustawieniefigur[zapisgry[zapisgry.count-65+pole+7]]?[0] == "P")
        {
            return true
        }
        if kolor == "B" && y != 1 && (ustawieniefigur[zapisgry[zapisgry.count-65+pole-9]]?[1] == "P" || ustawieniefigur[zapisgry[zapisgry.count-65+pole-7]]?[1] == "P")
        {
            return true
        }
        
        return false
    }
    
    func zamiananapole(pole:String) -> Int
    {
        var wynik = 0
        if pole.length==2
        {
            switch pole[0]
            {
            case "A":
                wynik += 1
            case "B":
                wynik += 2
            case "C":
                wynik += 3
            case "D":
                wynik += 4
            case "E":
                wynik += 5
            case "F":
                wynik += 6
            case "G":
                wynik += 7
            case "H":
                wynik += 8
            default:
                wynik = 0
            }
            wynik += Int(pole[2])!*8-8
            return wynik
        }
        return 0
    }
    func pionekruchy(pole: Int, kolor: String, zapisgry:[Int], ustawieniefigur:[Int:String]) -> [Int]
    {
        let y: Int = (pole-1)/8+1
        
        var x = pole
        while x>8
        {
            x = x-8
        }
        var wynik:[Int] = []
    
        if kolor == "C"
        {
            //bicie w przelocie
            
           
            if y == 5 && x != 1 && zapisgry[zapisgry.count-65+pole+7] == 0
            {
                let a = zapisgry[zapisgry.count-65+pole-1]
                if a > 48 && a < 57 && a == zapisgry[zapisgry.count-129+pole+15]
                {
                    wynik.append(pole+7)
                }
            }
            if y == 5 && x != 8 && zapisgry[zapisgry.count-65+pole+9] == 0
            {
                let a = zapisgry[zapisgry.count-65+pole+1]
                if a > 48 && a < 57 && a == zapisgry[zapisgry.count-129+pole+17]
                {
                    wynik.append(pole+9)
                }
            }
            if y == 2 && zapisgry[zapisgry.count-65+pole+8]==0 && zapisgry[zapisgry.count-65+pole+16]==0
            {
                wynik.append(pole+16)
            }
            if y != 8 && zapisgry[zapisgry.count-65+pole+8]==0
            {
                wynik.append(pole+8)
            }
            if x != 8 && y != 8 && funkolor(tag: zapisgry[zapisgry.count-65+pole+9], ustawieniefigur: ustawieniefigur) == "B"
            {
                
                wynik.append(pole+9)
            }
            if x != 1 && y != 8 && funkolor(tag: zapisgry[zapisgry.count-65+pole+7], ustawieniefigur: ustawieniefigur) == "B"
            {
                wynik.append(pole+7)
            }
            
      
    }
    if kolor == "B"
    {
        if y == 4 && x != 8 && zapisgry[zapisgry.count-65+pole-7] == 0
        {
            let a = zapisgry[zapisgry.count-65+pole+1]
            if a > 0 && a < 17 && a == zapisgry[zapisgry.count-129+pole-15]
            {
                wynik.append(pole-7)
            }
        }
        if y == 4 && x != 1 && zapisgry[zapisgry.count-65+pole-9] == 0
        {
            let a = zapisgry[zapisgry.count-65+pole-1]
            if a > 0 && a < 17 && a == zapisgry[zapisgry.count-129+pole-17]
            {
                wynik.append(pole-9)
            }
        }
        if y == 7 && zapisgry[zapisgry.count-65+pole-8]==0 && zapisgry[zapisgry.count-65+pole-16]==0
        {
            wynik.append(pole-16)
        }
        if y != 1 && zapisgry[zapisgry.count-65+pole-8]==0
        {
            wynik.append(pole-8)
        }
        if x != 1 && y != 1 && funkolor(tag: zapisgry[zapisgry.count-65+pole-9], ustawieniefigur: ustawieniefigur) == "C"
        {
            wynik.append(pole-9)
        }
        if x != 8 && y != 1 && funkolor(tag: zapisgry[zapisgry.count-65+pole-7], ustawieniefigur: ustawieniefigur) == "C"
        {
            wynik.append(pole-7)
        }
        
      
    }
  return wynik
}
    func goniecruchy(pole: Int, kolor: String, zapisgry:[Int], ustawieniefigur:[Int:String]) -> [Int]
    {
        
        let y: Int = (pole-1)/8+1
        var posunieca = pole
        var x = pole
        while x>8
        {
            x = x-8
        }
       
        var wynik:[Int] = []
        var it = y
        if x<y
        {
            it  = x
        }
        if it != 1
        {
            posunieca = posunieca-9
            for _ in 1..<it
            {
                if zapisgry[zapisgry.count-65+posunieca] == 0
                {
                    wynik.append(posunieca)
                    posunieca=posunieca-9
                }
                
                else if funkolor(tag: zapisgry[zapisgry.count-65+posunieca], ustawieniefigur: ustawieniefigur) != kolor
                {
                    wynik.append(posunieca)
                    break
                }
                else
                {
                    break
                }
            }
        }
        it = 9-y
        if x>y
        {
            it  = 9-x
        }
        if it != 8
        {
            posunieca = pole+9
            for _ in 1..<it
            {
                if zapisgry[zapisgry.count-65+posunieca] == 0
                {
                    wynik.append(posunieca)
                    posunieca=posunieca+9
                }
                
                else if funkolor(tag: zapisgry[zapisgry.count-65+posunieca], ustawieniefigur: ustawieniefigur) != kolor
                {
                    wynik.append(posunieca)
                    break
                }
                else
                {
                    break
                }
            }
        }
        it = 9-y
        if x<it
        {
            it = x
        }
            
            posunieca = pole+7
            for _ in 1..<it
            {
                
                if zapisgry[zapisgry.count-65+posunieca] == 0
                {
                    wynik.append(posunieca)
                    posunieca=posunieca+7
                }
                
                else if funkolor(tag: zapisgry[zapisgry.count-65+posunieca], ustawieniefigur: ustawieniefigur) != kolor
                {
                   
                    wynik.append(posunieca)
                    break
                }
                else
                {
                    break
                }
            }
        it = 9-x
        if y<it
        {
            it = y
        }
            posunieca = pole-7
            for _ in 1..<it
            {
                if zapisgry[zapisgry.count-65+posunieca] == 0
                {
                    wynik.append(posunieca)
                    posunieca=posunieca-7
                }
                
                else if funkolor(tag: zapisgry[zapisgry.count-65+posunieca], ustawieniefigur: ustawieniefigur) != kolor
                {
                    wynik.append(posunieca)
                    break
                }
                else
                {
                    break
                }
            }
        return wynik
        
    }
    func wiezaruchy(pole: Int, kolor: String, zapisgry:[Int], ustawieniefigur:[Int:String]) -> [Int]
    {
        let y: Int = (pole-1)/8+1
        var posunieca = pole
        var x = pole
        while x>8
        {
            x = x-8
        }
       
        var wynik:[Int] = []
        posunieca = posunieca-1
        for _ in 1..<x
        {
            if zapisgry[zapisgry.count-65+posunieca] == 0
            {
                wynik.append(posunieca)
                posunieca = posunieca-1
            }
            else if funkolor(tag: zapisgry[zapisgry.count-65+posunieca], ustawieniefigur: ustawieniefigur) != kolor
            {
                wynik.append(posunieca)
                break
            }
            else
            {
                break
            }
        }
        posunieca = pole+1
        for _ in 1..<(9-x)
        {
            if zapisgry[zapisgry.count-65+posunieca] == 0
            {
                wynik.append(posunieca)
                posunieca = posunieca+1
            }
            else if funkolor(tag: zapisgry[zapisgry.count-65+posunieca], ustawieniefigur: ustawieniefigur) != kolor
            {
                wynik.append(posunieca)
                break
            }
            else
            {
                break
            }
        }
        posunieca = pole+8
        for _ in 1..<9-y
        {
            
            if zapisgry[zapisgry.count-65+posunieca] == 0
            {
                wynik.append(posunieca)
                posunieca = posunieca+8
            }
            else if funkolor(tag: zapisgry[zapisgry.count-65+posunieca], ustawieniefigur: ustawieniefigur) != kolor
            {
                wynik.append(posunieca)
                break
            }
            else
            {
                break
            }
        }
        posunieca = pole-8
        for _ in 1..<y
        {
            if zapisgry[zapisgry.count-65+posunieca] == 0
            {
                wynik.append(posunieca)
                posunieca = posunieca-8
            }
            else if funkolor(tag: zapisgry[zapisgry.count-65+posunieca], ustawieniefigur: ustawieniefigur) != kolor
            {
                wynik.append(posunieca)
                break
            }
            else
            {
                break
            }
        }
        return wynik
        
    }
    func krolruchy(pole:Int,kolor:String, zapisgry:[Int], ustawieniefigur:[Int:String]) -> [Int]
    {
        let y: Int = (pole-1)/8 + 1
        var x = pole
        while x>8
        {
            x = x-8
        }
        var wynik:[Int] = []
        if x != 8
        {
            if zapisgry[zapisgry.count-64+pole]==0 || funkolor(tag: zapisgry[zapisgry.count-64+pole], ustawieniefigur: ustawieniefigur) != kolor
            {
                wynik.append(pole+1)
            }
       
        }
        if x != 1
        {
            if zapisgry[zapisgry.count-66+pole]==0 || funkolor(tag: zapisgry[zapisgry.count-66+pole], ustawieniefigur: ustawieniefigur) != kolor
            {
                wynik.append(pole-1)
            }
        }
        if y != 8
        {
            if zapisgry[zapisgry.count-57+pole]==0 || funkolor(tag: zapisgry[zapisgry.count-57+pole], ustawieniefigur: ustawieniefigur) != kolor
            {
                wynik.append(pole+8)
            }
            if x != 1
            {
                if zapisgry[zapisgry.count-58+pole]==0 || funkolor(tag: zapisgry[zapisgry.count-58+pole], ustawieniefigur: ustawieniefigur) != kolor
                {
                    wynik.append(pole+7)
                }
            }
            if x != 8
            {
                if zapisgry[zapisgry.count-56+pole]==0 || funkolor(tag: zapisgry[zapisgry.count-56+pole], ustawieniefigur: ustawieniefigur) != kolor
                {
                    wynik.append(pole+9)
                }
            }
            
            
        }
        if y != 1
        {
            if zapisgry[zapisgry.count-73+pole]==0 || funkolor(tag: zapisgry[zapisgry.count-73+pole], ustawieniefigur: ustawieniefigur) != kolor
            {
                wynik.append(pole-8)
            }
            if x != 1
            {
                if zapisgry[zapisgry.count-74+pole]==0 || funkolor(tag: zapisgry[zapisgry.count-74+pole], ustawieniefigur: ustawieniefigur) != kolor
                {
                    wynik.append(pole-9)
                }
            }
            if x != 8
            {
                if zapisgry[zapisgry.count-72+pole]==0 || funkolor(tag: zapisgry[zapisgry.count-72+pole], ustawieniefigur: ustawieniefigur) != kolor
                {
                    wynik.append(pole-7)
                }
            }
        }
        //roszada...
        if pole == zapisgry[zapisgry.count-65+pole] && kolor == "C"
        {
            if zapisgry[zapisgry.count+pole-64] == 0 && zapisgry[zapisgry.count+pole-63] == 0 && zapisgry[zapisgry.count+pole-62] == 8
            {
                if czyatakowane(pole: 6, kolor: kolor, zapisgry: zapisgry, ustawieniefigur: ustawieniefigur)==false && czyatakowane(pole: 7, kolor: kolor,zapisgry: zapisgry, ustawieniefigur: ustawieniefigur)==false
                {
                    var czymozna = true
                    for int in 0..<zapisgry.count/64
                    {
                        if zapisgry[4+64*int] != 5  || zapisgry[7+64*int] != 8
                        {
                            czymozna=false
                        }
                    }
                    if czymozna == true
                    {
                        wynik.append(pole+2)
                    }
                }
               
            }
            if zapisgry[zapisgry.count+pole-66] == 0 && zapisgry[zapisgry.count+pole-67] == 0 && zapisgry[zapisgry.count+pole-68] == 0 && zapisgry[zapisgry.count+pole-69] == 1
            {
                if czyatakowane(pole: 4, kolor: kolor, zapisgry: zapisgry, ustawieniefigur: ustawieniefigur)==false && czyatakowane(pole: 3, kolor: kolor,zapisgry: zapisgry, ustawieniefigur: ustawieniefigur)==false
                {
                    var czymozna = true
                    for int in 0..<zapisgry.count/64
                    {
                        if zapisgry[4+64*int] != 5  || zapisgry[64*int] != 1
                        {
                            czymozna=false
                        }
                    }
                    if czymozna == true
                    {
                        wynik.append(pole-2)
                    }
                }
               
            }
            
            
        }
        if pole == zapisgry[zapisgry.count-65+pole] && kolor == "B"
        {
            if zapisgry[zapisgry.count+pole-64] == 0 && zapisgry[zapisgry.count+pole-63] == 0 && zapisgry[zapisgry.count+pole-62] == 64
            {
                if czyatakowane(pole: 62, kolor: kolor,zapisgry: zapisgry, ustawieniefigur: ustawieniefigur)==false && czyatakowane(pole: 63, kolor: kolor,zapisgry: zapisgry, ustawieniefigur: ustawieniefigur)==false
                {
                    var czymozna = true
                    for int in 0..<zapisgry.count/64
                    {
                        if zapisgry[60+64*int] != 61  || zapisgry[63+64*int] != 64
                        {
                            czymozna=false
                        }
                    }
                    if czymozna == true
                    {
                        wynik.append(pole+2)
                    }
                }
               
            }
            if zapisgry[zapisgry.count+pole-66] == 0 && zapisgry[zapisgry.count+pole-67] == 0 && zapisgry[zapisgry.count+pole-68] == 0 && zapisgry[zapisgry.count+pole-69] == 57
            {
                if czyatakowane(pole: 60, kolor: kolor,zapisgry: zapisgry, ustawieniefigur: ustawieniefigur)==false && czyatakowane(pole: 59, kolor: kolor,zapisgry: zapisgry, ustawieniefigur: ustawieniefigur)==false
                {
                    var czymozna = true
                    for int in 0..<zapisgry.count/64
                    {
                        if zapisgry[60+64*int] != 61  || zapisgry[56+64*int] != 57
                        {
                            czymozna=false
                        }
                    }
                    if czymozna == true
                    {
                        wynik.append(pole-2)
                    }
                }
               
            }
            
        }
        
        
        var tablicapomocnicza:[Int] = []
        if wynik.count>0
        {
            
            for int in 0..<wynik.count {
               
                if czyatakowane(pole: wynik[int], kolor: kolor,zapisgry: zapisgry, ustawieniefigur: ustawieniefigur)==false
                {
                    tablicapomocnicza.append(wynik[int])
                }
                
            }
        }
        
        
        
        return tablicapomocnicza
        
    }
    
    func skoczekruchy(pole:Int,kolor:String, zapisgry:[Int], ustawieniefigur:[Int:String]) -> [Int]
    {
        let y: Int = (pole-1)/8 + 1
        var x = pole
        while x>8
        {
            x = x-8
        }
        
        var dane: [Int:Int] = [-17:-17, -15:-15, -10:-10, -6:-6, 6:6, 10:10, 15:15,17:17 ]
        if(y==1)
        {
            dane[-17] = nil
            dane[-15] = nil
            dane[-10] = nil
            dane[-6] = nil
        }
        else if y == 2
        {
            dane[-15] = nil
            dane[-17] = nil
        }
        else if y == 7
        {
            dane[15] = nil
            dane[17] = nil
        }
        else if(y==8)
        {
            dane[17] = nil
            dane[15] = nil
            dane[10] = nil
            dane[6] = nil
        }
        if x == 1
        {
            dane[-17] = nil
            dane[-10] = nil
            dane[6] = nil
            dane[15] = nil
        }
        else if x==2
        {
            dane[-10] = nil
            dane[6] = nil
        }
        else if x==7
        {
            dane[10] = nil
            dane[-6] = nil
        }
        else if x==8
        {
            dane[17] = nil
            dane[10] = nil
            dane[-6] = nil
            dane[-15] = nil
        }
        var wynik:[Int] = []
        for (klucz, wartosc) in dane
        {
            if funkolor(tag: zapisgry[zapisgry.count-65+pole+wartosc], ustawieniefigur: ustawieniefigur) != kolor
            {
                wynik.append(pole+wartosc)
            }
            else if zapisgry[zapisgry.count-65+pole+klucz]==0
            {
                wynik.append(pole+wartosc)
            }
        }

        return wynik
    }
    func zapisszachowy(pole:Int, kolor:String, ustawieniefigur:[Int:String], zapisgry:[Int]) -> String
    {
        var wynik = ""
        let y: Int = (pole)/8 + 1
        var x = pole
        while x>8
        {
            x = x-8
        }
        
        
        let polaX = ["A", "B", "C", "D", "E", "F", "G", "H"]
                         
        if (ustawieniefigur[zapisgry[zapisgry.count-65+pole]]?[1] == "P" || ustawieniefigur[zapisgry[zapisgry.count-65+pole]]?[0] == "P") && zapisgry[zapisgry.count-129+pole] == 0
        {
            wynik += polaX[x-1] + "\(9-y)"
            return wynik
        }
        if (ustawieniefigur[zapisgry[zapisgry.count-65+pole]]?[1] == "S" || ustawieniefigur[zapisgry[zapisgry.count-65+pole]]?[0] == "S")
        {
            wynik += "♘"
            
        }
        if (ustawieniefigur[zapisgry[zapisgry.count-65+pole]]?[1] == "G" || ustawieniefigur[zapisgry[zapisgry.count-65+pole]]?[0] == "G")
        {
            wynik += "♗"
            
        }
        if (ustawieniefigur[zapisgry[zapisgry.count-65+pole]]?[1] == "W" || ustawieniefigur[zapisgry[zapisgry.count-65+pole]]?[0] == "W")
        {
            wynik += "♖"
            
        }
        if (ustawieniefigur[zapisgry[zapisgry.count-65+pole]]?[1] == "Q" || ustawieniefigur[zapisgry[zapisgry.count-65+pole]]?[0] == "Q")
        {
            wynik += "♕"
            
        }
        if (ustawieniefigur[zapisgry[zapisgry.count-65+pole]]?[1] == "K" || ustawieniefigur[zapisgry[zapisgry.count-65+pole]]?[0] == "K")
        {
            wynik += "♔"
            
        }
        wynik += polaX[x-1] + "\(9-y)"
        return wynik
        
    }
    
    func sprawdzaniepoprawnosci(ruch1:Int, ruch2:Int, figura: String, kolor: String,zapisgry:[Int], ustawieniefigur: [Int:String],zapisparti:[String])->Bool
    {
        
        let y: Int = (ruch1-1)/8+1
        var x = ruch1
        
        while x>8
        {
            x = x-8
        }
        var dane:[Int] = []
        
        
        if figura == "P"
        {
            dane = pionekruchy(pole: ruch1, kolor: kolor,zapisgry: zapisgry, ustawieniefigur: ustawieniefigur)
        }
        if figura == "S"
        {
            dane = skoczekruchy(pole: ruch1, kolor: kolor,zapisgry: zapisgry, ustawieniefigur: ustawieniefigur)
        }
        if figura == "G"
        {
            dane = goniecruchy(pole: ruch1, kolor: kolor,zapisgry: zapisgry, ustawieniefigur: ustawieniefigur)
        }
        if figura == "W"
        {
            dane = wiezaruchy(pole: ruch1, kolor: kolor,zapisgry: zapisgry, ustawieniefigur: ustawieniefigur)
        }
        if figura == "K"
        {
            dane = krolruchy(pole: ruch1, kolor: kolor,zapisgry: zapisgry, ustawieniefigur: ustawieniefigur)
        }
        
        if figura == "Q"
        {
            dane = wiezaruchy(pole: ruch1, kolor: kolor, zapisgry: zapisgry,ustawieniefigur: ustawieniefigur)
            if goniecruchy(pole: ruch1, kolor: kolor,zapisgry: zapisgry,ustawieniefigur: ustawieniefigur).count>0
            {
                for l in 0..<goniecruchy(pole: ruch1, kolor: kolor,zapisgry: zapisgry,ustawieniefigur: ustawieniefigur).count
                {
                    dane.append(goniecruchy(pole: ruch1, kolor: kolor,zapisgry: zapisgry,ustawieniefigur: ustawieniefigur)[l])
                }
            }
        }
        if dane.count>0
        {
            for n in 0..<dane.count
            {
                if dane[n]==ruch2
                {
                    return true
                }
            }
            return false
        }
            
           return false
           }
    
    
    
}
