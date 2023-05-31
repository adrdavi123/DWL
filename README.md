# DWL #


## What is this repository for? ##

####

The DWL script selects and presents the dominant wavelengths of a stylolite. 
The script was developed in the GNU Octave language and relies on Fast Fourier Transform and Bandpass Filter techniques. 
####
Accompanies the manuscript "Dominant wavelength: A tool for morphological simplification of stylolites"

## How do I get set up? ##
####
1.	Download the GNU Octave software from the following link: https://octave.org/download. Choose the appropriate option based on the user's operating system. 
####
2.	Install GNU Octave according to the tutorials available at the following link: https://wiki.octave.org/Octave_for_Microsoft_Windows.
####
3.	Open the "Octave-8.2.0 (Local) (GUI)" application.
####
4.	Change the working directory to the folder where the files "dwl_script.m", "Bandpass.m", and "working_sample_1.csv" are located. All three files should be in the same folder.
####
5.	In the "File Browser" window, click on "dwl_script.m".
####
6. Click on "Save and Run/Continue".

## Output files ##

1.	 The script processing will result in three images:

	* "figure_1_bandpass_filter.jpg": Results of applying the bandpass filter in the real frequency domain.

	* "figure_2_stylolite_grid.jpg": Stylolite grid

	* "figure_3_dwl_final_image.jpg": Comparison between the dominant wavelengths and the digitized stylolite
	
####

	
2. Numerical DWL will be calculated in the command window and stored in the variable "ans".

## Input files ##

####


1.	The input file should be in .csv format. This file should contain two columns for the Cartesian variables of the digitized stylolite. See the working_sample_1.csv file. 
####
2. In the dwl script, the highlighted part of the following command line, "g=dlmread(**'working_sample_1.csv'**);", should be renamed according to the input file.



## Who do I talk to? ##

André Davi Ferreira - Universidade Federal do Paraná
Email: **andredavi@ufpr.br** and **adrdavi123@gmail.com**

