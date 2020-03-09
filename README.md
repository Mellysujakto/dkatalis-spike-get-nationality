# d_katalis_spike_geo_location

Flutter Get Nationality Using Google Maps for Android

1. Get Google Maps Api Key
    Please follow this step for get Google Api Key : https://www.youtube.com/watch?v=1JNwpp5L4vM

2. Put the Google Api Key into "android/app/src/main/AndroidManifest.xml" like this :
        <application
            ....
            <meta-data android:name="com.google.android.geo.API_KEY"
            android:value="YOUR_API_KEY"/>
        </application>

3. Create the permission in "android/app/src/main/AndroidManifest.xml" like this :
        <manifest>
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
            ...
        </manifest>

4. Add Dependencies

        dependencies:
            google_maps_flutter: ^0.4.0 
                // get the google maps
            location: ^2.5.0 
                // get the current location point
            geocoder: ^0.2.1 
                // get the full address from location point
        
       