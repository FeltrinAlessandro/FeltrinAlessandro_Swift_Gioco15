//
//  ViewController.swift
//  GiocoDel15
//
//  Created by ALESSANDRO FELTRIN on 30/10/2019.
//  Copyright © 2019 ALESSANDRO FELTRIN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var btn_Mescola: UIButton!
    @IBOutlet var gruppoBtn_All: [UIButton]!
    var matrice : [[Int]] = [[1,2,3,4],[5,6,7,8],[9,10,11,12],[13,14,15,0]]
    override func viewDidLoad() {
        super.viewDidLoad()
        ordinaMatriceAndBtn()
    }
    
    @IBAction func mischiaMatrice(_ sender: Any) {
    var posZero = trovaPosizioneVuota()
    var y = posZero.0
    var x = posZero.1
    var a = 0
        for _ in 0...50{
            a = Int.random(in:0...1)
            if(a==1){
                if(y>0)
                {
                    matrice[y][x] = matrice[y-1][x]
                    y -= 1
                    matrice[y][x] = 0
                }
                else if(x<3){
                        matrice[y][x] = matrice[y][x+1]
                        x += 1
                        matrice[y][x] = 0
                }
                else{
                    matrice[y][x] = matrice[y+1][x]
                    y += 1
                    matrice[y][x] = 0
                }
            }
            else{
                if(y<3){
                matrice[y][x] = matrice[y+1][x]
                y += 1
                matrice[y][x] = 0
                }
                else if(x>0){
                    matrice[y][x] = matrice[y][x-1]
                    x -= 1
                    matrice[y][x] = 0
                }
                else {
                    matrice[y][x] = matrice[y][x+1]
                    x += 1
                    matrice[y][x] = 0
                }
                
            }
        }
        applicaMatricemischiata()
    }
    
    func applicaMatricemischiata()
    {
        for y in 0...3{
            for x in 0...3{
                    gruppoBtn_All[y*4+x].setTitle(String(matrice[y][x]), for: .normal)
            }
        }
    }
    
    /*func applicaMatriceMischiata() {
        var x = 0
        var y = 0
        for _ in 0...15{
            if(x==3){
                gruppoBtn_All[y*4+x].setTitle(String(matrice[x][y]), for: .normal)
                x = 0
                y+=1
            }
            else
            {
                gruppoBtn_All[y*4+x].setTitle(String(matrice[x][y]), for: .normal)
                x+=1
            }
        }
        
    }*/
    
    func controllaMatrice(){
        var a = 0
        for y in 0...3{
            for x in 0...3{
                if (matrice[y][x] != x+y*4+1 && (x != 3 || y != 3))
                {
                    a = 1
                }
            }
        }
        if(a==0)
        {
            //label hai vinto
        }
    }
    
    
    func trovaPosizioneVuota() -> (Int, Int){
         for i in 0 ... 3{
             for j in 0 ... 3{
                 if matrice[i][j] == 0{
                     return (i, j)
                 }
             }
         }
         return(-1,-1)
     }
    
    
    @IBAction func spostaValore(_ sender: UIButton)
    {
        var posArray : Int!
        posArray = gruppoBtn_All.firstIndex(of: sender)
        var x = posArray%4
        var y = posArray/4
        if(x<3)
        {
            if(matrice[y][x+1]==0)
            {
                matrice[y][x+1]=matrice[y][x]
                matrice[y][x] = 0
            }
        }
        if(y<3)
        {
            if(matrice[y+1][x]==0)
            {
                matrice[y+1][x]=matrice[y][x]
                matrice[y][x] = 0
            }
        }
        if(x>0)
        {
            if(matrice[y][x-1]==0)
            {
                matrice[y][x-1]=matrice[y][x]
                matrice[y][x] = 0
            }
        }
        if(y>0)
        {
            if(matrice[y-1][x]==0)
            {
                matrice[y-1][x]=matrice[y-1][x]
                matrice[y][x] = 0
            }
        }
        applicaMatricemischiata()
    }
    
    func ordinaMatriceAndBtn()  {

         gruppoBtn_All[15].setTitle("0", for:.normal)
        
        matrice = [[1,2,3,4],[5,6,7,8],[9,10,11,12],[13,14,15,0]]
        
        for i in 0...14{
        gruppoBtn_All[i].setTitle(String(i+1), for:.normal)
        }
    }
}

