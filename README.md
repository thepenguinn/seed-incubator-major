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

## GMU

## SINC
