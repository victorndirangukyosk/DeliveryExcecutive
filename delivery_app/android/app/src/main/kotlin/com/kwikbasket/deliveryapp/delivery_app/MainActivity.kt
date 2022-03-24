package com.kwikbasket.deliveryapp.delivery_app

import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {
       override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        window.addFlags(WindowManager.LayoutParams.FLAG_SECURE)

        var kotlin_class: **** = ****(this, Environment.SANDBOX)

        provideFlutterEngine(this)?.let { GeneratedPluginRegistrant.registerWith(it) }

        val CHANNEL = "android3ds/name"

        val methodChannel = MethodChannel(flutterEngine?.dartExecutor?.binaryMessenger, CHANNEL).
        setMethodCallHandler{ call, result ->
            if (call.method.equals("customizar")){
                kotlin_class.customizar()
            }
        }
    }

}
