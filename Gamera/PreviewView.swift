//
//  PreviewView.swift
//  Gamera
//
//  Created by 郭朋 on 9/12/18.
//  Copyright © 2018 Peng Guo. All rights reserved.
//

import UIKit
import AVFoundation

class PreviewView: UIView {

    override class var layerClass: AnyClass {
        return AVCaptureVideoPreviewLayer.self
    }
    
    var videoPreviewLayer: AVCaptureVideoPreviewLayer {
        return layer as! AVCaptureVideoPreviewLayer
    }

}
