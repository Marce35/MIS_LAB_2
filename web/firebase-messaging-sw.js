importScripts("https://www.gstatic.com/firebasejs/9.10.0/firebase-app-compat.js");
importScripts("https://www.gstatic.com/firebasejs/9.10.0/firebase-messaging-compat.js");



const firebaseConfig = {
    apiKey: "AIzaSyCxNV1Su6JgbmBjW6Kz2JpmoadiSIOlfYM",
    authDomain: "flutter-firebase-messages.firebaseapp.com",
    projectId: "flutter-firebase-messages",
    storageBucket: "flutter-firebase-messages.firebasestorage.app",
    messagingSenderId: "559354249507",
    appId: "1:559354249507:web:f117b19dbd44c43c76cc96"
  };

firebase.initializeApp(firebaseConfig);
// Necessary to receive background messages:
const messaging = firebase.messaging();

// Optional:
messaging.onBackgroundMessage((m) => {
  console.log("onBackgroundMessage", m);
});