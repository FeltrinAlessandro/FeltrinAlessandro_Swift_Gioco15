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
    
    var matrice :[[Int]] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        ordinaMatriceAndBtn()
    }
    
    @IBAction func mischiaMatrice(_ sender: Any) {
    var x = 3
    var y = 3
    var a = 0
        for i in 0...10{
            a = Int.random(in:0...1)
            if(a==1){
                if(y>0)
                {
                    matrice[x][y] = matrice[x][y+1]
                    y += 1
                    matrice[x][y] = 0
                }
            }
            else{
                
            }
        }
    }
    
    func applicaMatriceMischiata() {
        
    }
    
    
    func ordinaMatriceAndBtn()  {
        var x = 0
        var y = 0
         gruppoBtn_All[15].setTitle(" ", for:.normal)
        
        for i in 0...14{
        gruppoBtn_All[i].setTitle(String(i+1), for:.normal)
        }
        
        for i in 0...15{
            if(x==3 && y==3)
            {
                matrice[x][y] = 0
            }
            else if(x==3 && y<3)
            {
                matrice[x][y] = i
                x = 0
                y+=1
            }
            else
            {
                matrice[x][y] = i
                x+=1
            }
        }
    }


}

