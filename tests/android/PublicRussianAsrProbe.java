package pixel.camera.probe;
import android.app.Activity;
import android.os.Bundle;
import android.content.Intent;
import android.speech.*;
import android.widget.TextView;
import android.util.Log;
import java.util.concurrent.Executors;
public class PublicRussianAsrProbe extends Activity {
 private TextView view; private SpeechRecognizer recognizer;
 private void log(String message){Log.i("PublicRussianASR",message);runOnUiThread(()->view.append(message+"\n"));}
 public void onCreate(Bundle state){
  super.onCreate(state);view=new TextView(this);view.setTextSize(16);view.setPadding(20,20,20,20);setContentView(view);
  boolean local=SpeechRecognizer.isOnDeviceRecognitionAvailable(this);log("on-device recognizer available="+local);
  if(!local)return;
  recognizer=SpeechRecognizer.createOnDeviceSpeechRecognizer(this);
  Intent intent=new Intent(RecognizerIntent.ACTION_RECOGNIZE_SPEECH).putExtra(RecognizerIntent.EXTRA_LANGUAGE,"ru-RU").putExtra(RecognizerIntent.EXTRA_LANGUAGE_MODEL,RecognizerIntent.LANGUAGE_MODEL_FREE_FORM);
  recognizer.checkRecognitionSupport(intent,Executors.newSingleThreadExecutor(),new RecognitionSupportCallback(){
   public void onSupportResult(RecognitionSupport result){
    log("installed="+result.getInstalledOnDeviceLanguages());log("pending="+result.getPendingOnDeviceLanguages());log("available="+result.getSupportedOnDeviceLanguages());
    runOnUiThread(() -> {
      if(result.getInstalledOnDeviceLanguages().contains("ru-RU")) { listen(intent); return; }
      recognizer.triggerModelDownload(intent, getMainExecutor(), new ModelDownloadListener(){
       public void onProgress(int completed){log("download="+completed);}
       public void onSuccess(){log("Russian model installed");listen(intent);}
       public void onScheduled(){log("model download scheduled");}
       public void onError(int error){log("model download error="+error);}
      });
    });
   }
   public void onError(int error){log("support error="+error);}
  });
 }
 private void listen(Intent intent) {
  try {
   java.io.File sample=new java.io.File(getExternalFilesDir(null),"russian.pcm");
   if(sample.length()<3200)throw new java.io.IOException("PCM fixture missing or too short: "+sample.length());
   log("PCM bytes="+sample.length());
   android.os.ParcelFileDescriptor[] pipe=android.os.ParcelFileDescriptor.createPipe();
   android.os.ParcelFileDescriptor audio=pipe[0];
   new Thread(() -> {
    try(java.io.InputStream input=new java.io.FileInputStream(sample);
        java.io.OutputStream output=new android.os.ParcelFileDescriptor.AutoCloseOutputStream(pipe[1])) {
      byte[] bytes=new byte[3200];int count;
      while((count=input.read(bytes))!=-1){output.write(bytes,0,count);Thread.sleep(100);}
    }catch(Exception error){log("PCM writer="+error);}
   },"PCM-test-writer").start();
   intent.putExtra(RecognizerIntent.EXTRA_AUDIO_SOURCE,audio);
   intent.putExtra(RecognizerIntent.EXTRA_AUDIO_SOURCE_CHANNEL_COUNT,1);
   intent.putExtra(RecognizerIntent.EXTRA_AUDIO_SOURCE_ENCODING,android.media.AudioFormat.ENCODING_PCM_16BIT);
   intent.putExtra(RecognizerIntent.EXTRA_AUDIO_SOURCE_SAMPLING_RATE,16000);
   intent.putExtra(RecognizerIntent.EXTRA_PARTIAL_RESULTS,true);
   intent.putExtra(RecognizerIntent.EXTRA_SEGMENTED_SESSION,RecognizerIntent.EXTRA_AUDIO_SOURCE);
   recognizer.setRecognitionListener(new RecognitionListener(){
    public void onReadyForSpeech(Bundle b){log("ready for offline PCM");}
    public void onBeginningOfSpeech(){log("speech started");}
    public void onRmsChanged(float rms){}
    public void onBufferReceived(byte[] b){}
    public void onEndOfSpeech(){log("speech ended");}
    public void onError(int code){log("recognition error="+code);}
    public void onResults(Bundle result){log("RESULT="+result.getStringArrayList(SpeechRecognizer.RESULTS_RECOGNITION));}
    public void onPartialResults(Bundle result){log("PARTIAL="+result.getStringArrayList(SpeechRecognizer.RESULTS_RECOGNITION));}
    public void onSegmentResults(Bundle result){log("SEGMENT="+result.getStringArrayList(SpeechRecognizer.RESULTS_RECOGNITION));}
    public void onEndOfSegmentedSession(){log("segmented session ended");}
    public void onEvent(int code,Bundle b){}
   });
   recognizer.startListening(intent);
  }catch(Exception error){log("listen failed="+error);}
 }
 protected void onDestroy(){if(recognizer!=null)recognizer.destroy();super.onDestroy();}
}
