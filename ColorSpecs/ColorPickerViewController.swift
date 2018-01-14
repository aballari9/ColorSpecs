//
//  ColorPickerViewController.swift
//  ColorSpecs
//
//  Created by Akhila Ballari on 10/17/17.
//  Copyright © 2017 Akhila Ballari. All rights reserved.
//

import UIKit

class ColorPickerViewController: UIViewController {
    
    var completionHandler: ((ColorSpec) -> Void)?
    
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var colorPreview: UIView!
    
    @IBAction func donePressed(_ sender: Any) {
        let newColorSpec = ColorSpec.init(color: colorPreview.backgroundColor!, colorName: "New Color")
        self.completionHandler?(newColorSpec)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    static func present(over presenter: UIViewController, completion: @escaping (((ColorSpec) -> Void))) {
        
        if let navigation = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "colorPickerNav") as? UINavigationController,
            let colorController = navigation.childViewControllers.first as? ColorPickerViewController {
            colorController.completionHandler = completion
            presenter.present(navigation, animated: true, completion: nil)
            
        }
    }
    @IBAction func updateColorView(_ sender: Any) {
        let newColor = UIColor.init(red: CGFloat(redSlider.value),
                                    green: CGFloat(greenSlider.value),
                                    blue: CGFloat(blueSlider.value),
                                                  alpha: 1)
        colorPreview.backgroundColor = newColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
