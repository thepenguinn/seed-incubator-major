---
title: Specification for Sinc App
geometry: a4paper,margin=1in
---

# Overview of SINC App

SINC (Seed-Inc) is a companion app designed for the Seed Incubator.
It intermediates the interface between the user and the Incubator and
helps to monitor and control different aspects of the Incubator.

## User Interface

There will be four sub-menus / windows:

- Home / Overview Page
- Control Center
- Incubator Settings (General Settings) and Raw Controls
- App Settings

### Home / Overview Page

Gives an overview of the Incubator. Will have a section to show the alerts from the
Incubator.

### Control Center

Will have a list of widgets, each one will correspond to the particular aspect that
we are controlling or monitoring (like Temperature, Humidity, Lighting, etc). Clicking the
widget will take the user to the corresponding page. That page will show all the information
about that particular aspect. There will be some way to choose the desired state (like
choosing the temperature, humidity, etc). Also there will be a section to list alerts
regarding that aspect.

### Incubator Settings (General Settings) and Raw Controls

This menu will give the raw control over the actuators of the Incubator. If the user want
to turn on or turn off some actuator (Like peltier, humidifier, panel motors, hatch motors, etc),
this menu helps them to do exactly that. Also any other general settings related to the Incubator
will goes here.

### App Settings

Any settings that are specific to the app goes here. Like fonts, themes, etc.
