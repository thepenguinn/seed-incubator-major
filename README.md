<h3 align="center">
    <img src="https://raw.githubusercontent.com/thepenguinn/seed-incubator-major/refs/heads/main/res/icon_line.svg" width="140" alt="Logo"/><br/>
</h3>

<h4 align="center">
    <a>Seed Inc.</a>
</h4>

> [!CAUTION]<br>
> Work In Progress.

---

<h4 align="center">
    <a>Seed Incubation Plant: All Things Seedling.</a>
</h4>

> The Seed Incubation Plant aims to optimize the germination and growth process
> of seeds by providing a controlled and monitored environment.

# Subsystems of the Incubator

The incubator consist of three main parts:

<h3 align="center">
    <img src="https://raw.githubusercontent.com/thepenguinn/seed-incubator-major/refs/heads/dev/res/overview.svg" width="80%" alt="Overview"/><br/>
</h3>

## EMCU: Environment Monitoring and Control Unit

EMCU takes care of everything related to the environment of
the seedling. It helps to mimic the preferable conditions of the
seedling in the insides of the incubator, even though the outsides
possess a harsh environment. EMCU is further classified into different
systems. In the following chapters we will get familiarized with most
of these systems and their different aspects.

## GMU: Growth Monitoring Unit

It is important to closely monitor the seedling throughout its growth phases.
This data helps EMCU to fine tune the environment more. And the user can
remotely monitor the state of the incubator and the seedlings. GMU help
to do exactly that. It makes use of TinyML powered ESP32 CAM to monitor growth
phases of different saplings.

## SINC: An Android App

SINC is the interface between the incubator and the user.
It helps to manage different aspects of the incubator. All the information
collected from the EMCU and GMU will be available to the user via SINC.
And it also helps the user to control different aspects of the Incubator.

# Roadmap

## EMCU

- [ ] Frame
    - [x] Incubator area CAD design
    - [x] Electronics bay CAD design
    - [x] Reservoir CAD design
    - [x] Top hatch CAD design
    - [ ] Core block mount CAD design
    - [ ] Exhaust branches mount CAD design
    - [x] Incubator area
        - [x] Front base
        - [x] Back base
        - [x] Front panel
        - [x] Front side panel 1
        - [x] Front side panel 2
        - [x] Back side panel
        - [x] Back side hatch
        - [x] Back panel
    - [ ] Electronics bay
        - [x] Base
        - [ ] Side panel 1
        - [ ] Side panel 2
    - [ ] Reservoir
        - [ ] Base
        - [ ] Side panel 1
        - [ ] Side panel 2
        - [ ] Front panel
        - [ ] Back panel
    - [ ] Top hatch frame
    - [x] Vertical panel connectors
    - [x] Attach different frame pieces
    - [ ] Core block mount
    - [ ] Exhaust branches mount
    - [ ] Waterproof the frame
    - [ ] Black paint the frame

---

- [ ] Mid layers
    - [ ] Insulating layer for incubator area
        - [ ] CAD design
        - [ ] Frame connectors
        - [ ] Cut all the foam pieces
        - [ ] Assemble
    - [ ] Water tight layer for Reservoir
        - [ ] Pick a suitable material
        - [ ] Cut all the pieces
        - [ ] Attach them to the frame
        - [ ] Make the joints waterproof
    - [ ] Electronics bay board mounting surface
        - [ ] Decide where different components will roughly go
        - [ ] Cut foam
        - [ ] Assemble / attach pieces

---

- [ ] Thermal / Exhaust
    - [x] Core block functional CAD design
    - [ ] Core block implementable CAD design
    - [ ] Exhaust branch CAD design
    - [ ] Exhaust inlet CAD design
    - [ ] Finalize panel control (using gears or pulley)
    - [ ] Decide where to place DHT22 sensors
    - [ ] Decide wiring routes
        - [ ] For core block mid panels
        - [ ] For core block side panels
        - [ ] For core block bottom panels
        - [ ] For exhaust branch fans
        - [ ] For inlet panels
    - [ ] Core block
        - [ ] Panels
            - [ ] Cut foam pieces for mid panels
            - [ ] Assemble mid panels
            - [ ] Cut foam pieces for side panels
            - [ ] Assemble side panels
            - [ ] Cut foam pieces for bottom panels
            - [ ] Assemble bottom panels
        - [ ] Chambers
            - [ ] Cut foam pieces for heating chamber
            - [ ] Assemble heating chamber
            - [ ] Cut foam pieces for cooling chamber
            - [ ] Assemble cooling chamber
            - [ ] Cut foam pieces for common chamber
            - [ ] Assemble common chamber
    - [ ] Exhaust branches
        - [ ] Build or 3D print fan mounts
            - [ ] For left branch
            - [ ] For right branch
        - [ ] Cut foam pieces for left branches
        - [ ] Assemble left branches
        - [ ] Cut foam pieces for right branches
        - [ ] Assemble right branches
    - [ ] Exhaust inlets
        - [ ] Design inlet port mode switching mechanism
        - [ ] Cut foam pieces for inlet panels
        - [ ] Assemble inlet panels
            - [ ] For Inlet 1
            - [ ] For Inlet 2
        - [ ] 3D print parts if needed
            - [ ] For Inlet 1
            - [ ] For Inlet 2
        - [ ] Assemble inlet mode switcher
            - [ ] For Inlet 1
            - [ ] For Inlet 2
    - [ ] Dedicated coolers
        - [ ] Finalize placement
        - [ ] Design cooling side fan mount with air redirection
        - [ ] 3D print or foam build the cooling side fan mounts
            - [ ] For Cooler 1
            - [ ] For Cooler 2
            - [ ] For Cooler 3
            - [ ] For Cooler 4
        - [ ] Design mount for peltier and heat sink module
        - [ ] Build peltier mount from foam
            - [ ] For Cooler 1
            - [ ] For Cooler 2
            - [ ] For Cooler 3
            - [ ] For Cooler 4

---

- [ ] Air moisture
    - [ ] Finalize placement of humidifiers
    - [ ] Design mount for humidifiers
    - [ ] Build humidifier reservoir and mount from foam
        - [ ] For humidifier 1
        - [ ] For humidifier 2
    - [ ] Design water transport mechanism
          (from dedicated coolers to reservoir and reservoir to humidifiers)
    - [ ] Build water transport mechanism
        - [ ] For humidifier 1
        - [ ] For humidifier 2
    - [ ] Mount design for ultrasonic sensors
    - [ ] 3D print or foam build the ultrasonic sensor mount
        - [ ] For humidifier 1
        - [ ] For humidifier 2
    - [ ] Decide wiring routes
        - [ ] For water transport mechanism actuators
        - [ ] For humidifiers
        - [ ] For reservoir level detectors (ultrasonic sensors)

---

- [ ] Lighting
    - [ ] Decide placement
        - [ ] For grow lights
        - [ ] For GMU lights
    - [ ] Decide wiring routes
        - [ ] For grow lights
        - [ ] For GMU lights
    - [ ] Mounts for lights
    - [ ] Attach / assemble lights

---

- [ ] Water and fertilizer
    - [ ] Decide whether to use robotic arm or channels to deliver water
    - [ ] Mount design for ultrasonic sensors
    - [ ] 3D print or foam build the ultrasonic sensor mount
        - [ ] For water reservoir
        - [ ] For fertilizer reservoir
    - [ ] Design outside drain ports
    - [ ] Build outside drain ports
        - [ ] For water reservoir
        - [ ] For fertilizer reservoir
    - [ ] Design intake port and mechanism
    - [ ] Build intake ports
        - [ ] For water reservoir
        - [ ] For fertilizer reservoir
    - [ ] Design refill port and mechanism
    - [ ] Build refill ports
        - [ ] For water reservoir
        - [ ] For fertilizer reservoir
    - [ ] Decide wiring routes
        - [ ] For intake port
        - [ ] For refill port
        - [ ] For ultrasonic sensor

---

- [ ] Hatches
    - [ ] Decide which board controls the motors
    - [ ] Custom linear potentiometers
        - [ ] For top hatch
        - [ ] For side hatch
    - [ ] Design hatch panels
        - [ ] For top hatch
        - [ ] For side hatch
    - [ ] Build hatch panels
        - [ ] For top hatch
        - [ ] For side hatch

---

- [ ] Auxiliary system
    - [ ] Extract coils from relay and test them to be used as an actuator
          for water transport mechanism
    - [ ] Build the other half of multiplexer board
    - [ ] Build 2nd relay daughter board
    - [ ] Add pin headers to relay boards
    - [ ] Build main boards
        - [ ] Main board 1
        - [ ] Main board 2
        - [ ] Main board 3
    - [ ] Mother board design
    - [ ] Build mother board
    - [ ] Decide placement of different components
        - [ ] Multiplexer board
        - [ ] Relay boards
        - [ ] Main boards
        - [ ] Cooling fans
        - [ ] Power supply

- [ ] Software

## GMU

- [ ] Rail System
    - [ ] Mechanical Design
        - [ ] Frame base and rail supports
        - [ ] Rail path layout (X-Y movement)
        - [ ] Carriage design for ESP32-CAM mount
        - [ ] Design pulley or linear screw mechanism
        - [ ] Limit switch mounts
        - [ ] 3D print or fabricate structural parts
        - [ ] Assemble mechanical frame and rail path
    - [ ] Actuation System
        - [ ] Design motor mount brackets
        - [ ] Wire routing and motor connection
        - [ ] Install limit switches
        - [ ] Calibrate home position
        - [ ] Test manual movement via controller
    - [ ] Electronics & Control
        - [ ] Motor driver circuit setup
        - [ ] Motor control via ESP32
        - [ ] Limit switch interface with microcontroller
        - [ ] Power supply wiring
    - [ ] Software / Firmware
        - [ ] Develop basic motion control code
        - [ ] Implement stepper movement commands
        - [ ] Add position feedback (limit switches or encoder)
        - [ ] Test rail movement from SINC
    - [ ] Integration & Testing
        - [ ] Mount ESP32-CAM on carriage
        - [ ] Capture and stream images while moving
        - [ ] Synchronize camera capture with rail position
        - [ ] Calibrate travel range and accuracy
        - [ ] Test full automated scan of incubator area

---

- [ ] TinyML Modeling
    - [ ] Dataset Preparation
        - [ ] Collect plant growth images from espcam
        - [ ] Categorize- sprout, germination, early stage , mature
        - [ ] Clean and augment dataset (crop, resize, normalize)
        - [ ] Store dataset in local or cloud storage
    - [ ] Model Training
        - [ ] Model confirmation
        - [ ] Train using tensorflow/TFLite
        - [ ] Optimize model for ESP32-CAM
        - [ ] Validate accuracy and confusion matrix
    - [ ] Deployment
        - [ ] Convert model to TFLite format
        - [ ] Integrate model into ESP32 firmware
        - [ ] Test inference with live camera images
        - [ ] Optimize memory and performance
    - [ ] System Integration
        - [ ] Link model output to app (growth stage display)
        - [ ] Send inference results to SINC
    - [ ] Evaluation
        - [ ] Compare predictions with manual observation
        - [ ] Adjust dataset or retrain model
        - [ ] Document model accuracy and reliability


## SINC

- [ ] Foundation

    - [ ] App initialization in Flutter
    - [ ] App branding (Logo, Splash screen, Color theme)
    - [ ] Authentication & onboarding (User login / setup screen)
    - [ ] Basic navigation setup (Home, Controls, Monitoring, Settings)

---

- [ ] Network Communication

    - [ ] TCP client implementation in Flutter
        - [ ] Establish connection with EMCU and GMU ESP32 modules
        - [ ] Define data packet structure
        - [ ] Implement connect/disconnect and auto-reconnect features
    - [ ] Secure connection layer
        - [ ] Local network discovery
        - [ ] Connection timeout handling
        - [ ] Connection status indicator in UI
        - [ ] Debug console for raw data logs

---

- [ ] Sensor Monitoring Dashboard

    - [ ] Design live data dashboard
        - [ ] Temperature
        - [ ] Humidity
        - [ ] Soil moisture
        - [ ] Water/fertilizer levels
    - [ ] Real-time data updates
    - [ ] Historical data visualization (using charts)
    - [ ] Alert and threshold notifications

---

- [ ] Actuator Control Panel

    - [ ] Control switches and sliders for actuators:
        - [ ] Fan
        - [ ] Heater
        - [ ] Humidifier
        - [ ] Light
    - [ ] Command feedback from EMCU
    - [ ] Safe override feature for manual control

---

- [ ] Camera and Image Interface

    - [ ] Integrate ESP32-CAM live stream
    - [ ] Capture and display images within the app
    - [ ] Growth stage indicator (TinyML output from GMU)
    - [ ] Gallery for time-lapse images
    - [ ] Manual camera control from app

---

- [ ] Data Storage and Analytics

    - [ ] Local data caching
    - [ ] Cloud sync support
    - [ ] Data export
    - [ ] Analytics dashboard for growth trends

---

- [ ] UX & Testing

    - [ ] Final UI/UX polish
    - [ ] App walkthrough and user guide
    - [ ] Beta testing and feedback collection
    - [ ] Performance optimization
    - [ ] App packaging and deployment

---

- [ ] Integration & Maintenanance

    - [ ] Integrate with EMCU and GMU final firmware
    - [ ] Routine maintenance and updates
    - [ ] Documentation and versioning
