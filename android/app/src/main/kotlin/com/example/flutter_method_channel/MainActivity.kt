package com.example.flutter_method_channel

import android.app.AlertDialog
import android.content.Context
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "my.channel.dialog"

    private lateinit var channelDialog: MethodChannel


    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        channelDialog = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
        channelDialog.setMethodCallHandler { call, result ->

            if (call.method == "callDialog") {
               result.success(showDialogWithTitle(this,"Hello from ANDROID"))
            }

        }


    }

    fun showDialogWithTitle(context: Context, title: String) {
        val builder = AlertDialog.Builder(context)
        builder.setTitle(title)
        builder.setPositiveButton("OK") { dialog, _ ->
            dialog.dismiss()
        }
        val dialog = builder.create()
        dialog.show()
    }

}
