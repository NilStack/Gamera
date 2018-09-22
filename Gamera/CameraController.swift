//
//  CameraController.swift
//  Gamera
//
//  Created by 郭朋 on 9/12/18.
//  Copyright © 2018 Peng Guo. All rights reserved.
//

import UIKit
import AVFoundation
import VideoToolbox

protocol CameraControllerDelegate: class {
    
}

class CameraController: NSObject {
    weak var delegate: CameraControllerDelegate?
    
    var captureSession: AVCaptureSession?
    var frontCamera: AVCaptureDevice?
    var backCamera: AVCaptureDevice?
    var frontCameraInput: AVCaptureDeviceInput?
    var backCameraInput: AVCaptureDeviceInput?
    var videoOutput: AVCaptureVideoDataOutput?
    var videoTextureCache: CVMetalTextureCache?
    
    func createCaptureSession() {
        self.captureSession = AVCaptureSession()
    }
    
    func configureCaptureDevice() throws {
        let session = AVCaptureDevice
            .DiscoverySession(
                deviceTypes: [.builtInWideAngleCamera],
                  mediaType: AVMediaType.video,
                   position: .unspecified)
        
        let cameras = session.devices.compactMap{ $0 }
        if (cameras.isEmpty) {
            //throw CameraControllerError.noCamerasAvailable
        }
        
        for camera in cameras {
            if camera.position == .front {
                self.frontCamera = camera
            }
            
            if camera.position == .back {
                self.backCamera = camera
                
                try camera.lockForConfiguration()
                camera.focusMode = .continuousAutoFocus
                camera.unlockForConfiguration()
            }
        }
        
    }

}

extension CameraController: AVCaptureVideoDataOutputSampleBufferDelegate {
    
}
