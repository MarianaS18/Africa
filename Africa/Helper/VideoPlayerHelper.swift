//
//  VideoPlayerHelper.swift
//  Africa
//
//  Created by Mariana Steblii on 11/04/2021.
//

import Foundation
import AVKit

var videoPlayer: AVPlayer?

// play the video automaticaly
func playVideo(fileName: String, fileFormat: String) -> AVPlayer {
    
    // this conditional statement cheks whether there is a valid video file in the main app bundle with the given filename and file extension
    if Bundle.main.url(forResource: fileName, withExtension: fileFormat) != nil {
        // creates a new video player with nessesary information from the provided file name and file extension parameters
        videoPlayer = AVPlayer(url: Bundle.main.url(forResource: fileName, withExtension: fileFormat)!)
        videoPlayer?.play()
    }
    
    return videoPlayer!
}
