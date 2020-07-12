require "date"
s1 = Date.parse("1940/08/07")
s2 = Date.parse("2000/04/12")

name=["ウボ","リｭイケワル","ゾギョケムス","ヨニャゾドー","ガイダー","ドシェロ","パイェキュレギ","パハー","ネナドン","ゾヒザゴ","ザンブーフ","シェゲガー","ギホーパー","コヴィツァモラー","スヴシダー","タドンド","リｭソン","ビュス","バペチスト","ゼルード","ゾスト","ツルース","ヌッラツロス","チョジュジチョッド","ポオデック","ターヒレアン","エゲクス","ドード","ヨート","ピヌンビル","パヤー","プリョガンヒ"]
local_number=0



name.each do |n|
  local_number+=1
  birthday = Random.rand(s1 .. s2)
  karaoke_customer=Random.rand(500..5000)
  status=Random.rand(1..100)
  Customer.create(local_number:local_number,name:n,karaoke_customer:karaoke_customer,status:status,birthday:birthday)
end