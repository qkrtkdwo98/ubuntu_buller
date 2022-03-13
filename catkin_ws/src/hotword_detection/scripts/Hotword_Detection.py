#!/home/psj/mycroft-precise/.venv/bin/python3

# Copyright 2019 Mycroft AI Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
from argparse import ArgumentParser
from precise.util import activate_notify
from precise_runner import PreciseRunner, PreciseEngine

import time
#import os
#import dialogflow

import threading
import numpy as np
#import reques

import vlc
import speech_recognition as sr
import pyaudio
import wave

#from mutagen.mp3 import MP3
#from google.cloud import texttospeech

import rospy
#from std_msgs.msg import Float32MultiArray
from std_msgs.msg import Int32
from hotword_detection.msg import Control

eve=threading.Event()
#listen_text = '초기화'

'''
def speak_audio(text):

free talking

##?????    os.environ["GOOGLE_APPLICATION_CREDENTIALS"]="/home/pi/emotions_conversation/TTS_key.json"
    from google.cloud import texttospeech

    client = texttospeech.TextToSpeechClient()

    # Set the text input to be synthesized
    synthesis_input = texttospeech.SynthesisInput(text=text)

    # Build the voice request, select the language code ("en-US")
    # ****** the NAME
    # and the ssml voice gender ("neutral")
    voice = texttospeech.VoiceSelectionParams(
        language_code='ko-KR',
        name='ko-KR-Standard-A',
        ssml_gender=texttospeech.SsmlVoiceGender.FEMALE)

    # Select the type of audio file you want returned
    audio_config = texttospeech.AudioConfig(
        audio_encoding=texttospeech.AudioEncoding.MP3)

    # Perform the text-to-speech request on the text input with the selected
    # voice parameters and audio file type
    response = client.synthesize_speech(input=synthesis_input, voice=voice, audio_config=audio_config)

    instance = vlc.Instance()
    player = instance.media_player_new()

    # The response's audio_content is binary.
    with open('output.mp3', 'wb') as out:
        # Write the response to the output file.
        out.write(response.audio_content)
        #print('Audio content written to file "output.mp3"')
        #os.remove('/home/pi/emotions_conversation/output.mp3')

##?????    media = instance.media_new('/home/pi/output.mp3')
##?????    audio = MP3('/home/pi/output.mp3')

    length = audio.info.length
    player.set_media(media)

    player.play()
    time.sleep(length)

##?????    os.remove('/home/pi/output.mp3')
'''

def sound_play():
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

def listen_audio():
    WIT_AI_KEY = "ZGSASL6GGT3QY6DWG7CW5MSIFH4AVSOU"
    r = sr.Recognizer()
    sp = sr.Microphone(sample_rate = 16000, chunk_size = 1024)
    
    #r.energy_threshold = 100

    chunk = 1024
    
    path = '/home/psj/catkin_ws/src/hotword_detection/ding.wav'

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
    
    try: 
        with sp as source:
            r.adjust_for_ambient_noise(source, duration=2)    

            print("Speak Anything : ")
            audio = r.listen(source, timeout=3.5)
        #try:
            #audio = r.listen(source, timeout=3.5)
            text = r.recognize_wit(audio, key = WIT_AI_KEY)
            print("Wit.ai thinks you said : {} ".format(text))

    except:
        text = '무응답'
        print("Wit.ai could not understand audio")

    #eve.set()
    return text

def main():
    #eve=threading.Event()
    #send_str = "Hotword Detection!"
    #local_python = '/usr/bin/python3'
    
    #global listen_text
    #listen_text = '초기화'


    space = ['침실', '화장실', '부엌', '현관문', '거실']
    space_idx = ['bed_room', 'toilet', 'kitchen', 'front_door', 'living_room']
    thing = ['물', '화장지', '휴지', '약']
    thing_idx = ['water', 'toilet_paper', 'toilet_paper', 'medicine']
    
    publish_index_space = -1
    publish_index_thing = -1
    
    
    def on_prediction(prob):    
        print('!' if prob > 0.5 else '.', end='', flush=True)

        if prob > 0.5:
            global text
            text = listen_audio()
            eve.set()
        #else:
        #    time.sleep(0.005)

    def on_activation():
        activate_notify()

   

    engine = PreciseEngine('/home/psj/mycroft-precise/precise/scripts/engine.py', '/home/psj/catkin_ws/src/hotword_detection/bodam.pb')
    RUN=PreciseRunner(engine, on_prediction=on_prediction, on_activation=on_activation)#,trigger_level=0)

    RUN.start() # Hotword Detecting start
    
    #time.sleep(5)

    eve.wait()  # Wait forever
    RUN.stop()  # Hotword Detecting stop
    

    #print(text)
    #listen_text = text
    listen_text = "화장실 가고 싶어"

    for idx1 in range(len(space)):
        if space[idx1] in listen_text:
            publish_index_space = idx1
            break

    if publish_index_space is -1:
        for idx2 in range(len(thing)):
            if thing[idx2] in listen_text:
                publish_index_thing = idx2
                break

    #if publish_index_space + publish_index_thing is -2:
    #대화 알고리즘

    if publish_index_space >= 0:
        #print(space[publish_index_space])
        publish_text = space_idx[publish_index_space]
    elif publish_index_thing >= 0:
        #print(thing[publish_index_thing])
        publish_text = thing_idx[publish_index_thing]
    else:
        #print(listen_text)
        publish_text = listen_text # 대화 알고리즘

    if publish_index_space + publish_index_thing is not -2:

        #position = np.array([gains[0],gains[1],gains[2]])
        #array = Float32MultiArray(data=position)

        pub = rospy.Publisher('detect_object',Control,queue_size=10)
        rospy.init_node('infodata_publisher_node')

        rate = rospy.Rate(10)

        gains = Control()
        gains.detect_word = rospy.get_param(publish_text)

        time.sleep(2)

        #rospy.loginfo(publish_text)
        #pub.publish(publish_text)
        pub.publish(gains)
        
        rate.sleep()
        #if Trigger == 0:
        #voice command
        #args = [local_python,'/home/pi/emotions_conversation/main.py']
        #subprocess.run(args)

if __name__ == '__main__':
    while(1):
        try:main()
        #main()
        #listen_audio()
        except rospy.ROSInterruptException:pass
