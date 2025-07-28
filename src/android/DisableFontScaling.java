package io.globules;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaInterface;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CordovaWebView;
import org.apache.cordova.LOG;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.util.Log;

public class DisableFontScaling extends CordovaPlugin {
    public static final String TAG = "DisableFontScaling";

    @Override
    public void initialize(CordovaInterface cordova, CordovaWebView webView) {
        Log.d(TAG, "Initializing plugin");
        super.initialize(cordova, webView);        
        try {
            WebView nativeWebView = (WebView) webView.getEngine().getView();
            WebSettings settings = nativeWebView.getSettings();
            settings.setTextZoom(100); // Lock font scaling to 100%
            Log.d(TAG, "TextZoom set to: " + settings.getTextZoom());
        } catch (Exception e) {
            Log.e(TAG, "Error setting textZoom: " + e.getMessage());
        }
    }
}