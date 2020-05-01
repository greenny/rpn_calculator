# Reverse Polish Notation(RPN) Calculator
<img src="https://img.shields.io/badge/ruby%20-v2.5.1-brightgreen.svg" title="ruby-badge">

## Table of Contents

* [Description](#description)
* [Requirements](#system-requirements)
* [Setup](#setup)
* [Testing](#testing)
* [Implementation](#implementation)

## Description

We're building this command-line calculator for people who are comfortable with UNIX-like CLI utilities.
We are starting with the basic 4 operators now but will want to eventually implement other operators and
an alternate interface (such as WebSocket, file, or TCP socket).
There's no need to implement these, but design with these future changes in mind.

Specifications
--------------

1. The calculator should use standard input and standard output
2. It should implement the four standard arithmetic operators
3. The calculator should handle errors and recover gracefully
4. The calculator should exit when it receives a `q` command or an end of input 
   indicator (EOF / Ctrl+D)

Example Input/Output
--------------------

The format is not important, as long as it makes sense.

    > 5 
    5
    > 8
    8
    > +
    13

---

    > 5 8 +
    13.0
    > 13 -
    0.0

---

    > -3
    -3.0
    > -2
    -2.0
    > *
    6.0
    > 5
    5.0
    > +
    11.0

---

    > 5
    5
    > 9
    9
    > 1
    1
    > -
    8
    > /
    0.625

Guidelines
==========


## Implementation

Created Abstract `Runner` class for calculator running.
Two chield classes(ConsoleRunner and FileRunner) could be used to specify User Input.
It makes sence to do the same trick with Logger(f.e. for File Output or WebSocket) and use
Strategy pattern. But for now it's enaugh to use simple ConsoleLogger.

Class `RPNCalculator` is the engine of app.
It store arguments and could execute calculation if has all needed data(at least two numbers and operator).
In another case it store argumen or return error message.
I used BigDecimal for calculations but Floats only for Output for skip issues with Ruby's floats precision:
`0.1+0.2 == 0.3 => false`

To implement new operator we should just add it OPERATOR_ALIASES.

Also it will be great to use input validation to skip input conversion from `123a45` to `123.0`

## System Requirements

This application requires ruby to be installed to your local
machine:

* [Ruby 2.5.1 or higher](https://www.ruby-lang.org/en/)

## Setup

To setup this application locally, take the following steps:

* Clone or download this repository.
* Choose rpn_calculator directory in your terminal
* Run bundle
* Type `ruby start.rb` to run the program from console or
  `ruby start.rb ./tmp/example.txt` to use input from file(f.e.)

## Testing

To test this application locally, take the following steps:

* Run `rspec` to run the test suite
* All 5 examples should pass

