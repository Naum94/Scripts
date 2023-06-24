#!/bin/bash

#Youtube App
adb shell pm uninstall --user 0 com.google.android.youtube
#Facebook
adb shell pm uninstall --user 0 com.facebook.katana
adb shell pm uninstall --user 0 com.facebook.appmanager
adb shell pm uninstall --user 0 com.facebook.services
adb shell pm uninstall --user 0 com.facebook.system
#Google: Docs, Assistant, Photos, One, Search, Play Music, Play Videos, Lens, Wellbeing
#DUO
adb shell pm uninstall --user 0 com.google.android.apps.docs
adb shell pm uninstall --user 0 com.google.android.apps.googleassistant
adb shell pm uninstall --user 0 com.google.android.apps.photos
adb shell pm uninstall --user 0 com.google.android.apps.subscriptions.red
adb shell pm uninstall --user 0 com.google.android.googlequicksearchbox
adb shell pm uninstall --user 0 com.google.android.music
adb shell pm uninstall --user 0 com.google.android.videos
adb shell pm uninstall --user 0 com.google.ar.lens
adb shell pm uninstall --user 0 com.google.android.apps.wellbeing
adb shell pm uninstall --user 0 com.google.android.apps.tachyon
#MI Radio, Calculator, Scanner, Recorder, Notes, ShareMe, Weather, Player,
#Browser, Compass, Game Center, Doc Viewer, Share Conn
adb shell pm uninstall --user 0 com.miui.fm
adb shell pm uninstall --user 0 com.miui.fmservice
adb shell pm uninstall --user 0 com.miui.calculator
adb shell pm uninstall --user 0 com.xiaomi.scanner 
adb shell pm uninstall --user 0 com.android.soundrecorder
adb shell pm uninstall --user 0 com.miui.notes
adb shell pm uninstall --user 0 com.xiaomi.midrop
adb shell pm uninstall --user 0 com.miui.weather2
adb shell pm uninstall --user 0 com.miui.player
adb shell pm uninstall --user 0 com.mi.globalbrowser
adb shell pm uninstall --user 0 com.miui.compass
adb shell pm uninstall --user 0 com.xiaomi.glgm
adb shell pm uninstall --user 0 cn.wps.xiaomi.abroad.lite
adb shell pm uninstall --user 0 com.miui.mishare.connectivity
#MI Bluetooth, Forum, Remote, Peel Remote, Yellow Page, App Vault
adb shell pm uninstall --user 0 com.xiaomi.bluetooth
adb shell pm uninstall --user 0 com.xiaomi.bluetooth.overlay
adb shell pm uninstall --user 0 com.miui.enbbs
adb shell pm uninstall --user 0 com.duokan.phone.remotecontroller
adb shell pm uninstall --user 0 com.duokan.phone.remotecontroller.peel.plugin
adb shell pm uninstall --user 0 com.mi.android.globalminusscreen
adb shell pm uninstall --user 0 com.miui.yellowpage
#MI Cloud
adb shell pm uninstall --user 0 com.miui.cloudservice
adb shell pm uninstall --user 0 com.miui.cloudservice.sysbase
adb shell pm uninstall --user 0 com.miui.cloudbackup
adb shell pm uninstall --user 0 com.miui.micloudsync
#MI Services&Feedback, Coin, Payment
adb shell pm uninstall --user 0 com.miui.miservice
adb shell pm uninstall --user 0 com.xiaomi.payment
adb shell pm uninstall --user 0 com.micredit.in
adb shell pm uninstall --user 0 com.mipay.wallet.in
