# Nümerik Yöntemler

- [Bilimsel Hesaplama](#bilimsel-hesaplama)
- [Doğrusal Denklemler](#doğrusal-denklemler)
- [Özdeğer Problemi](#özdeğer-problemi)
  - [Güç İterasyonları](#güç-i̇terasyonları)
  - [Rayleigh Quotient Yöntemi](#rayleigh-quotient-yöntemi)
  - [Ters İterasyon Yöntemi](#ters-i̇terasyon-yöntemi)
- [Doğrusal Olmayan Denklemler](#doğrusal-olmayan-denklemler)
- [Aralık Kesişimi](#aralık-kesişimi)
- [Sabit Nokta İterasyonu](#sabit-nokta-i̇terasyonu)
- [Newton Yöntemi](#newton-yöntemi)
- [Secant Yöntemi](#secant-yöntemi)
- [Optimizasyon](#optimizasyon)
  - [Newton Yöntemi](#newton-yöntemi-1)
  - [En Dik İniş Yöntemi](#en-dik-i̇niş-yöntemi)
- [İnterpolasyon](#i̇nterpolasyon)
  - [Polinom İnterpolasyon](#polinom-i̇nterpolasyon)
  - [Lagrange İnterpolasyon](#lagrange-i̇nterpolasyon)
  - [Newton İnterpolasyon](#newton-i̇nterpolasyon)
- [Nümerik İntegral](#nümerik-i̇ntegral)
- [Adi Diferansiyel Denklemler](#adi-diferansiyel-denklemler)
  - [İlk Değer Problemi](#i̇lk-değer-problemi)
  - [Sınır Değer Problemi](#sınır-değer-problemi)
  - [Kısmi Diferansiyel Denklemler](#kısmi-diferansiyel-denklemler)
- [Rastgele Sayılar](#rastgele-sayılar)

## Bilimsel Hesaplama

Bilimsel hesaplama yöntemleri pekçok kaynaktan gelen hatalar içermektedir.

Örnek olarak Dünyanın yüzey alanını;

$$A=4 \pi r^2$$

formulü ile yaklaşık olarak hesaplamak istersek:

- Dünya küre olarak modellendiğinden **modelleme hatası**
- Dünyanın yarıçapı $r \approx 6370$ km deneysel olarak ölçüldüğünden **ölçüm aleti hatası**
- $\pi$ değeri sonlu sayıda hesaplanacağından **kesme hatası**
- Çarpımlar sırasında oluşacak olan **yuvarlama hatası**

gibi hatalar görülecektir.

Bir sistemin hatası;

- Absolute Error = Approixamate Value - True Value
- Relative Error = Absolute Error / True Value

olmak üzere iki temel hata ile ifade edilebilir.

$y = f(x)$ şeklinde bir sistemde elde edilen hata $\hat{y} = \hat{f}(\hat{x})$ gibi bir yaklaşım kullanmaktan kaynaklanır. Toplam hata;

$$
\begin{aligned}
E_f &= \hat{f}(\hat{x}) - f(x)\\
&= \left( \hat{f}(\hat{x}) - f(\hat{x}) \right) + \left( f(\hat{x}) - f(x) \right)\\
&= \text{Hesaplama Hatası} + \text{Veri Hatası}
\end{aligned}
$$

ile hesaplanır. Burada $E_f = \lvert \hat{y} - y \lvert$ ileri hata, $E_b = \lvert \hat{x} - x \lvert$ ise geri hata olarak isimlendirilir. 

Hesaplama hatası sistemin yanlış modellenmesinden, veri hatası girdinin yanlış kullanılmasından oluşur.

<blockquote>

[](#gray) Sinüs fonksiyonu sonsuz sayıda terim kullanılarak aşağıdaki şekilde yazılabilir.

$$
    \sin(x) = x - \frac{x^3}{3!} + \frac{x^5}{5!} - \frac{x^7}{7!} + \cdots
$$

Burada sadece ilk terim kullanıldığı varsayılırsa ( $sin(x) \approx x$ ) ileri ve geri hata değerlerini $x = 0.1, 0.5$ ve $1.0$ için hesaplayınız.

İleri hata fonksiyonun çıktıları, geri hata ise fonksiyonun girdileri arasında görülen hatadır.

$$
    \begin{aligned}
        E_f &= \lvert \hat{y} - y \lvert\\
        E_b &= \lvert \hat{x} - x \lvert
    \end{aligned}
$$


Sinüs fonksiyonuna ilk terim ile yakınsamamız durumunda; $\hat{y} = x$ olacaktır. Bu durumda ileri hata;

$$
    E_f = \lvert \hat{y} - y \lvert = \lvert x - \sin(x) \lvert
$$

şeklinde olacaktır. Verilen $x$ değerleri denklemde yerine yazılırsa;

$x=0.1$ için $\hat{y} = 0.1$, $y = sin(0.1)$ olduğundan, $E_f \approx \lvert 0.1-0.0998334 \lvert \approx 0.0001666$ bulunur.

$x=0.5$ için $\hat{y} = 0.5$, $y = sin(0.5)$ olduğundan, $E_f \approx \lvert 0.5-0.4794255 \lvert \approx 0.0205745$ bulunur.

$x=1.0$ için $\hat{y} = 1.0$, $y = sin(1.0)$ olduğundan, $E_f \approx \lvert 1.0-0.8414710 \lvert \approx 0.1585290$ bulunur.

Geri hatayı bulmak için $\hat{y} = \sin(\hat{x})$ eşitliğini sağlayan $\hat{x}$ değeri bulunmalıdır. Bu değer ters fonksiyon kullanılarak, $\hat{x} = \arcsin{\hat{y}}$ ile bulunur. Bu durumda geri hata;

$$
    E_b = \lvert \hat{x} - x \lvert = \lvert \arcsin(x) - x \lvert
$$

şeklinde olacaktır. Verilen $x$ değerleri denklemde yerine yazılırsa;

$x=0.1$ için; $\hat{x} = \arcsin(0.1)$ olduğundan, $E_b \approx \lvert 0.1001674-0.1 \lvert \approx 0.0001674$ bulunur.

$x=0.5$ için; $\hat{x} = \arcsin(0.5)$ olduğundan, $E_b \approx \lvert 0.5235988-0.5 \lvert \approx 0.0235988$ bulunur.

$x=1.0$ için; $\hat{x} = \arcsin(1.0)$ olduğundan, $E_b \approx \lvert 1.5707963 - 1.0 \lvert \approx 0.5707963$ bulunur.

</blockquote>

Bir sistemin girdiye olan duyarlılığı **Koşul Değeri** ile ölçülür. Bu değer;

$$S = \lvert \frac{\Delta y / y}{\Delta x / x} \lvert$$

ile hesaplanır. Burada $\Delta x$, $x$ te meydana gelen küçük bir değişimi, $\Delta y$, $y$ de meydana gelen küçük bir değişimi göstermektedir.

Burada $f(x + \Delta x) = f(x) + f'(x) \Delta x$ yaklaşımı yapılırsa;

$$S = \lvert \frac{\Delta y / y}{\Delta x / x} \lvert = \lvert \frac{(f(x + \Delta x) - f(x)) / f(x)}{\Delta x / x} \lvert = \lvert \frac{f'(x) \Delta x / f(x)}{\Delta x / x} \lvert = \lvert \frac{x f'(x)}{f(x)} \lvert $$


<blockquote>

[](#gray) 

- $f(x) = \sqrt{x}$ şeklinde verilen bir sistemde girişte meydana gelen küçük bir değişimin çıkışta neden olacağı değişimi bulunuz.

Bu oran $S = \left \lvert \frac{x f'(x)}{f(x)} \right \lvert$ formulü ile hesaplanır.

$$
S = \left \lvert \frac{x f'(x)}{f(x)} \right \lvert = \frac{x / (2\sqrt{x})}{\sqrt{x}} = \frac{1}{2}
$$


- $y = \log(x)$ fonksiyonu kötü şartlandırılmış bir fonksiyon mudur?

$$
S = \left \lvert \frac{x f'(x)}{f(x)} \right \lvert = \frac{x (1/x)}{\log(x)} = \frac{1}{\log(x)}
$$

$x \approx 0$ civarında koşul değeri sonsuza gittiğinden fonksiyon kötü konumlandırılmış bir fonksiyondur. 

</blockquote>


## Doğrusal Denklemler

**Normlar**

$$ \lVert \mathbf{x} \lVert_p = \left( \sum_{i=1}^n \lvert x_i \lvert \right)^{1/p}$$

$$ \lVert \mathbf{A} \lVert_p = \max_{x \neq 0} \frac{\lVert \mathbf{A}\mathbf{x} \lVert_p}{\lVert \mathbf{x} \lVert_p}$$

Matris normlarında bazı değerler hızlı hesaplanabilir. Örnek olarak $L_1$ normu mutlak sütun toplamlarının en büyüğü, $L_\infty$ normu mutlak satırların toplamının en büyüğü ile hesaplanabilir.

<blockquote>

[](#gray)

$$\mathbf{A} = 
\begin{bmatrix} 
2 & -1 & 1\\
1 & 0 & 1\\
3 & -1 & 4
\end{bmatrix}
$$

matrisi için $\lVert \mathbf{A} \lVert_1 = 6$ ve $\lVert \mathbf{A} \lVert_\infty = 8$ olarak hesaplanır.

</blockquote>

**Kalan Hata**
$\mathbf{A} \mathbf{x} = \mathbf{b}$ şeklinde tanımlanan bir doğrusal sistemde $\mathbf{x}$ yaklaşık olarak $\mathbf{\hat{x}}$ şeklinde biliniyorsa kalan hata;

$$\mathbf{r} = \mathbf{b} - \mathbf{A} \mathbf{\hat{x}}$$

şeklinde hesaplanacaktır. Hata ise $\lVert \mathbf{r} \lVert$ şeklinde ölçülebilir. Ancak burada hata $\Delta x = \mathbf{x}-\mathbf{\hat{x}}$ kaynaklı hatanın $\mathbf{A}$ matrisi ile çarpımından oluştuğundan, hatayı göreli hesaplamak daha anlamlıdır.

$$e = \frac{\lVert \mathbf{r} \lVert}{\lVert \mathbf{A} \lVert \lVert \mathbf{\hat{x}} \lVert}$$

Bu durumda girdi hatası ile çıktı hatası

$$ \frac{\Delta x}{\lVert \mathbf{\hat{x}} \lVert} \leq cond(\mathbf{A}) \cdot \frac{\lVert \mathbf{r} \lVert}{\lVert \mathbf{A} \lVert \lVert \mathbf{\hat{x}} \lVert}$$

şeklinde ilişkili olacaktır.

**Koşul Değeri**

Bir matrisin koşul değeri;

$$cond(\mathbf{A}) = \lVert \mathbf{A} \lVert \cdot \lVert \mathbf{A}^{-1} \lVert$$

**House Holder Dönüşümü** (satır-1) ve sütun sayılarının en düşük değeri kadar uygulanmalıdır.

**Givens Rotation** her seferinde bir matris elemanını sıfır yaptığından matrisin sıfırdan farklı eleman sayısı kadar uygulanır.

**Doğrusal Denklemler**
$$\mathbf{y} = \mathbf{A} \mathbf{x}$$

biçiminde ifade edilen denklemlerdir. Çözümü $\mathbf{x} = (\mathbf{A}^\intercal \mathbf{A})^{-1} \mathbf{A}^\intercal \mathbf{y}$ ile bulunur. $\mathbf{A}$ kare matris ve tersi alınabilirse çözüm tektir. $\mathbf{A}$ kare matris değilse çözüm en küçük kareler mantığıyla bulunur.

## Özdeğer Problemi

$\mathbf{A} \mathbf{x} = \lambda \mathbf{x}$ denklemi aşağıdaki denkleme eşittir.

$$( \mathbf{A} - \lambda \mathbf{I}) \mathbf{x} = \mathbf{0}$$

Burada $\mathbf{x}$ sıfır değilse denklemin sağlanması için $\det(\mathbf{A} - \lambda \mathbf{I}) = 0$ şartının sağlanması gereklidir.

### Güç İterasyonları

Bu iterasyon $x_{k+1} = \mathbf{A} x_k$ şeklinde hesaplanır.

### Rayleigh Quotient Yöntemi

Rayleigh kalanı yöntemi en büyük özdeğeri bulmak için kullanılan bir yöntemdir. Her iterasyonda özdeğerler bulunduktan sonra karakteristik denklem çözülerek özvektör de bulunur. Bu yöntemde  iterasyonlar;

$$
    \begin{aligned}
    \lambda_{k+1} &= \frac{x_k^\intercal \mathbf{A} x_k}{x_k^\intercal x_k}\\
    \left( \mathbf{A} - \lambda I \right) y_{k} &= x_k\\
    x_{k+1} &= \frac{y_{k}}{\lVert y_k \lVert_\infty}
    \end{aligned}
$$

şeklinde tanımlanır.

### Ters İterasyon Yöntemi

Ters iterasyon aşağıdaki iteratif adımları kullanarak özvektör hesaplamaktadır.

$$
    \begin{aligned}
    \mathbf{A} y_{k} &= x_{k}\\
    x_{k+1} &= \frac{y_{k}}{\lVert y_k \lVert_\infty}
    \end{aligned}
$$

<blockquote>

[](#gray)

$$
    \mathbf{A}=
    \begin{bmatrix}
        1 & 4\\
        1 & 1
    \end{bmatrix}
$$
- $\mathbf{A}$ matrisinin karakteristik polinomunu bulunuz.

Bir matrisin karakteristik denklemi $det(\mathbf{A} - \lambda I) = 0$ ile tanımlanır. Bu durumda verilen matris için karakteristik denklem;

$$
    \begin{aligned}
    det(\mathbf{A} - \lambda I) &= 0\\
    det\left(  
    \begin{bmatrix}
        1 & 4\\
        1 & 1
    \end{bmatrix} - 
    \lambda 
    \begin{bmatrix}
        1 & 0\\
        0 & 1
    \end{bmatrix}  
    \right) &= 0\\
    det\left(  
    \begin{bmatrix}
        1 - \lambda & 4\\
        1 & 1 - \lambda
    \end{bmatrix} 
    \right) &= 0\\
    \left( 1 - \lambda \right ) \left( 1 - \lambda \right ) - 4 &= 0\\
    \lambda^2 - 2\lambda - 3 = 0
    \end{aligned}
$$

şeklinde bulunur.

- $\mathbf{A}$ matrisinin karakteristik polinomunun kökleri nelerdir?

Karakteristik denklem $\lambda^2 - 2\lambda - 3 = (\lambda - 3) (\lambda+ 1)$ şeklinde yazılabildiğinden kökler $\lambda_1=3$, $\lambda_2=-1$ olarak bulunur.

- $\mathbf{A}$ matrisinin özdeğerlerini hesaplayınız.

Karakteristik denklemin kökleri $\mathbf{A}$ matrisinin özdeğerleri olduğundan, özdeğerler $\lambda_1=3$, $\lambda_2=-1$ şeklinde hesaplanır.

- $\mathbf{A}$ matrisinin özvektörlerini hesaplayınız.

Bir matrisin özdeğer ve özvektörleri $\mathbf{A} \mathbf{v_i} = \lambda_i \mathbf{v_i}, \quad \lVert \mathbf{v_i}\lVert = 1$ eşitliğini sağlayan $\lambda_i$ ve $\mathbf{v_i}$ ler olarak tanımlanmaktadır. Bulunan özdeğerler eşitlikte yerine yazılırsa;

$$
\begin{aligned}
    \mathbf{A} \mathbf{v_1} &= \lambda_1 \mathbf{v_1}\\
    \begin{bmatrix}
        1 & 4\\
        1 & 1
    \end{bmatrix}
    \begin{bmatrix}
     v_{11}\\
     v_{12}
     \end{bmatrix} &= 3 \begin{bmatrix}
     v_{11}\\
     v_{12}
     \end{bmatrix}\\
     v_{11} = 2 v_{12} \text{ ve } &\sqrt{v_{11}^2 + v_{12}^2} = 1 \text{ olduğundan}\\
     \mathbf{v_1} \approx 
     \begin{bmatrix}
     0.894\\
     0.447
     \end{bmatrix}
\end{aligned}   
$$

bulunur. Aynı işlemler $\lambda_2$ için de aşağıdaki şekilde yazılabilir.

$$
\begin{aligned}
    \mathbf{A} \mathbf{v_2} &= \lambda_2 \mathbf{v_2}\\
    \begin{bmatrix}
        1 & 4\\
        1 & 1
    \end{bmatrix}
    \begin{bmatrix}
     v_{21}\\
     v_{22}
     \end{bmatrix} &= -1 \begin{bmatrix}
     v_{21}\\
     v_{22}
     \end{bmatrix}\\
     -v_{21} = 2 v_{22} \text{ ve } &\sqrt{v_{21}^2 + v_{22}^2} = 1 \text{ olduğundan}\\
     \mathbf{v_2} \approx 
     \begin{bmatrix}
     -0.894\\
     0.447
     \end{bmatrix}
\end{aligned}   
$$

şeklinde hesaplanır.

- $x_0 = [ 1 \quad 1 ]^\intercal$ noktasından başlayarak $\mathbf{A}$ matrisine bir adım Güç İterasyonu uygulayınız.

Özvektörleri bulmanın bir diğer yöntemi de Güç iterasyonlarıdır. Bu iterasyon $x_{k+1} = \mathbf{A} x_k$ şeklinde hesaplanır.

Soruda $x_0 = [ 1\quad 1]^\intercal$ verildiğinden;

$$
    x_{1} = \mathbf{A} x_0 = \begin{bmatrix}
    1 & 4\\
    1 & 1
    \end{bmatrix}
    \begin{bmatrix}
    1\\
    1
    \end{bmatrix}=
    \begin{bmatrix}
    5\\
    2
    \end{bmatrix}
$$

şeklinde hesaplanır.

- $\mathbf{A}$ matrisine uygulanan güç iterasyonunun yakınsayacağı özvektörü bulunuz.

Güç iterasyonlarının yakınsadığu bölgeyi bulmak için iterasyonlar tekrarlanmaldır.

$$
\begin{aligned}
    x_{2} &= \mathbf{A} x_1 &= \begin{bmatrix}
    1 & 4\\
    1 & 1
    \end{bmatrix}
    \begin{bmatrix}
    5\\
    2
    \end{bmatrix} &=
    \begin{bmatrix}
    13\\
    7
    \end{bmatrix}\\
    x_{3} &= \mathbf{A} x_2 &= \begin{bmatrix}
    1 & 4\\
    1 & 1
    \end{bmatrix}
    \begin{bmatrix}
    13\\
    7
    \end{bmatrix} &=
    \begin{bmatrix}
    41\\
    20
    \end{bmatrix}\\
    x_{4} &= \mathbf{A} x_3 &= \begin{bmatrix}
    1 & 4\\
    1 & 1
    \end{bmatrix}
    \begin{bmatrix}
    41\\
    20
    \end{bmatrix} &=
    \begin{bmatrix}
    121\\
    61
    \end{bmatrix}
\end{aligned}
$$

Yapılan iterasyonlardan görüldüğü üzere; $x_4$ vektörü, $v_{11} = 2 v_{12}$ eşitliği ile bulduğumuz en büyük özdeğere karşı gelen özvektöre yakınsamaktadır.

- $x_0 = [ 1 \quad 1 ]^\intercal$ vektörü kullanılarak Rayleigh quotient yöntemi ile hesaplanacak özdeğeri bulunuz.

Soruda verilen $x_0 = [ 1\quad 1]^\intercal$ için iterasyonlar uygulanırsa;

$$
    \begin{aligned}
    \lambda_{1} &= \frac{x_0^\intercal \mathbf{A} x_0}{x_0^\intercal x_0} = \frac{7}{2} = 3.5\\
    &\left( \mathbf{A} - 3.5 I \right) y_{0} = 
    \begin{bmatrix}
    1\\
    1
    \end{bmatrix} \Rightarrow y_0 \approx 
    \begin{bmatrix}-2.888\\
    -1.555
    \end{bmatrix}\\
    x_{1} &= \frac{y_{0}}{\lVert y_0 \lVert_\infty} \approx 
    \begin{bmatrix}-1\\
    -0.538
    \end{bmatrix}\\
    \lambda_{2} &= \frac{x_1^\intercal \mathbf{A} x_1}{x_1^\intercal x_1} = \frac{3.982}{1.290} = 3.08\\
    &\left( \mathbf{A} - 3.08 I \right) y_{1} = 
    \begin{bmatrix}-1\\
    -0.538
    \end{bmatrix} \Rightarrow y_1 \approx 
    \begin{bmatrix}
    11.9\\
    5.96
    \end{bmatrix}\\
    x_{2} &= \frac{y_{1}}{\lVert y_1 \lVert_\infty} \approx 
    \begin{bmatrix}1\\
    0.50
    \end{bmatrix}
    \end{aligned}
$$

sonucu elde edilir. İterasyonlar incelendiğinde yöntemin iki iterasyon sonucunda $\lambda_1 = 3.08$, $\mathbf{v_1} = [ 1\quad 0.5]^\intercal$ değerine yakınsadığı gözlenmiştir.

- Ters İterasyon yönteminin $\mathbf{A}$ matrisinin hangi özdeğerine yakınsayacağını bulunuz.

Soruda verilen $x_0 = [ 1\quad 1]^\intercal$ için iterasyonlar uygulanırsa;

$$
    \begin{aligned}
    &\mathbf{A} y_{0} = 
    \begin{bmatrix}
    1\\
    1
    \end{bmatrix} \Rightarrow y_0 = 
    \begin{bmatrix}
    1\\
    0
    \end{bmatrix}\\
    x_{1} &= \frac{y_0}{\lVert y_0 \lVert_\infty} = 
    \begin{bmatrix}
    1\\
    0
    \end{bmatrix}\\
     &\mathbf{A} y_{1} = 
     \begin{bmatrix}
     1\\
     0
     \end{bmatrix} \Rightarrow y_1 = 
     \begin{bmatrix}-0.333\\
     0.333
     \end{bmatrix}\\
    x_{2} &= \frac{y_1}{\lVert y_1 \lVert_\infty} = 
    \begin{bmatrix}
    -1\\
    1
    \end{bmatrix}\\
     &\mathbf{A} y_{2} = 
     \begin{bmatrix}
     -1\\
     1
     \end{bmatrix} \Rightarrow y_2 = 
     \begin{bmatrix}
     1.666\\
     0.666
     \end{bmatrix}\\
    x_{3} &= \frac{y_2}{\lVert y_2 \lVert_\infty} = 
    \begin{bmatrix}
    1\\
    -0.4
    \end{bmatrix}\\
     &\mathbf{A} y_{3} = 
     \begin{bmatrix}
     1\\
     -0.4
     \end{bmatrix} \Rightarrow y_3 = 
     \begin{bmatrix}
     -0.86\\
     0.46
     \end{bmatrix}\\
    x_{4} &= \frac{y_3}{\lVert y_3 \lVert_\infty} = 
    \begin{bmatrix}
    -1\\
    0.53
    \end{bmatrix}\\
    \end{aligned}
$$

elde edilir. Bulunan özdeğer dikkat edilirse diğer sorulardan farklı olarak en büyük özdeğere karşı gelen özvektör değil, tersine en küçük özvektöre karşı gelen özvektöre yakınsamaktadır.

</blockquote>

## Doğrusal Olmayan Denklemler

Doğrusal denklem çözümleri $\mathbf{x} = (\mathbf{A}^\intercal \mathbf{A})^{-1} \mathbf{A}^\intercal \mathbf{y}$ şeklinde bulunur. Bu yöntemler matris tersi alınarak çözülebilir ancak doğrusal olmayan denklem setleri için iteratif çözümler gereklidir.

İteratif çözümde iki iterasyon arasındaki hata

$$
C = \lim_{k \to \infty} \frac{\lVert e_{k+1} \lVert }{\lVert e_k \lVert^r }
$$

gibi bir $C$ sabiti ile gösterilebiliyorsa;

- $r=1$ Doğrusal yakınsama
- $r > 1$ Süper doğrusal yakınsama
- $r = 2$ Quadratik yakınsama

## Aralık Kesişimi
Bir boyutlu bir doğrusal olmayan problemde fonksiyonun $a$ ve $b$ noktalarında farklı işareti varsa fonksiyon bu aralıkta sıfır geçişi yapmış olmalıdır. Buradan yola çıkarak $m = (a+b)/2$ gibi bir noktanın işaretine bakılarak, $f(a)$ ve $f(m)$ farklı işaretli ise $[a,m]$, aynı işaretli ise $[m,b]$ noktaları arasında sıfır geçişi olmalıdır. Bu yöntem iteratif olarak uygulandığında fonksiyonun sıfır geçiş noktası aralık daraltılarak bulunabilir.

## Sabit Nokta İterasyonu

$x^\ast = g(x^\ast)$ noktası $g$ fonksiyonunun sabit noktası olarak adlandırılır. Eğer $g'(x^\ast) < 1$ şartı sağlanıyor ise herhangi bir $x$ değerinden başlandıldığında $x_{k+1} = g(x_k)$ iterasyonları sabit noktaya yakınsar.

## Newton Yöntemi

Taylor serisi kullanılarak $f(x+h) \approx f(x) + f'(x)h$ şeklinde yazılabilir. Yazılan ifade sıfıra eşitlenirse;

$$f(x) + f'(x)h = 0 \Rightarrow h = -f(x) / f'(x)$$

elde edilir. Yani $f$ fonksiyonunu yaklaşık sıfır yapan $x+h$ değeri $x-f(x) / f'(x)$ ile bulunur. yazılan ifade bir yaklaşım olduğundan, $x$ iteratif olarak hesaplanarak gerçek sıfıra doğru yaklaşılabilir. Bu durumda iterasyonlar 

$$x_{k+1} = x_k - f(x_k) / f'(x_k)$$ 

şeklinde hesaplanır.

<blockquote>

[](#green) Burada $g(x_k) = x_k - f(x_k) / f'(x_k)$ tanımlaması yapılırsa problem bir sabit nokta iterasyonu olarak görülebilir. Sabit Nokta İterasyonunda değinildiği üzere Newton yönteminin yakınsama testi için de $g'(x) < 1$ şartının sağlanması gereklidir.

</blockquote>

Problemde $\mathbf{x}$ vektör olması durumunda; $f(\mathbf{x}) = -J(\mathbf{x})\mathbf{h}$ doğrusal denklem seti çözülerek $\mathbf{h}$ vektörü bulunur.

## Secant Yöntemi

Newton yöntemi fonksiyonun türevine ihtiyaç duymaktadır. Nümerik olarak bu hesaplamada da yakınsama kullanılırsa secant yöntemi elde edilir.

$$f'(x_k) = \frac{f(x_k) - f(x_{k-1})}{x_k - x_{k-1}}$$

Bu durumda Newton yöntemi;

$$x_{k+1} = x_k - f(x_k) \frac{x_k - x_{k-1}}{f(x_k) - f(x_{k-1})}$$ 

şeklinde sadece $f$ fonksiyonuna bağlı olarak hesaplanabilir.

## Optimizasyon

Kritik nokta $\nabla f(x) = 0$ şartını sağlayan noktalardır. Bu noktalar Hessian matrisine göre sınıflandırılır.

- $H(x) > 0$ ise $x$: $f$ fonksiyonunun en küçük noktasıdır
- $H(x) < 0$ ise $x$: $f$ fonksiyonunun en büyük noktasıdır
- $H(x) \lessgtr 0$ ise $x$ eğer noktasıdır
- $H(x)$ tekilse sıkıntı

<blockquote>

[](#gray) $f(x, y) = 2x^3-3x^2-6xy(x-y-1)$ ifadesinin kritik noktalarını sınıflandırın.

Verilen fonksiyonun gradyan vektörü ve Hessian matrisi aşağıdaki şekilde hesaplanır.

$$
    \nabla f(x,y) =
    \begin{bmatrix}
    6(x^2-2xy - x + y^2 + y)\\
    -6x(x-2y-1)
    \end{bmatrix}\quad,\quad
    H(x,y)=
    \begin{bmatrix}
    6(2x-2y-1) & 6(2y -2x + 1)\\
    -6(2x-2y-1) & 12x
    \end{bmatrix}
$$

$\nabla f(x,y) = 0$ denklemi çözüldüğünde; $x^\ast=-1, y^\ast=-1$ veya $x^\ast=1, y^\ast=0$ olduğu görülür. 

Bu noktaların sınıflandırılması için $H(x^\ast,y^\ast)$ ın özdeğerleri incelenmelidir. Bu noktalar $H$ matrisinde yazılırsa;

$$
    H(-1,-1)=
    \begin{bmatrix}
    -6 & 6\\
    6 & -12
    \end{bmatrix}\quad,\quad
    H(1,0)=
    \begin{bmatrix}
    6 & -6\\
    -6 & 12
    \end{bmatrix}
$$

elde edilir. 

$H(-1,-1)$ matrisinin determinantı pozitif, izi negatif olduğundan iki özdeğerinin de sıfırdan küçük olduğu anlaşılır. Bu durumda $x^\ast=-1, y^\ast=-1$ noktası $f(x,y)$ fonksiyonunun en büyük noktasıdır.

$H(1,0)$ matrisinin determinantı pozitif, izi de pozitif olduğundan iki özdeğerinin de sıfırdan büyük olduğu anlaşılır. Bu durumda $x^\ast=1, y^\ast=0$ noktası $f(x,y)$ fonksiyonunun en küçük noktasıdır.

</blockquote>


### Newton Yöntemi

Doğrusal olmayan denklemler bölümümünde fonksiyonun sıfır geçiş noktası bulunmaya çalışılmıştır. Optimizasyonda verilen problemin en küçük noktası her zaman sıfır noktasında olmak zorunda değildir. Bu nedenle optimizasyon problemlerinde kullanılmak için Newton yöntemi güncellenmelidir.

İlk yönteme benzer şekilde Taylor serisi kullanılarak $f(x+h) \approx f(x) + f'(x)h + f''(x)h^2$ şeklinde yazılabilir.

Burada sağdaki quadratik ifade $h$ değişkenine bağlı olarak en küçüklenirse; $h = -f'(x)/f''(x)$ olması gerektiği görülür.

Bu durumda iterasyonlar;

$$x_{k+1} = x_k - f'(x_k)/f''(x_k)$$

şeklinde hesaplanmalıdır.

Burada $\mathbf{x}$ vektör olması durumunda, $H(\mathbf{x}_ k)\mathbf{h} -\nabla f(\mathbf{x}_ k)$ çözülerek $\mathbf{h}$ vektörü bulunur. Ardından $\mathbf{x}_ {k+1} = \mathbf{x}_ k + \mathbf{h}$ ile bir sonraki nokta hesaplanır.

Bu yöntem kuadratik yakınsamaya sahiptir.

### En Dik İniş Yöntemi

Bu yöntemde iniş doğrultusu gradyan vektörünün tersi yönünde seçilir.

$$x_{k+1} = x_k - \eta_k \nabla f(x_k)$$

Burada $\eta_k = \arg \min_{\eta_k} f(x_k + \eta_k \nabla f(x_k))$ olacak şekilde seçilir.

Bu yöntem genellikle doğrusal yakınsamaya sahiptir.

## İnterpolasyon

İnterpolasyon yöntemleri $(t_i, y_i)$ olacak şekilde $t_i$ ayrık zamanlarında alınan $y_i$ verilerinin farklı $t$ noktalarında nasıl değiştiğini incelemek için olmayan ara değerlerin kestirilmesi işlemidir.

Bu işlem için $t_i$ ye bağlı $\phi_j(t_i)$ fonksiyonlarının $w_j$ ağırlıkları ile toplandığındığında $y_i = f(t_i)$ problemini çözmesi sağlanırsa, diğer noktalarda da bu yöntem uygulanarak ara değerler hesaplanabilir.

$$f(t) = \sum_{j=1}^n w_j \phi_j(t)$$

### Polinom İnterpolasyon
Polinom interpolasyonda $\phi_j(t) = t^{j-1}$ seçilir. Bu durumda;

$$f(t) = w_1 t^0 + w_2 t^1 + \cdots + w_n t^{n-1}$$

şeklinde bir uyumlama fonksiyonu elde edilir.

### Lagrange İnterpolasyon

### Newton İnterpolasyon

## Nümerik İntegral

- $\int_{0}^{1}x^3 dx$ integralinin yaklaşık değerini midpoint ve trapezoid kurallarına göre hesaplayınız.

Midpoint integral kuralında aralık boyunca değişkenin orta nokta değerinde sabit olduğu varsayılır. Bu varsayım altında integral;

$$
\begin{aligned}
    M(f) &= (b-a) f(\frac{a+b}{2})\\
    &= (1-0) (0.5)^3=0.125
\end{aligned}
$$

şeklinde hesaplanacaktır. Trapezoid integral kuralında fonksiyonun sınır noktalarındaki değerlerinin ortalaması kullanılnılarak integral hesaplanır. Bu durumda;

$$
\begin{aligned}
    T(f) &= (b-a) \frac{f(a)+f((b)}{2}\\
    &= (1-0) \frac{0^3+1^3}{2} = 0.5
\end{aligned}
$$

-  İki integralin farkını kullanarak yaklaşık hatayı hesaplayınız.

İki integral terimi kullanılarak yaklaşık hata;

$$
    E(f) = \frac{T(f)-M(f)}{3} = \frac{0.5-0.125}{3}=0.125
$$

olarak hesaplanır.

- İki integralin sonuçlarını birleştirerek Simpson kuralına göre yaklaşık integrali hesaplayınız.

Elde edilen $M(f),T(f)$ değerleri kullanılarak Simpson yaklaşımı ile integral;

$$
\begin{aligned}
    S(f) &= \frac{2}{3}M(f) + \frac{1}{3}T(f)\\
    &= \frac{2}{3}0.125 + \frac{1}{3}0.5 = 0.25
\end{aligned}
$$

olarak hesaplanır.


## Adi Diferansiyel Denklemler

ADD ler $\mathbf{y}' = f(t, \mathbf{y})$ şeklinde yazılabilen denklemlerdir. Daha yüksek dereceden diferansiyel denklemler de değişken dönüşümü kullanılarak birinci dereceden ADD seti olarak yazılabilir.

Bu işlemin yapılması için $u_1 = y(t), u_2(t) = y'(t), \dots, u_k=y^{(k-1)}(t)$ tanımlandıktan sonra; verilen ifade yeni değişkenler cinsinden yazılabilir.

$y''=t+y+y'$ verildiğini düşünelim. 

Verilen ifade ikinci dereceden bir ADD olduğundan;

$$
    \begin{aligned}
    u_1' &= y' &= u_2\\
    u_2' &= y'' &= t + u_1 + u_2
    \end{aligned}
$$

elde edilir. Burada $\mathbf{u} = [u_1, u_2]^\intercal$ dersek;

$$
\mathbf{u}' = 
\begin{bmatrix}
0&1\\
1&1
\end{bmatrix} \mathbf{u}+ t
$$

şeklinde yazılabilir.

### İlk Değer Problemi

Bir diferansiyel denklemin sonsuz sayıda çözümü olabilir. Tekilliğin sağlanması için denklem setinin sağladığı bir ilk değer verilmelidir.

#### Euler Yöntemi

Euler yöntemi İDP çözümü için oldukça basit bir yöntemdir. Bu yöntemde $y'$ ifadesi yerine bu ifadenin nümerik karşılığı olan;

$$
\mathbf{y}' = \frac{\mathbf{y}_{k+1}-\mathbf{y}_k}{h} = f(t_k, \mathbf{y}_k)
$$

kullanılır. Bu durumda;

$$
\mathbf{y}_{k+1} = \mathbf{y}_k + h f(t_{k}, \mathbf{y}_{k})
$$

iteratif adımları ile bulunabilir. Burada ilk iterasyona başlangıç noktası $\mathbf{y}_0$ ilk değer probleminde verilen ilklendirme koşulu olarak kullanılır. 

Bu yöntem daha önce hesaplanan değerleri kullanarak ileriki değerleri hesapladığından _explicit_ olarak isimlendirilir.

#### Geri Euler Yöntemi

Euler yönteminin stabil sonuç üretebilmesi için adım büyüklüğünün belirli tolerans değerleri altında kalması gerekir. Ters Euler yöntemi bu şartı ortadan kaldırdığı için daha geniş bir yakınsama bölgesine sahiptir. Bu yöntemde iterasyon

$$
\mathbf{y}_{k+1} = \mathbf{y}_k + h f(t_{k+1}, \mathbf{y}_{k+1})
$$

şeklinde hesaplanır. Bu yöntem hesaplanmak istenen değeri de kullandığından _implicit_ olarak isimlendirilir.

<blockquote>

[](#gray) $y' = -y^3$ olsun. $y(0) = 1$ ve $h=0.5$ için ADD çözümünü hesaplayınız.

Ters Euler yöntemi ile

$$
y_1 = y_0 + h f(t_{1}, y_1) = 1 - 0.5y_1^3
$$

bulunur. Burada $g(y) = 1 - 0.5y^3$ dersek işlem $y=g(y)$ sabit nokta iterasyonu olarak çözülebilir. $y=y(0)=1$ kullanılarak iterasyonlar yapılırsa;

$$
\begin{aligned}
y_1 &= g(1) &= 0.5\\
y_2 &= g(0.5) &= 0.94\\
y_3 &= g(0.94) &= 0.58\\
y_n &= 0.77
\end{aligned}
$$

</blockquote>

### Sınır Değer Problemi

İlk değer probleminde olduğu gibi diferansiyel denklemlerin çözümünün tekil olması için ek bazı bilgilerin verilmesi gereklidir. Bu bilgiler $t=0$ anı için verildiğinde ilk değer problemi olurken, $t > 0$ gibi farklı noktalar için verildiğinde sınır değer problemi olmaktadır.

$$
\mathbf{y}' = f(t, \mathbf{y}), \quad a \leq t \leq b, \quad \text{ve} \quad g(\mathbf{y}(a),\mathbf{y}(b)) = 0
$$

Sınır değer problemleri $y(a)$ ve $y(b)$ noktaları için ayrıştırılabilir şekilde verilmişse problem ADD biçiminde yazılabilir.

$y''=f(t,y,y'), \quad a < t < b$ verilsin. Burada sınır değerler $y(a)=\alpha$ ve $y(b)=\beta$ olsun. $u_1=y, u_2 = y'$ tanımlarsak;

$$
\begin{bmatrix}
u_1'\\
u_2'
\end{bmatrix}=
\begin{bmatrix}
u_2\\
f(t,u_1,u_2)
\end{bmatrix}, \quad a < t < b
$$

doğrusal denklem takımı elde edilir. Sınır koşulları da;

$$
\begin{bmatrix}
1&0\\
0&0
\end{bmatrix}
\begin{bmatrix}
u_1(a)\\
u_2(b)
\end{bmatrix}+
\begin{bmatrix}
0&0\\
1&0
\end{bmatrix}
\begin{bmatrix}
u_1(a)\\
u_2(b)
\end{bmatrix}=
\begin{bmatrix}
\alpha \\
\beta
\end{bmatrix}
$$

şeklinde yazılır.

#### Shooting Yöntemi
Bu yöntemde $y(a) = \alpha$ olarak verilen sınır değer ilk değer olarak ele alınarak...

#### Sonlu Farklar Yöntemi

Bu yöntemde $y''=\frac{y_{i+1}-2y_i+y_{i-1}}{h^2}, y'=\frac{y_{i+1}-y_{i-1}}{2h}$ ile değiştirilerek problem çözülür.

Örnek olarak $u'' = 6t, \quad 0 < t < 1$ ve $u(0)=0, u(1)=1$ verilsin. Burada $u$ fonksiyonun ara değeri bulunmak istensin.

$h=0.5$ seçersek, $t_0=0, t_1=0.5,t_2=1$ olacaktır. Bu durumda $u_0=0,u_2=1$ sınır değerleri olacaktır ve $u_1$ sorulmaktadır.

Sonlu farklar ifadesi yazılırsa;

$$ 
\frac{u_2 - 2u_1 + u_0}{h^2} = 6 t_1 \Rightarrow u_1 = 0.125
$$ 

hesaplanır.

### Kısmi Diferansiyel Denklemler

Kısmi diferansiyel denklemler farklı değişkene göre türevlenen değişkenlerin birlikte yer aldığı denklemlerdir. Genellikle farklı değişkenlere göre denklem ayrıklaştırılarak çözüm hesaplanır.

Zamana ve konuma bağlı bir ısı denklemi

$$
    u_t = c u_{xx}, \quad 0 \leq x \leq 1, \quad t \geq 0
$$

diferansiyel denklemi ile gösterilir.

Burada ilk koşullar $u(0,x)=g(x), \quad 0 \leq x \leq 1$, sınır değerleri $u(t,0)=0, \quad u(t,1)=0, \quad t \geq 0$ şeklinde verilmiş olsun.

Tam ayrıklaştırma yönteminde $x_i = i \Delta x$, $t_k = k \Delta t$ olacak şekilde bir ayrıklaştırma işlemi yapılır. Bu işlem sonrasında $u_i^k = u(t_k,x_i)$ tanımı yapılarak verilen diferansiyel denklem aşağıdaki şekilde ayrılaştırılabilir.

$$
    \frac{u_i^{k+1} - u_i^k}{\Delta t} = c\frac{u_{i+1}^k - 2u_i^k + u_{i-1}^k}{(\Delta x)^2}, \quad i = 1, \dots, n
$$

Burada içler dışlar çarpımı yapılarak;

$$
    u_i^{k+1} =  u_i^k + \frac{c\Delta t}{(\Delta x)^2} \left( u_{i+1}^k - 2u_i^k + u_{i-1}^k \right), \quad i = 1, \dots, n
$$

sadeleştirilmiş denklem seti elde edilir.

## Rastgele Sayılar

Rastgele sayı üreteçleri

- Rastgele örüntü üretmelidir. Yani bir sayı dizisinin kendisi ile otokorelasyonu $\tau=0$ dışında çok düşük olmalıdır.

- Sayıların tekrar periyodu çok yüksek olmalıdır.

- Üretim modeli verimli olmalıdır.

- Aynı ilk koşul ile başlandığında aynı diziyi tekrar üretebilmelidir.

