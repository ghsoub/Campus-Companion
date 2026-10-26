#!/usr/bin/env bash
set -u
mkdir -p evidence
test_result=0
./gradlew --no-daemon --console=plain connectedDebugAndroidTest || test_result=$?
adb pull /sdcard/Download/campus-events-evidence evidence/ || true
adb logcat -d -s CampusExercise:I CampusEvents:W '*:S' > evidence/logcat.txt || true
exit "$test_result"
