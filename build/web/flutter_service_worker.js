'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "5428dbefbbdea4272ccb245dd494fba7",
"assets/AssetManifest.bin.json": "4bcf4afb964cc339fbc25f38e9064804",
"assets/AssetManifest.json": "f397122d4e86c147ba32b488e235cc0b",
"assets/FontManifest.json": "98428a35cf37ca16d4ab113b5f5490f1",
"assets/fonts/fonts.ttf": "e7f409eb0d8afdc0e025cc2bd0987e4f",
"assets/fonts/MaterialIcons-Regular.otf": "a9b5f1fdf117038f12db45f875a34c54",
"assets/image/1.jpg": "3d905692dbcfde2140c7b5935dd185c0",
"assets/image/box.png": "2030ab099f0bd5a111eaae1fac176a6e",
"assets/image/espn.jpg": "bbaa9ad753d9556a7b6b59ad41892d61",
"assets/image/euro1.jpg": "eda53e472da2fa3bb5ed215bd248daed",
"assets/image/f1.png": "c65cb6635c6f2f0da783d115580807eb",
"assets/image/fox.jpg": "32c26c9ed71f67f47e0071d7cb60b41a",
"assets/image/geo.jpg": "fe02e35361788923f7ff44ea68843f2e",
"assets/image/gf.png": "6a41b6d89e47cd2c0b378b5229ebaf55",
"assets/image/i.jpg": "d8ad641a9cb11eee2fb8c264383053cc",
"assets/image/laliga.png": "0960c43442a3733023b2a4541f530cdf",
"assets/image/mix.jpg": "95c5ddff54c0f7b9d9e4b60321cd7a6a",
"assets/image/ptv.png": "9dc6559ccc09832098ce109797d5a261",
"assets/image/s.jpg": "536f2a983bb480ddfdf2b978fa535d0f",
"assets/image/six.png": "9f9b84ed5a4fe8b8e4c1c3b4443338dc",
"assets/image/sky.png": "35bdbde5d92bc80d6d87822b5c194e38",
"assets/image/skyfootball.png": "a26c922da1b42e065e04f293f5761a58",
"assets/image/ssfootball.png": "37ae3a34fccce198bcf6ddfc7c245611",
"assets/image/star.jpg": "14497860bf99641d6d5c399e4223972f",
"assets/image/starhindi.jpg": "03efccbb20ade243283827af43501daf",
"assets/image/ten1.png": "6ba15fa523aaf59537e93fed8b8b954e",
"assets/image/tnt.jpg": "680c9226b68872263a13a134c875b666",
"assets/image/ts.jpg": "20f870aa114b8ae0358193c0c917d8ce",
"assets/image/tv.png": "5e92af5b108e79a4fac4bc67e1966a72",
"assets/image/via.jpg": "c353362a8ceac207ecdf0315727b6823",
"assets/image/willow.jpg": "b600eb7af01a694ce62a5ea9f1d82fe5",
"assets/NOTICES": "9ea8fd907922e17e69916092241e4dfe",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "738255d00768497e86aa4ca510cce1e1",
"canvaskit/canvaskit.js.symbols": "74a84c23f5ada42fe063514c587968c6",
"canvaskit/canvaskit.wasm": "9251bb81ae8464c4df3b072f84aa969b",
"canvaskit/chromium/canvaskit.js": "901bb9e28fac643b7da75ecfd3339f3f",
"canvaskit/chromium/canvaskit.js.symbols": "ee7e331f7f5bbf5ec937737542112372",
"canvaskit/chromium/canvaskit.wasm": "399e2344480862e2dfa26f12fa5891d7",
"canvaskit/skwasm.js": "5d4f9263ec93efeb022bb14a3881d240",
"canvaskit/skwasm.js.symbols": "c3c05bd50bdf59da8626bbe446ce65a3",
"canvaskit/skwasm.wasm": "4051bfc27ba29bf420d17aa0c3a98bce",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"favicon.png": "42c1d7c647395728e1553b3f968f579d",
"flutter.js": "383e55f7f3cce5be08fcf1f3881f585c",
"flutter_bootstrap.js": "a151a41a228f812e94e3588e857b157e",
"icons/Icon-512.png": "65834c470fd478a50f56854b4a728c90",
"icons/Icon-maskable-192.png": "bf68c627da227eafe13036127164591b",
"icons/Icon-maskable-512.png": "c9b7b0a1142891668db4e5970a22a810",
"index.html": "1b46070b43347731ffa7794acd4206c4",
"/": "1b46070b43347731ffa7794acd4206c4",
"main.dart.js": "826dc74c48189391ac4bf3601f1ef4cc",
"manifest.json": "a09168290fbcf6abe0195746f7e6f6ff",
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
