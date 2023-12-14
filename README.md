# BMI Calculator Shiny App

## Overview
This repository contains the source code for a BMI (Body Mass Index) Calculator Shiny App, packaged as a Docker image. The app allows users to input their weight and height, and it calculates the BMI along with a classification into different categories (Underweight, Normal Weight, Overweight, and Obesity).

## Running the app: 
Since this is a dockerized app, you need to pull the image and run a container in order to run the app. This can be done with a simple command: 
- To pull the image: 
```
docker pull sahilmohammad/bmi_app:v2
```
- To run the container:
```
docker run -p 3838:3838 bmi_app:v2
```
Alternatively, you can run the following command instead of explicitly pulling an image:
```
docker run -p 3838:3838 sahilmohammad/bmi_app:v2
```
This command will pull the image from dockerhub, if not present locally and run the container.

Once the container is up and running, you can simply connect to **localhost:3838** on your browser to access the BMI Calculator.
