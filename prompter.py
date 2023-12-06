import serial
from time import sleep

ser = serial.Serial('/dev/tty.usbserial-110')  # open serial port

def parseBytes(byteString):
    decoded = byteString.decode("utf-8")
    decoded = decoded.strip()
    return decoded


def greeting():
    print("welcome, destined one")
    sleep(1)
    print("i, guardian of shadows, greet you in our realm")
    sleep(1)
    print("i wonder what distant lands you call home...")
    sleep(1)
    print("darkness has gripped our land")
    sleep(1)
    print("but you—a beacon of hope—have arrived as foretold")
    sleep(1)
    print(".....")
    sleep(1)
    print("embrace your purpose, wield courage, and illuminate our world")
    sleep(1)
    print("may the stars guide your triumph.\n")
    sleep(1)
    print(".....")
    sleep(1)
    print("should you hope to save us, you must undertake three main objectives.")
    sleep(1)
    print("first, navigate to the portal to our world, hidden behind a wooden door.")
    sleep(1)
    print("to enter, you must prove your worth by correctly solving this riddle.\n")
    sleep(1)


    print("In a world of buttons, a puzzle unfolds,")
    sleep(1)
    print("A sequence of colors, a story to be told.")
    sleep(1)
    print("Begin with nature's hue, vibrant and bright,")
    sleep(1)
    print("Press me first, and set things right.\n")
    sleep(1)

    print("Next in line, a shade of the vast, open sea,")
    sleep(1)
    print("A button of tranquility, press it with glee.")
    sleep(1)
    print("But don't stop there, the journey's not through,")
    sleep(1)
    print("Once more in azure, a repeat is due.\n")
    sleep(1)

    print("In this coded dance, your actions speak true,")
    sleep(1)
    print("Which buttons to press? Solve the riddle, it's up to you.\n")
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