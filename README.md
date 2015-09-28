# Rubber-Duck
An voice-interactive Rubber Duck to help you debug your code!

This project was created at Georgia Tech's [HackGT](http://www.hackgt.com/) hackathon during Sep 25-27. 
Based off of the concept of [Rubber Duck debugging](https://en.wikipedia.org/wiki/Rubber_duck_debugging),
this iOS app listens to your question orcomplaint via 
[Nuance's SpeechKit API (part of Dragon Mobile SDK)](http://developer.nuance.com/public/Help/DragonMobileSDKReference_iOS/SpeechKit_Guide/Introduction.html),
sends the question off to our server back-end
(which retrieves the first relevant result from [Stack Overflow](http://stackoverflow.com) via Google's APIs),
and the result is delivered to you Apple's own [AVSpeechSynthesizer](https://developer.apple.com/library/prerelease/ios/documentation/AVFoundation/Reference/AVSpeechSynthesizer_Ref/index.html)
on iOS.


Languages/Tools
- iOS: Swift, Objective-C, Nuance Dragon Mobile SDK (SpeechKit), AVFoundation (AVSpeechSynthesizer)
- Communications: Socket.IO
- Server: Node.js, Google APIs

Known problems
- The fallback to local response generation doesn't always trigger when results are not available from the server.
- Server doesn't always sanitize StackOverflow's format specifiers
- Currently the text from voice recognition only appears when the local responses are triggered; it is removed for server-based responses temporarily

Future plans
- Refactoring
- Better language models
- Improved user interface
