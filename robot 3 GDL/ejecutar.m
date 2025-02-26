% Ejecutable del archivo
global EV3 myoObject

clearvars -global -EXCEPT myoObject EV3
close all;
clc;

% DIRECTORIO
addpath(genpath(pwd));

% Variables observación
global flags datosUsuario
flags.kPerdidasDibujarGUI = 0;
flags.kEjecucionesDibujarGUI = 0;


%% Interfaz en GUI
interfazUsuario
