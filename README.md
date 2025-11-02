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
    - [ ] Reservoir CAD design
    - [ ] Top hatch CAD design
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
        - [ ] Base
        - [ ] Side panel 1
        - [ ] Side panel 2
    - [ ] Reservoir
        - [ ] Base
        - [ ] Side panel 1
        - [ ] Side panel 2
        - [ ] Front panel
        - [ ] Back panel
    - [ ] Top hatch frame
    - [ ] Vertical panel connectors
    - [ ] Attach different frame pieces
    - [ ] Core block mount
    - [ ] Exhaust branches mount
    - [ ] Waterproof the frame

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
    - TODO: List out all the things to do

---

- [ ] Auxiliary system
    - TODO: List out all the things to do

## GMU

## SINC
