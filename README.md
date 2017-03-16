# Müzik Dosyaları ID3 Tag Otomatik Doldurma

## Kullanım

İlk olarak sisteminizde Ruby kurulu olduğundan emin olun.
~~~
# Ubuntu , Debian vs. için
sudo apt-get install ruby

# Redhat dağıtımlar için
sudo yum install ruby
~~~

mp3 info gemini kurun:
~~~
gem install mp3info
~~~

Bu repoyu kendi bilgisayarınıza indirin:
~~~
git clone https://github.com/celilileri/music-info
~~~

music-info dizinine girin:
~~~
cd music-info
~~~

Ruby programı ile minfo.rb dosyasını çalıştırın.
~~~
ruby minfo.rb
~~~


## Yapılanlar:

Belirtilen bir dizinde recursive olarak dolaş ve dosya listesi oluştur.

Müziklerin bilgilerini içeren bir text dosyasını oku.

Text dosyasındaki bilgileri dosya listesinde karşılığı gelen dosyalara ID3 bilgisi olarak ekle

Karışıklığı önlemek için ilkel bir önlem olarak müzik bilgilerinin bulunduğu dosyadaki satır sayısı dosya listesindeki dosya sayısına eşit değilse herhangi bir eylem yapma.

## Yapılacaklar:

Müzik bilgisinin bulunduğu bir text dosyası olmayan durumlar için dosya adının uzantıdan önceki kısmını (basename) title tag ına ata
