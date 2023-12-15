# Description
A “book nook” is a shadow box meant to fit into a bookshelf and depicts any scene from civilization to nature or fantasy. Our project is a series of three interactive book nooks combined to create an escape room experience. The user acts as the fated hero meant to restore light and beauty to a cursed land. In the first book nook, a portal, the user has to decode the riddle provided by a Processing program to open the door to the next book nook, a magical forest scene. Here, the user must interact with the box in order to restore life to the land. Once all touch sensors are triggered, the final box will light up and the hero has saved the land.

## Book Nook 1: The Portal
- LED fairy lights, tissue paper, mirrors, esp32
- Interactive puzzle: green and blue buttons, servo motor + riddle
    - Using the clues from the riddle, the user must press the buttons a total of 3 times in the correct order. If pressed correctly, the servo motor will then be activated - opening the door to the second box

## Book Nook 2: The Forest
- LEDs (yellow for fairies, red for mushrooms, blue for underwater), 3 touch sensors, one servo motor, shrinky dinks, illustration, esp32
- Interactive puzzle: touch sensors + riddle
    - Using the clues from the riddle, the user had to figure out that they needed to touch hidden touch sensors
    - first touch the sensor in the lake (”make a wish with a coin”) - activating the yellow fairy LEDs
    - then touch the sensor hidden in the rocks (”touch the metallic rock”) - activating the red mushroom LEDs
    - finally touch the sensor beneath the lake (”feed the fish”) - activating the blue lake LEDs and turning on the stepper motor that starts moving the fish
    - once all three touch sensors were activated, the LEDs in the final box are turned on - the user has completed the quest!
 
## Book Nook 3: The Infinite Flower Field
- 10mm green LEDs (mushroom), white LED (in cloud), shrinky dinks, illustration, esp32
- once the parameters in the second box are fulfilled, all the LEDs are turned on - allowing the user to see into the box!

## Video
- linked here, showing the fully animated scene once the hero has completed the quest: https://youtube.com/shorts/c0bD3HbYxRY
