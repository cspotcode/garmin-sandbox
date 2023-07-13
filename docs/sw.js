const networkFirst = (event) => {
    event.respondWith(
      fetch(event.request)
        .then((networkResponse) => {
          return caches.open(currentCache).then((cache) => {
            cache.put(event.request, networkResponse.clone());
            return networkResponse;
          })
        })
        .catch(() => {
           return caches.match(event.request);
        })
    );
    };
self.addEventListener("fetch", event => {
  networkFirst(event);
});
const currentCache = 'v1';
self.addEventListener('activate', event => {
 event.waitUntil(
   caches.keys().then(cacheNames => Promise.all(
     cacheNames
       .filter(cacheName => cacheName !== currentCache)
       .map(cacheName => caches.delete(cacheName))
   ))
 );
});
