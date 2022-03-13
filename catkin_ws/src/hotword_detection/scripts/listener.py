#!/home/maze/mycroft-precise/.venv/bin/python3

import vlc
import speech_recognition as sr
import pyaudio
import wave

import rospy
from std_msgs.msg import String


def listen_audio(data):
    WIT_AI_KEY = "ZGSASL6GGT3QY6DWG7CW5MSIFH4AVSOU"
    r = sr.Recognizer()
    #device_index=2
    
    chunk = 1024
    path = '/home/maze/catkin_ws/src/hotword_detection/ding.wav'

    with wave.open(path, 'rb') as f:
        p = pyaudio.PyAudio()
        stream = p.open(format = p.get_format_from_width(f.getsampwidth()),
                        channels = f.getnchannels(),
                        rate = f.getframerate(),
                        output = True)
        
        data = f.readframes(chunk)
        while data:
            stream.write(data)
            data = f.readframes(chunk)
            
        stream.stop_stream()
        stream.close()
        
        p.terminate()
    
    with sr.Microphone() as source:

        print("Speak Anything : ")
        audio = r.listen(source, timeout=3.5)
    try:
        #audio = r.listen(source, timeout=3)
        text = r.recognize_wit(audio, key = WIT_AI_KEY)
        print("Wit.ai thinks you said : {} ".format(text))
    except:
        #text = 'exit'
        print("Wit.ai could not understand audio")
    
    #return text

#def command_recognition(data):
    #string search, string classification


def callback(data):
    rospy.loginfo(rospy.get_caller_id()+ "I heard %s", data.data)
    #listen_audio()

def sub_pub():
    #pub = rospy.Publisher('command',String,queue_size=20)
    #rospy.init_node('talker2',anonymous=True)
    rospy.init_node('listener',anonymous=True)
    rospy.Subscriber("chatter",String, callback)
    
    #if(rospy.Subscriber("chatter",String, callback) is not None):
    rospy.spin()

    #return 

if __name__=='__main__':
    sub_pub()
    #if(listener() is not None):
    #    print("Hotword Detection!!!!")
    #else:
    #    pass
