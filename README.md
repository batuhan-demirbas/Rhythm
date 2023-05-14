<div align="center">
  <img src="./Asset/banner.png" alt="Uygulama reklam görseli" />
</div>

## İçindekiler
- [Proje Hakkında](#proje-hakkında)
- [Projede Kullanılan Teknolojiler](#projede-kullanılan-teknolojiler)
- [Proje Yönetimi](#proje-yönetimi)
- [Backend](#backend)
- [Önizlemeler](#önizlemeler)

## Proje Hakkında
Rhythm, Swift ve UIKit kullanarak geliştirdiğim, Deezer API'sine dayanan bir müzik uygulamasıdır. Bu uygulama, kullanıcıların geniş bir müzik kütüphanesinden sevdikleri şarkıları keşfetmelerine, albümlere ve sanatçılara göz atmalarına ve favori parçalarını saklamalarına olanak sağlar.

## Projede Kullanılan Teknolojiler
- Xcode: Sürüm 14.3
- Minimum iOS Sürümü: 14.0
- Mimari: **MVVM**
- Bağımlılık Yöneticisi: Swift Package Manager
- Kütüphaneler: **Alamofire, CoreData, AVFoundation, Kingfisher, SkeletonView**

## Proje Yönetimi
Rhythm projesinin her aşaması, geliştirme sürecinden tasarıma kadar, Notion üzerinden yönetildi. Bu süreçte, uygulamanın teknik yönlerinin yanı sıra marka değerini ve kullanıcı deneyimi de göz önünde bulunduruldu. Tüm süreç, başından sonuna kadar Notion'da planlandı.

Notion üzerinde projenin geliştirme sürecini ve takibi görmek için [buraya](https://rhythm-app.notion.site/490696bc3e864f239ca9bcb1bc95c85f?v=0c346faa516c4296995aadd2d865e6ab) tıklayabilirsiniz.

<div align="center">
  <img src="./Asset/notion.png" alt="Proje Yönetimi Görseli" />
</div>

## Önizlemeler
| Başlangıç Ekranı  | Ana Ekran | Favoriler Ekranı| 
| ------------- |:-------------:| :-------------:|
| ![Önizleme](Asset/splash.png) | ![Önizleme](Asset/home.png) | ![Önizleme](Asset/favorites.png) |
| Kategori Ekranı |Sanatçı Ekranı | Albüm Ekranı |
| ![Önizleme](Asset/category.png) | ![Önizleme](Asset/artist.png) | ![Önizleme](Asset/album.png) |

## Backend
Bu uygulamanın arka uç hizmetleri tamamen başka bir kişi tarafından geliştirilmiştir ve bu [link](https://developers.deezer.com/api) üzerinden görüntülenebilir. Kullanım kolaylığı için Postman'a aktardım.
