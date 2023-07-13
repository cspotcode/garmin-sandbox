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
const staleWhileRevalidate = (event) => {
 event.respondWith(
   caches.match(event.request).then((cacheResponse) => {
     if (cacheResponse) {
       fetch(event.request).then((networkResponse) => {
         return caches.open(currentCache).then((cache) => {
           cache.put(event.request, networkResponse.clone());
           return networkResponse;
         })
       });
       return cacheResponse;
     } else {
       return fetch(event.request).then((networkResponse) => {
         return caches.open(currentCache).then((cache) => {
           cache.put(event.request, networkResponse.clone());
           return networkResponse;
         })
       });
     }
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
