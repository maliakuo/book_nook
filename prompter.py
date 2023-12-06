import serial
from time import sleep

ser = serial.Serial('/dev/tty.usbserial-10')  # open serial port

def parseBytes(byteString):
    decoded = byteString.decode("utf-8")
    decoded = decoded.strip()
    return decoded


def greeting():
    print("ah! a new traveler.")
    sleep(1)
    print("i am the guardian.")
    sleep(1)
    print("i wonder what distant lands you call home...")
    sleep(1)
    print("my world is in dire straits... ")
    sleep(1)
    print("a blight has struck, forcing our fairies, wildlife, and skies into darkness and despair.")
    sleep(1)
    print(".....")
    sleep(1)
    print("we've been waiting a long time for a brave hero to aid us.")
    sleep(1)
    print("i thank you for taking up this quest.")
    sleep(2)
    print(".....")
    sleep(1)
    print("should you hope to save us, you must undertake three main objectives.")
    sleep(1)
    print("first, navigate to the portal to our world, hidden behind a wooden door.")
    sleep(1)
    print("to enter, you must prove your worth by correctly solving this riddle.")
    sleep(1)
    print("green, blue, blue.")
    sleep(1)
    print("tap the buttons a total of 3 times in the right order to pass.")
    
def button_process():
    while True:
        received = ser.readline()
        decoded = parseBytes(received)

        if ((decoded != "right") and (decoded != "wrong")):
            if (decoded == "1"):
                print("you pressed green")
            else:
                print("you pressed blue")
        elif (decoded == "right"):
            print("excellent work. onto the next!")
            break
        else:
            print("ah, incorrect..")
            sleep(1)
            print("resetting ... try again...")

def read_data_from_web():
    print("Reading data from the Web")
    data = "Data from the web"
    return data

def write_data_to_database(data):
    print("Writing data to a database")
    print(data)

def main():
    greeting()
    button_process()
    # data = read_data_from_web()
    # modified_data = process_data(data)
    # write_data_to_database(modified_data)

if __name__ == "__main__":
    main()