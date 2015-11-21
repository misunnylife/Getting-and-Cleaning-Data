# **Code Book**

This code book describes the variables in the original data set that are used to derive the tidy data file  [tidyAverage.txt](https://github.com/misunnylife/Getting-and-Cleaning-Data/blob/master/tidyAverage.txt).

## Data Source
This information in this code book is based on the information in the *features_info.txt* from the data sets and from the information provided on the UCI web page _"Human Activity Recognition Using Smartphones Data Set"_ which can be found at  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

## Raw Data
The features from the original data set come from the 3-axial accelerometer and gyroscope embedded in the Samsung Galaxy S smartphone. These time domain signals, labeled as __timeAccelerometer-XYZ__ and __timeGyroscope-XYZ__ were captured at a constant rate of 50 Hz, filtered using amedian filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. The acceleration signal was then further separated into body and gravity acceleration compnents, labeled__timeBodyAccelerometer-XYZ__ and __timeGravityAccelerometer-XYZ__, by applying a low pass Butterworth filter with a corner frequency of 0.3 Hz.

The body linear acceleration and angular velocity were derived in time to obtain Jerk signals (__timeBodyAccelerometerJerk-XYZ__ and __timeBodyGyroscopeJerk-XYZ__). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (__timeBodyAccelerometerMagnitude__, __timeGravityAccelerometerMagnitude__, __timeBodyAccelerometerJerkMagnitude__, __timeBodyGyroscopeMagnitude__, __timeBodyGyroscopeJerkMagnitude__).

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing __frequencyBodyAccelerometer-XYZ__, __frequencyBodyAccelerometerJerk-XYZ__, __frequencyBodyGyroscope-XYZ__, __frequencyBodyAccelerometerJerkMagnitude__, __frequencyBodyGyroscopeMagnitude__, __frequencyBodyGyroscopeJerkMagnitude__.

In addition, there are six _activity_ labels to identify the type of the activity associate with the measuremens: __LAYING__, __SITTING__, __STANDING__, __WALKING__, __WALKING DOWNSTAIRS__, and __WALKING_UPSTAIRS__.

The __subject__ for which the measurements are taken, are labeled from __1__ to __30__.

All features in the raw data set are normalized and bounded within [-1,1].

## Unit of Measurement
_Accelerometer Unit_ : __standard gravity g__  
_Gyroscope Unit_     : __radiants/second__

## Processed Data
Per project requirement, only the _mean_ and _standard deviation_ of the measurements are extracted by the __run_analysis.R__.

__mean()__: Mean value   
__std()__:  Standard deviation

In addition,the following variables appear in the original data set, but they are not used by the  _run_analysis.R_:  
_mad()_: Median absolute deviation  
_max()_: Largest value in array  
_min()_: Smallest value in array  
_sma()_: Signal magnitude area  
_energy()_: Energy measure. Sum of the squares divided by the number of values  
_iqr()_: Interquantile range  
_entropy()_: Signal entropy  
_arCoeff()_: Autorregresion coefficients with Burg order equal to 4  
_correlation()_: correlation coefficient between two signals  
_maxInds()_: index of the frequency component with largest magnitude  
_meanFreq()_: Weighted average of the frequency components to obtain a mean frequency  
_skewness()_: skewness of the frequency domain signal   
_kurtosis()_: kurtosis of the frequency domain signal   
_bandsEnergy()_: Energy of a frequency interval within the 64 bins of the FFT of each window.  
_angle()_: Angle between to vectors  

To produce the __tidyAverage.txt__ data set, the measurements of each variable for each subject and activity are averaged out using the R standard _mean()_ function and the results are sorted in ascending order.