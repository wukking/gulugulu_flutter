package com.wuyans.gulugulu.flutter.gulugulu_flutter

import android.content.Intent
import android.os.Bundle
import android.util.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {

    private var shareText:String? = ""
    private val CHANNEL = "app.channel.shared.data"

    override fun onNewIntent(intent: Intent) {
        super.onNewIntent(intent)
        setIntent(intent)
        Log.e("TAG", "onNewIntent: ")
        handleSendText()
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        handleSendText()
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        GeneratedPluginRegistrant.registerWith(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger,CHANNEL).setMethodCallHandler{call,result->
            if (call.method == "getShareText"){
                result.success(shareText)
                shareText = null
            }
        }

    }

    private fun handleSendText(){
        val action = intent.action
        val type = intent.type

        if (Intent.ACTION_SEND == action && type != null){
            if ("text/plain" == type){
                shareText = intent.getStringExtra(Intent.EXTRA_TEXT);
            }
        }
    }
}
