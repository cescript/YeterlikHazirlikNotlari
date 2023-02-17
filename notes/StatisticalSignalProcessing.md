# İstatistiksel İşaret İşleme

Bu ders kapsamında temel bilgilerden başlanarak, otoregresif modeller ve Wiener süzgeçleri üzerinde durulacaktır.

- [Temel Bilgiler](#temel-bilgiler)
- [Güç Spektral Yoğunluğu](#güç-spektral-yoğunluğu)
- [Filtreleme](#filtreleme)
  - [Otoregresif Modeller](#otoregresif-modeller)
  - [Wiener Filtre](#wiener-filtre)

## Temel Bilgiler

**Diklik (Orthogonal):** İki vektörün iç çarpımları $\langle \mathbf{x}, \mathbf{y} \rangle = \mathbf{x}^\intercal \mathbf{y} = 0$ şartını sağlıyorsa bu iki vektör diktir denir ve $\mathbf{x} \perp \mathbf{y}$ şeklinde gösterilir.

**Orthonormal:** Birbirine dik iki vektörün uzunlukları ( $\lVert  \mathbf{x} \lVert_{2}^{2} = \lVert \mathbf{y} \lVert_{2}^{2} = 1$ ) da normalize ise bu vektörlere orthonormal denir.

**Vektör İzdüşüm Hatası:** Bir $\mathbf{x}$ vektörünün $\mathbf{p} =  \lbrace  \mathbf{p}_1,\mathbf{p}_2, \dots, \mathbf{p}_n  \rbrace$ vektörlerinin doğrusal kombinasyonu $\mathbf{x} = c_1\mathbf{p}_1 + c_2\mathbf{p}_2, \dots, c_n \mathbf{p}_n + e$ ile ifade edelim. Burada $c_1,c_2,\dots,c_n$ için en iyi katsayıların seçilmesi durumunda $\mathbf{e}$ hatası $\mathbf{p}$ vektörlerine dik $\mathbf{e} \perp \mathbf{p}_i$ olacaktır.

<blockquote>

[](#gray) Sıfır ortalamalı $\mathbf{x}$ ve $\mathbf{y}$ gibi iki vektör arasındaki ilişkiyi kaldıracak $\mathbf{H}$ dönüşüm matrisini bulunuz.

En iyi dönüşüm marisi ile yapılan dönüşüm sonucunda kalan hata  vektörü $\mathbf{e} = \mathbf{x} - \mathbf{H} \mathbf{y}$ ile $\mathbf{y}$ birbirine dik $E[\mathbf{e} \mathbf{y}] = 0$ olmalıdır.

$$
\begin{aligned}
    E[\mathbf{e} \mathbf{y}] &= E[(\mathbf{x} - \mathbf{H} \mathbf{y}) \mathbf{y}^\intercal] &= 0\\
    &= E[\mathbf{x}\mathbf{y}^\intercal - \mathbf{H} \mathbf{y}\mathbf{y}^\intercal] &= 0\\
    &= E[\mathbf{x}\mathbf{y}^\intercal] - \mathbf{H} E[\mathbf{y}\mathbf{y}^\intercal] &= 0\\
    &= \mathbf{R}_{xy} - \mathbf{H}\mathbf{R}_{yy} &= 0
\end{aligned}
$$

Bulunan ilişkiden görüldüğü üzere; $\mathbf{H} = \mathbf{R}_ {xy} \mathbf{R}_ {yy}^{-1}$ seçilmesi durumunda istenilen şart sağlanacaktır.

</blockquote>

## Güç Spektral Yoğunluğu

Bir sinyal için güç spektral yoğunluğu; **sinyalin gücünün frekans bileşenlerine bağlı değişimini** gösteren bir değerdir. Bu değer $\mathbf{S}_x$ ile gösterilir ve otokorelasyon matrisinin Fourier dönüşümü ile elde edilir.

$$
\mathbf{S}_x(w) = \int_{-\infty}^{\infty} \mathbf{R}_x(\tau) e^{-jw\tau} d\tau
$$

**Spektral Ayrıştırma Teoremine** göre durağan bir $x(t)$ rastgele sürecinin güç spektral yoğunluğu, min faz ve max faz iki transfer fonksiyonunun çarpımı şeklinde yazılabilir.

$$
\mathbf{S}_x(w) = H(e^{jw})H(e^{-jw})
$$


<blockquote>

[](#gray) Aşağıda verilen güç spektral yoğunluğunu spektral ayrıştırma teoremine göre ayrıştırınız.

$$
S(e^{jw}) = \frac{1.04 + 0.4 \cos(w)}{1.25 + \cos(w)}
$$

İlk olarak $z=e^{jw}$ yazarak ifadeyi $z$ domenine taşıyalım.

$$
\begin{aligned}
    S(e^{jw}) &= \frac{1.04 + 0.4 \frac{1}{2}\left ( z + \frac{1}{z} \right )}{1.25 + \frac{1}{2}\left ( z + \frac{1}{z} \right )} &= \frac{0.2z^2 + 1.04z + 0.2}{0.5z^2 + 1.25z + 0.5} &= \frac{(0.2z + 1)(z+0.2)}{(0.5z+1)(z+0.5)}
\end{aligned}
$$

Elde edilen ifadede $H(z) = \frac{z+0.2}{z+0.5}$ tanımı yapılırsa, güç spektral yoğunluğunun $\mathbf{S}_x(z) = H(z)H(1/z)$ olarak yazılabildiği görülür. 

Burada $H(z)$ ifadesinin sıfırı $z=-0.2$ ve kutup noktası $z=-0.5$ birim çemberin içerisinde olduğundan $H(z)$ min faz sistemdir. Tam tersi şekilde $H(1/z)$'in de sıfır ve kutupları birim çemberin dışında kaldığından, $H(1/z)$ max faz bir sistemdir.

</blockquote>

## Filtreleme

Filtreleme; $z(t) = y(t) + \eta(t)$ ile verilen gürültülü ölçümler kullanılarak gürültüsüz sinyal $y(t + \lambda)$'nin hesaplanması işlemidir. Burada $\lambda$ sayısının değerine göre problem farklı şekillerde isimlendirilebilir.

- $\lambda < 0:$ Güncel ölçüm kullanılarak $y$'nin geçmiş değerleri hesaplandığından bu işleme **yumuşatma** denir.

- $\lambda = 0:$ Güncel ölçüm kullanılarak o anki gürültüsüz sinyal kestirildiğinden bu işleme **filtreleme** denir.

- $\lambda > 0:$ Güncel ölçüm kullanılarak daha ileriki bir zamanda olacak olan olay kestirildiğinden bu işleme **tahminleme** denir.

Bu bölümde gürültü sinyalinin $n(t)$ istatistiksel özelliklerinden faydalanarak $y(t + \lambda)$ kestirimi için kullanılabilecek filtre yöntemleri incelenecektir.

### Otoregresif Modeller

Otoregresif modeller; elimizde bulunan verinin geçmiş elemanlarının ağırlıklı toplamı ile güncel değeri kestirmeye çalışır.

$$
x[n] = a_1 x[n-1] + a_2 x[n-2] + \dots + a_m x[n-m] + \eta[n]
$$

Verilen denklem $x[n-p]$ şeklinde gecikmiş sinyaller ile çarpılarak beklenen değerleri alınırsa; aşağıdaki otokorelasyon matrisleri $\mathbf{R}(p) = E\left[x[n-p] x[n]\right]$' ne bağlı denklemler elde edilir.

$$
\begin{aligned}
    \mathbf{R}(1) &= a_1 \mathbf{R}(0) + a_2 \mathbf{R}(1) + \dots + a_m \mathbf{R}(m-1)\\
    \mathbf{R}(2) &= a_1 \mathbf{R}(1) + a_2 \mathbf{R}(0) + \dots + a_m \mathbf{R}(m-2)\\
    \mathbf{R}(3) &= a_1 \mathbf{R}(2) + a_2 \mathbf{R}(1) + \dots + a_m \mathbf{R}(m-3)\\
    & \vdots
\end{aligned}
$$

Bu denklem setine Yule-Walker eşitliği denir ve katsayılar aşağıdaki matris tersi işlemi ile bulunabilir.

$$
\begin{bmatrix}
    a_1\\
    a_2\\
    \vdots\\
    a_m
\end{bmatrix} =
\begin{bmatrix}
    \mathbf{R}(0) & \mathbf{R}(1) & \dots & \mathbf{R}(m-1)\\
    \mathbf{R}(1) & \mathbf{R}(0) & \dots & \mathbf{R}(m-2)\\
    \vdots & \vdots & \ddots & \vdots\\
    \mathbf{R}(m-1) & \mathbf{R}(m-2) & \dots & \mathbf{R}(0)\\
\end{bmatrix}^{-1}
\begin{bmatrix}
    \mathbf{R}(1)\\
    \mathbf{R}(2)\\
    \vdots\\
    \mathbf{R}(m)
\end{bmatrix}
$$

### Wiener Filtre

Wiener filtre problemi bir sisteme benzeterek girdi $z(t)$ ile çıktı $\hat{y}(t)$ arasındaki dönüşümü sağlayan transfer fonksiyonunu bulmayı hedefler. 

$$
\hat{y}(t+\lambda) = \int_{-\infty}^{\infty} h(\tau) z(t - \tau) d \tau
$$

Burada $e(t) = \hat{y}(t+\lambda) - y(t+\lambda)$ hatasının en küçüklenmesi için $E[e(t) z(t)] = 0$ olmalıdır. 

Wiener filtrenin çalışabilmesi için $y(t)$ ve $n(t)$ sinyallerinin sıfır ortalamalı ve durağan veya geniş anlamda durağan olması gereklidir. Bunlara ek olarak **sonsuz** sayıda ölçümün de yapılmış olması gereklidir. Bu şartlar altında çözüm aşağıdaki şekilde hesaplanır.

$$
\begin{aligned}
    E[e(t) z(t)] &= E\left[\left(\int_{-\infty}^{\infty} h(\tau) z(t - \tau) d \tau - y(t+\lambda) \right) z(t) \right] &= 0\\
    &= E\left[\left(\int_{-\infty}^{\infty} h(\tau) z(t) z(t - \tau) d \tau - z(t)y(t+\lambda) \right) \right] &= 0\\
    &= E\left[\left(\int_{-\infty}^{\infty} h(\tau) z(t) z(t - \tau) d \tau - z(t)y(t+\lambda) \right) \right] &= 0\\
    &= \int_{-\infty}^{\infty} h(\tau) \mathbf{R}_z(\tau) d \tau - \mathbf{R}_{yz}(\lambda) &= 0
\end{aligned}
$$

Elde edilen eşitlik Wiener-Hopf eşitliği olarak bilinir ve iki tarafın Laplace dönüşümü alınarak nedensel ve nedensel olmayan filtreler aşağıdaki şekilde hesaplanır.

$$
\begin{aligned}
    H_{nc}(s) = \frac{\mathbf{S}_{yz}(s) \exp(\lambda s)}{\mathbf{S}_z(s)}, \qquad H_{c}(s) = \frac{1}{\mathbf{S}_z^{+}(s)} \frac{\mathbf{S}_{yz}(s) \exp(\lambda s)}{\mathbf{S}_z^{-}(s)}
\end{aligned}
$$

Burada $\mathbf{S}(s)$ güç spektral yoğunluk fonksiyonunu göstermektedir.

<blockquote>

[](#gray) $x[n] = y[n] + v[n]$ şeklinde tanımlanan bir sistemde işaret ve gürültünün ilişkisiz olduğu bilinmektedir. $y[n]$ işaretinin ölçümler kullanılarak kestirmek için ideal filtreyi bulunuz.

$y[n]$ işaretinin ortalama karesel hatasını en küçükleyen kestirimi Wiener filtre ile bulunur. 

Soruda $\mathbf{R}_ {yv} = 0$ verildiğinden $\mathbf{R}_ {xx} = \mathbf{R}_ {yy}+\mathbf{R}_ {vv}$ ve $\mathbf{R}_ {xy} = \mathbf{R}_ {yy}$ olacaktır. Bu ifadeler kullanılarak Wiener filtre frekans yanıtı aşağıdaki şekilde yazılır.

$$
H(s) = \frac{\mathbf{S}_{yy}(s)}{\mathbf{S}_{xx}(s)} = \frac{\mathbf{S}_{yy}(s)}{\mathbf{S}_{yy}(s)+\mathbf{S}_{vv}(s)}
$$

Elde edilen filtre incelenecek olursa; sinyalin gücünün yüksek olduğu frekanslarda $\mathbf{S}_ {yy}(s) \gg \mathbf{S}_ {vv}(s)$ olduğundan $H(s) \approx 1$ olurken, sinyalin gücünün düşük olduğu frekanslarda $\mathbf{S}_ {yy}(s) \approx 0$ olduğundan $H(s) \approx 0$ olacaktır. Yani bulunan filtre sinyalin güçlü oplduğu frekans bileşenlerini korurken, gürültünün güçlü olduğu frekans bileşenlerini bastıracaktır.

</blockquote>

