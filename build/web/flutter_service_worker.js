'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "f4e9dfe8ecbeb234a9b55ffafaf6bca9",
"assets/AssetManifest.bin.json": "4aa9187566c2bf9fb8dff32d3accb478",
"assets/AssetManifest.json": "18fb670892396b26b6dc2038193fc8be",
"assets/FontManifest.json": "98428a35cf37ca16d4ab113b5f5490f1",
"assets/fonts/fonts.ttf": "e7f409eb0d8afdc0e025cc2bd0987e4f",
"assets/fonts/MaterialIcons-Regular.otf": "6a6c380d4c4e4c17a3ca9c5d307d6a15",
"assets/image/1.jpg": "3d905692dbcfde2140c7b5935dd185c0",
"assets/image/arena.jpg": "47cd35f50c10eb909d919ade1f75c136",
"assets/image/bbc.png": "a10ea944e33b692937244de71e9efbb0",
"assets/image/bbc2.png": "50552557890067dfa33eb80edf694a7c",
"assets/image/box.png": "2030ab099f0bd5a111eaae1fac176a6e",
"assets/image/espn.jpg": "bbaa9ad753d9556a7b6b59ad41892d61",
"assets/image/euro1.jpg": "eda53e472da2fa3bb5ed215bd248daed",
"assets/image/euro2.png": "bed30a185e2dfcac9c1eeb166d42c09f",
"assets/image/f1.png": "c65cb6635c6f2f0da783d115580807eb",
"assets/image/fox.jpg": "32c26c9ed71f67f47e0071d7cb60b41a",
"assets/image/geo.jpg": "fe02e35361788923f7ff44ea68843f2e",
"assets/image/gf.png": "6a41b6d89e47cd2c0b378b5229ebaf55",
"assets/image/grand.png": "5b33380b9492066be003f14274ff0c44",
"assets/image/i.jpg": "d8ad641a9cb11eee2fb8c264383053cc",
"assets/image/laliga.png": "0960c43442a3733023b2a4541f530cdf",
"assets/image/maxi1.png": "711973e19d5d0eef363d1d85d9b962c2",
"assets/image/mix.jpg": "95c5ddff54c0f7b9d9e4b60321cd7a6a",
"assets/image/ptv.png": "9dc6559ccc09832098ce109797d5a261",
"assets/image/ru.png": "4d12b791dc3e8bf358dd70cf0b9c1ebd",
"assets/image/s.jpg": "536f2a983bb480ddfdf2b978fa535d0f",
"assets/image/six.png": "9f9b84ed5a4fe8b8e4c1c3b4443338dc",
"assets/image/sky.png": "35bdbde5d92bc80d6d87822b5c194e38",
"assets/image/sky3.png": "3ba0e3bc581af732c90aad2754eb14ce",
"assets/image/skyfootball.png": "a26c922da1b42e065e04f293f5761a58",
"assets/image/ssfootball.png": "37ae3a34fccce198bcf6ddfc7c245611",
"assets/image/star.jpg": "14497860bf99641d6d5c399e4223972f",
"assets/image/starhindi.jpg": "03efccbb20ade243283827af43501daf",
"assets/image/ten1.png": "6ba15fa523aaf59537e93fed8b8b954e",
"assets/image/tennis.png": "218e5e52ca2d06431d95ead62d6d6341",
"assets/image/tnt.jpg": "680c9226b68872263a13a134c875b666",
"assets/image/tnt4.png": "9224054bd88d05d794b61892fe0ca66f",
"assets/image/ts.jpg": "20f870aa114b8ae0358193c0c917d8ce",
"assets/image/tv.png": "5e92af5b108e79a4fac4bc67e1966a72",
"assets/image/via.jpg": "c353362a8ceac207ecdf0315727b6823",
"assets/image/willow.jpg": "b600eb7af01a694ce62a5ea9f1d82fe5",
"assets/image/xtra.jpg": "b0e9df801dabb7200da1dcd48fe92d4c",
"assets/NOTICES": "fd17159ac6d8f4f8a3290ea161dfaf9d",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"favicon.png": "42c1d7c647395728e1553b3f968f579d",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"flutter_bootstrap.js": "a1441abb5c23063d7893881eb1fe3efe",
"icons/Icon-512.png": "65834c470fd478a50f56854b4a728c90",
"icons/Icon-maskable-192.png": "bf68c627da227eafe13036127164591b",
"icons/Icon-maskable-512.png": "c9b7b0a1142891668db4e5970a22a810",
"index.html": "c5de94fdc5430bd3956522aa13666f11",
"/": "c5de94fdc5430bd3956522aa13666f11",
"main.dart.js": "77d3b0439a3a341b86211202fc2cc16a",
"manifest.json": "a09168290fbcf6abe0195746f7e6f6ff",
"vercel.json": "c85542c0ab65c1716cd7d3d56ca277ee",
"version.json": "37a1efcdcfd4bccc8a229f6ac62932e8"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
