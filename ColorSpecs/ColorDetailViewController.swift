//
//  ColorDetailViewController.swift
//  ColorSpecs
//
//  Created by Akhila Ballari on 10/17/17.
//  Copyright © 2017 Akhila Ballari. All rights reserved.
//

import UIKit

class ColorDetailViewController: UIViewController {

    var colorSpec: ColorSpec?
    @IBOutlet weak var colorTextLabel: UILabel!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        colorTextLabel.text = colorSpec?.colorName
        colorTextLabel.textColor = colorSpec?.color

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
