<p style="text-align: center; font-family:cursive; page-break-before: always">TEMEL KAVRAMLAR</p>

⏩ Doğrusal **bağımsız** vektör setinde her vektör vektörün kapsadığı uzayı genişletir dolayısılya  $p_1 v_1 + p_2 v_2 + \dots + p_n v_n \neq 0,  \forall p_i \in \mathbb{R} {\setminus \{0 \}}$ olmalıdır.

⏩ Birbirine **dik** olan iki vektör **ortogonaldir** ve $\mathbf{x}^{\intercal} \mathbf{y} = 0$ dır. Tüm **ortogonal** vektörler aynı zamanda **doğrusal bağımsız**dır.

Doğrusal bağımsız vektörlerden ortogonal vektörler elde etmek için **Gram-Schmidt Yöntemi** kullanılabilir. $q_1 = v_1$ den başlanarak, her adımdayeni bir önceki vektörlere dik olan vektörler elde edilir: $q_n = v_n - \sum_{i=1}^{n-1}\frac{\langle v_n,v_i \rangle}{\langle v_i,v_i \rangle} v_i$

$$
\boxed{\lVert \mathbf{x} \lVert_p = ( \sum \lvert x_i \lvert )^{1/p}} \quad \boxed{\lVert \mathbf{A} \lVert_p = \max_{x \neq 0} \frac{\lVert \mathbf{A}\mathbf{x} \lVert_p}{\lVert \mathbf{x} \lVert_p}} \quad \boxed{\text{cond}(\mathbf{A}) = \lVert \mathbf{A} \lVert \lVert \mathbf{A}^{-1} \lVert}
$$

⏩ $\mathbf{A} \mathbf{v} = \lambda \mathbf{v}$ şartını sağlayan $\mathbf{v}$ vektörlerine $\mathbf{A}$'nın özvektörleri, $\lambda$ katsayısına ise özdeğeri denir.

<blockquote>

📌 $\mathbf{A} \mathbf{v} - \lambda \mathbf{v} = 0$ olduğundan $\mathbf{v} \neq 0$ için $\text{det}(\mathbf{A} - \lambda \mathbf{I}) =0$ olmalıdır.

📌 Özdeğerlerin **toplamı** matrisin **izine** $\sum_i \lambda_i = \textbf{Tr}\{\mathbf{A}\}$, **çarpımı** **determinantına** $\prod_i \lambda_i = \lvert \mathbf{A} \lvert$ eşittir.

📌 Gerçel ve **simetrik** bir $\mathbf{A}$ matrisinin **birbirinden farklı özdeğerlere sahip tüm özvektörleri birbirine diktir**. 

<blockquote>

[](#green) ✅ $\langle \lambda_1 \lambda_2 v_1,v_2 \rangle = \langle v_1,\lambda_1 \lambda_2 v_2 \rangle \Leftrightarrow \langle \lambda_2 \mathbf{A} v_1,v_2 \rangle = \langle v_1,\lambda_1 \mathbf{A} v_2 \rangle = \langle \lambda_1 \mathbf{A}^{\intercal} v_1,v_2 \rangle$, $\mathbf{A}^\intercal = \mathbf{A}$ ve $\lambda_1 \neq \lambda_2$ olduğundan eşitlik sadece ve sadece $\langle v_1,v_2 \rangle = 0$ için geçerlidir.

</blockquote>

</blockquote>

⏩ Her $\mathbf{x} \in \mathbb{R}^n$ vektörü için; $\mathbf{x}^{\intercal} \mathbf{A} \mathbf{x} > 0$ şartını sağlayan matrislere **pozitif tanımlı** denir. $\mathbf{x}^{\intercal} \mathbf{A} \mathbf{x} \geq 0$ ise **pozitif yarı tanımlı**, $\mathbf{x}^{\intercal} \mathbf{A} \mathbf{x} < 0$ geçerliyse **negatif tanımlı**, $\mathbf{x}^{\intercal} \mathbf{A} \mathbf{x} \leq 0$ geçerliyse **negatif yarı tanımlı** denir. 

<blockquote>

[](#blue)

📌 $\mathbf{e}^{\intercal} \mathbf{A} \mathbf{e}$ ile matrisin köşegenleri seçilebildiğinden, pozitif tanımlı matrislerde $\text{diag}(\mathbf{A}) > 0$, negatif tanımlı matrislerde $\text{diag}(\mathbf{A}) < 0$ olmalıdır. 

🚨 $\mathbf{x}$, $\mathbf{A}$'nın özvektörü ise $\mathbf{x}^{\intercal} \mathbf{A} \mathbf{x} = \lambda \mathbf{x}^{\intercal}\mathbf{x}$ olduğundan, $\lambda$'nın işareti matrisin tanımına bağlı belirlenir.

</blockquote>

<p style="text-align: center; font-family:cursive; page-break-before: always">OLASILIK ve RASTGELE DEĞİŞKENLER</p>

⏩ Bayes Kuralı: Bir $B$ olayının olması durumunda, $A$ olayının olasılığı aşağıdaki şekilde tanımlıdır.

$$
P(A \lvert B) = \frac{P(A \cap B)}{P(B)} = \frac{P(B \lvert A)P(A)}{P(B)}
$$

<blockquote>

[](#green)

📌 $A,B$ **bağımsız** olaylarsa; $P(A\cap B)=P(A)P(B)$ olacağından $P(A \lvert B) = P(A)$ olur.

📌 $A,B$ **bağdaşmaz** olaylarsa; $P(A\cap B)=0$ olacağından $P(A \lvert B) = 0$ olur.

📌 $B \subset A$ ise  $P(A\cap B) = P(B)$ olcağından $P(A \lvert B) = 1$ olur.

</blockquote>

⏩ **Kümülatif dağılım** ( $F_{\mathbf{x}}(x)$ ) ve **olasılık yoğunluk fonksiyonları** ( $f_{\mathbf{x}}(x)$ ) şu şekilde tanımlanır: $P \lbrace  x_1 < \mathbf{x} \leq x_2  \rbrace  = F_{\mathbf{x}}(x_2) - F_{\mathbf{x}}(x_1) = \int_{x_1}^{x_2} f_{\mathbf{x}}(x)dx$

⏩ **Beklenen Değer:** $E[\mathbf{x}] = \int_{-\infty}^{\infty} x f_{\mathbf{x}}(x) dx$ 🔔 **Değişinti:** $\sigma^2_\mathbf{x} = \int_{-\infty}^{\infty} (x-\mu)^2 f_{\mathbf{x}}(x) dx = E[(x-\mu)^2]$


| Dağılım Adı          | Kullanım Amacı                     | Matematiksel Gösterim                                            | Ortalama            | Varyans               |
| -------------------- |------------------------------------| ---------------------------------------------------------------- | ------------------- | --------------------- |
| Normal        | Tüm dağılımların aritmetik ortalamasının yakınsadığı dağılımdır | $\frac{1}{\sqrt{2\pi \sigma^2}}e^{-\frac{(x-\mu)^2}{2\sigma^2}}$ | $\mu$               | $\sigma^2$            |
| Exponansiyel  | Bağımsız olayların birbirini bekletme sürelerinin dağılımıdır                                  | $\lambda e^{-\lambda x}, \quad x \geq 0$                         | $\frac{1}{\lambda}$ | $\frac{1}{\lambda^2}$ |
| Düzgün        | Eşit olasılıklı olayların dağılımıdır                                   | $\frac{1}{b-a}, \quad a < x < b$                                 | $\frac{a+b}{2}$     | $\frac{(b-a)^2}{12}$  |
| Binom        | $p$ olasılıklı olayın $n$ denemede görülme sayısının dağılımıdır                                   | ${n \choose k}p^k (1-p)^{(n-k)}$                                 | $np$                | $np(1-p)$             |
| Poisson      | $p \ll$ olasılıklı olayın $n \gg$ denemede görülme sayısının dağılımıdır                                   | $e^{-\lambda}\frac{\lambda^k}{k!}, \quad \lambda=np$                               | $\lambda$           | $\lambda$             |
| Düzgün        | Eşit olasılıklı olayların dağılımıdır                                   | $\frac{1}{N}$                                                    | $\frac{N+1}{2}$     | $\frac{N^2-1}{12}$    |


⏩ $\mathbf{x},\mathbf{y}$ iki rastgele değişken olmak üzere; **korelasyon** $R_{\mathbf{xy}} = E[\mathbf{x}\mathbf{y}]$, **kovaryans** $C_{\mathbf{xy}} = E[(\mathbf{x}-\mu_\mathbf{x})(\mathbf{y}-\mu_\mathbf{y})]$ şeklinde tanımlanır.

<blockquote>

[](#blue)

📌 $C_{\mathbf{xy}} = 0$ yani $E[\mathbf{x}\mathbf{y}] = E[\mathbf{x}]E[\mathbf{y}]$ olan rastgele değişkenlere **ilişkisiz** denir.  **Bağımsız**  rastgele değişkenler için $P \lbrace x,y \rbrace  = P \lbrace x \rbrace P \lbrace y \rbrace$ olduğundan **bağımsız rastgele değişkenler ilişkisizdir**.

📌 İki rastgele değişkenin **korelasyonu $E[\mathbf{x}\mathbf{y}]=0$ ise bu değişkenler ortogonaldir** veya **birbirlerine diktir** denir.

</blockquote>

💥💥 **Merkezi Limit Teoremi:** $(\mu, \sigma^2)$ ile karakterize edilen bir dağılımdan toplam $n$ örnek alınmaktaysa, örneklerin ortalamalarının yakısadığı dağılım $\mathcal{N}(\mu, \sigma^2/n)$ ile Normal dağılım olacaktır.

📌 Normal dağılımın kümülatif dağılım fonksiyonun hesaplanması $F_{\mathbf{x}}(x) = G\left( \frac{x-\mu}{\sigma}\right)$ formülü ile yapılır.


<p style="text-align: center; font-family:cursive; page-break-before: always">İŞARET İŞLEME</p>

🔋 **Enerji** bir sistemin genliğininin karesel toplamını $E = \int_{t_1}^{t_2} \lvert x(t) \lvert^2 dt$ göstermektedir. ⚡ **Güç** birim zamandaki enerji olarak tanımlanır ve $P(x) = \frac{E}{t_2-t_1}$ ile hesaplanır. **Sonlu enerjili sistemlerin ortalama gücü sıfırdır**.

<blockquote>

[](#green)

- 🤯 **Belleksiz** sistemlerde çıktı sadece o anki girdiye bağlıdır. 
- 🧩 **Terslenebilir** sistemlerde farklı girdi farklı bir çıktıya neden olmaktadır.  
- ⌛ **Nedensel** sistemlerde çıktı girdinin o anki veya daha önceki değerlerine bağlıdır. 
- 💣 **Kararlı** sistemlerde küçük bir girdi, çıkışta sonlu bir etkiye neden olur. 
- 🗼**Zamanla Değişmeyen** sistemlerde belirli bir girdiye verilen çıktı, zamanla değişmez.
- 🔛 **Doğrusal** sistem $a x_1(t) + b x_2(t)$ girdisi için $a y_1(t) + b y_2(t)$ şeklinde çıktı üretmelidir.
  
</blockquote>

⏩ **Doğrusal ve zamanla değişmeyen** bir sistemin çıktısı; $y[n] = \sum_{k=-\infty}^{\infty} x[k] h[n-k]$ **evrişim** ile bulunabilir.


|Periyodik İşaretler için Fourier Serisi | Sürekli Sinyaller | Ayrık Sinyaller |
|----|----|----|
| Fourier Seri Katsayıları | $a_k = \frac{1}{T} \int_{T} x(t) e^{-jk(2\pi / T) t} dt$ | $a_k = \frac{1}{N} \sum_{n \in N} x[n] e^{-jk (2\pi / N) n}$ |
| Zaman İşaretinin Elde Edilmesi | $x(t) = \sum_{k=-\infty}^{\infty} a_k e^{jk(2\pi / T) t}$ | $x[n] = \sum_{k \in N} a_k e^{jk (2\pi / N) n}$ |

<blockquote>

[](#blue) 💥💥 **Mutlak toplamı sonlu** olan, **sonlu sayıda minima/maksima** içeren ve **sonlu sayıda kesikliği** olan sinyaller, periyodik olmasa dahi $T \to \infty$ varsayılarak Fourier seri katsayıları bulunabilir. Ancak $T \to \infty$ olduğundan katsayılar **sürekli** olacaktır. Bu işleme **Fourier Dönüşümü** denir.

</blockquote>

|Aperiyodik İşaretler için Fourier Dönüşümü | Sürekli Sinyaller | Ayrık Sinyaller |
|----|----|----|
| Fourier Dönüşümü | $X(jw) = \int_{-\infty}^{\infty} x(t) e^{-jwt} dt$ | $X(e^{jw}) = \sum_{n=-\infty}^{\infty} x[n] e^{-jwn}$ |
| Ters Fourier Dönüşümü | $x(t) = \frac{1}{2 \pi} \int_{-\infty}^{\infty} X(jw) e^{jwt} dw$ | $x[n] = \frac{1}{2 \pi} \int_{2\pi} X(e^{jw}) e^{jwn} dw$ |
| Laplace/$z$ Dönüşümü | $X(s) = \int_{-\infty}^{\infty} x(t) e^{-st} dt$ | $X(z) = \sum_{n=-\infty}^{\infty} x[n] z^{-n}$ |

🔸$y(t) = x(t) \ast h(t) \overset{\mathcal{F}}{\longleftrightarrow} Y(jw) = X(jw) H(jw)$ ile hesaplanabilir.

🔸**Parseval Teoremi:** $\int_{-\infty}^{\infty} \lvert x(t) \lvert^2 dt = \frac{1}{2 \pi} \int_{-\infty}^{\infty} \lvert X(jw) \lvert^2 dw$


⏩ Laplace dönüşümü $s=\sigma + jw$ kullanılarak, sürekli Fourier dönüşümünün, $z$ dönüşümü $z=r e^{jw}$ kullanılarak, ayrık Fourier dönüşümünün genelleştirilmiş şeklidir. Bu dönüşümler için girdinin **kararlı olması şart değildir**.

| ROC-Girdi Sinyali İlişkisi | Laplace Dönüşümü | $z$ Dönüşümü |
|------|------|------|
| Kararlılık | ROC $\sigma = 0$ içermelidir | ROC $\lvert z \lvert=1$ çemberi içermelidir |
| Nedensel | ROC $\sigma > \alpha$ şeklinde sağ taraflı olmalıdır | ROC $\lvert z \lvert = \infty$ içermelidir |
| Kararlı ve Nedensel | Tüm kutuplar sol tarafta olmalıdır | Tüm kutuplar **birim çemberin** içerisinde olmalıdır |


<blockquote>

[](#green) 🚨 Dönüşüm fonksiyonu **en az bir tane**, **sadeleşme ile yok edilemeyen** kutup içermesi durumunda girdi sinyali sonsuz uzunlukta olacağından, bu sinyallere **IIR** denir. **FIR** sistemlerde ise **sıfır hariç** kutup noktası bulunmamaktadır.

</blockquote>

⏩ **Örnekleme** $x_s(t) = \sum_{n=-\infty}^{\infty} x(t) \delta(t - nT_s)$ sürekli sinyalden örnekler alınması işlemidir. Bu durumda sinyalin frekans gösterimi aşağıdaki şekilde olacaktır.

$$
X_s(jw) = \frac{1}{T} \sum_{k=-\infty}^{\infty} X(jw) . 1e^{-jkw_s} = \frac{1}{T} \sum_{k=-\infty}^{\infty} X \left(j(w - kw_s) \right)
$$

🔔 Örneklenen sinyalin frekans uzayında $w_s$ ile periyodik olduğu görülür. 

<blockquote>

[](#blue) 💊 **Bant genişliği sınırlı olan** sinyalden **sinyalin ihtiva ettiği en yüksek frekanstan daha sık** örnekler alınırsa sinyal **kayıpsız** geri çatılabilir.

✅ **Nyquist-Shannon Örnekleme Teoremi:** Maksimum frekansı $w_m$ olan bir sinyalin bant genişliği $2w_m$ olacaktır. Örnekleme sonrası sinyalin girişim yaşamaması için **örnekleme frekansı $w_s > 2w_m$ seçilmelidir**. Bu durumda orjinal sinyal örneklerinden mükemmel şekilde geri çatılabilecektir.

🚨🚨 Örtüşme oluşturmayacak **en düşük örnekleme frekansı** bant genişliği $B < w_m$ ile sınırlı sinyaller için daha **düşüktür**: $w_s = \frac{2 w_m}{ \lfloor w_m / B \rfloor}$

</blockquote>

⏩ **Tüm Geçiren (All Pass)** sistemler **tüm frekans bileşenlerine sabit bir kazanç** uygular. $H(z)$ **transfer fonksiyonunun sıfırlarının da birim çemberin içinde** olan sistemlere **Min Faz** sistem denir. Bu sistemlerin **tersi de nedensel ve kararlıdır**.


⏩ Rastgele sürecin istatitistikleri zamanla değişmiyorsa **sıkı durağan**, sadece ortalama ve kovaryansı değişmiyorsa **geniş anlamda durağan** süreç denir.

💊 Sıfır ortalamalı $\mathbf{x}$ ve $\mathbf{y}$ vektörleri arasındaki **ilişkiyi** kaldıracak $\mathbf{H}$ dönüşüm matrisi $\mathbf{e} = \mathbf{x} - \mathbf{H} \mathbf{y}$ olmak üzere $E[\mathbf{e} \mathbf{y}] = 0$ şartını sağlamalıdır. Bu da $\mathbf{H} = \mathbf{R}_ {xy} \mathbf{R}_ {yy}^{-1}$ seçilmesi durumunda olur.

> ✅ $E[\mathbf{e} \mathbf{y}] = E[(\mathbf{x} - \mathbf{H} \mathbf{y}) \mathbf{y}^\intercal] = E[\mathbf{x}\mathbf{y}^\intercal - \mathbf{H} \mathbf{y}\mathbf{y}^\intercal] = E[\mathbf{x}\mathbf{y}^\intercal] - \mathbf{H} E[\mathbf{y}\mathbf{y}^\intercal] = \mathbf{R}_ {xy} - \mathbf{H}\mathbf{R}_ {yy} = 0$


⏩ **Güç spektral yoğunluğu**; **sinyalin gücünün frekans bileşenlerine bağlı değişimini** gösteren bir değerdir. Bu değer $\mathbf{S}_x$ ile gösterilir ve otokorelasyon matrisinin Fourier dönüşümü ile elde edilir.

$$
\mathbf{S}_ x(w) = \int_ {-\infty}^{\infty} \mathbf{R}_ x(\tau) e^{-jw\tau} d\tau
$$


📝 **Otoregresif modeller**; elimizde bulunan verinin geçmiş elemanlarının ağırlıklı toplamı ile güncel değeri kestirmeye çalışır.

📝 **Wiener filtre** problemi bir sisteme benzeterek girdi $z(t)$ ile çıktı $\hat{y}(t)$ arasındaki dönüşümü sağlayan transfer fonksiyonunu bulmayı hedefler. Burada $e(t) = \hat{y}(t+\lambda) - y(t+\lambda)$ hatasının en küçüklenmesi için $E[e(t) z(t)] = 0$ olmalıdır. 

<p style="text-align: center; font-family:cursive; page-break-before: always">GÖRÜNTÜ İŞLEME</p>


⏩ **HIT** çekirdek matrisinin uygulandığı bölgede en az bir tane **1** bulunması durumuna denir ve $\oplus$ sembolü ile gösterilir. 🟨 **FIT** çekirdek matrisinin uygulandığı bölgedeki tüm değerlerin **1** olması durumuna denir ve $\ominus$ sembolü ile gösterilir.

⏩ **Genişleme (Dilation)** Beyaz pikseller genişlemeye uğradığından bu şekilde isimlendirilir, $A \oplus B$ işlemi ile gösterilir. 🟩 **Daralma (Erosion)** Beyaz pikseller daralmaya uğradığından bu şekilde isimlendirilir, $A \ominus B$ işlemi ile gösterilir.

⏩ **Açma (Opening)** bir imgenin önce daralma, ardından **genişleme** işlemlerine tabii tutulması işlemine denir, $(A \ominus B)\oplus B$ ile gösterilir. 🟧 **Kapama (Closing)** bir imgenin önce genişleme, ardından **daralma** işlemlerine tabii tutulması işlemine denir, $(A \oplus B)\ominus B$ ile gösterilir.

<blockquote>

[](#green) **Sıkıştırma** niçin yapılır? 🔸 $N_\text{renk}< 2^{24}$ olduğundan her piksel 24 bit yerine daha az bit ile ifade edilebilir 🔸 Uzamsal renk benzerliği kodlamada kullanılabilir 🔸 Algısal açıdan önemsiz noktalar daha az bitle gösterilebilir.

</blockquote>

📝 **Huffman kodlama** sembol başına düşen bit sayısını sembolün görülme olasılığına ters orantılı şekilde ayarlayarak sıkıştırma sağlanır. 

📝 **Golomb kodlama** exponansiyel olarak azalan olasılığa sahip pozitif tam sayı değerlerin kodlanması için önerilen bir yöntemdir. Geometrik dağılımlı bir sembol seti için optimum sonucu üretmektedir. $x = q M + r$ yapılır, $q$ sayısı $q+1$ bit ile, $r$ sayısı ikili sistemde kodlanır.

📝 **LZW** kodlamada **farklı uzunluktaki sembol gruplarına sabit uzunlukta kod sözcükleri atayarak** sıkıştırma sağlamaktadır.

<p style="text-align: center; font-family:cursive; page-break-before: always">OPTİMİZASYON</p>

⏩  Bir fonksiyonun en küçük veya en büyük değerini aldığı noktalara **ekstremum** noktalar denir. 💥 Ekstremum noktalar için $\boxed{\nabla f(\mathbf{x}^{\ast})^{\intercal} \Delta \mathbf{x} \geq 0}$ şartı sağlanmalıdır.

<blockquote>

[](#blue) 💥💥 Bir noktanın yerel ekstremum nokta olabilmesi için $\nabla^2 f(\mathbf{x}^{\ast})$ **pozitif veya negatif yarı tanımlı** olması gereklidir. $f(\mathbf{x}^{\ast}) = 0$ şartını sağlayan ve belirsiz Hessian matrisine sahip noktalara **eğer noktası** denir.

</blockquote>

⏩  Bir fonksiyona aşağıdaki şekilde yaklaşımda bulunabilir. Sadece gradyan kullanılarak yapılan yaklaşıma **doğrusal yaklaşım**, ikinci türevin de kullanıldığı yaklaşıma **kuadratik yaklaşım** denir.

$$
\boxed{
f(\mathbf{y}) \approx f(\mathbf{x}) + \nabla f(\mathbf{x})^{\intercal} (\mathbf{y}-\mathbf{x}) + \frac{1}{2}(\mathbf{y}-\mathbf{x})^{\intercal} \nabla^2 f(\mathbf{x}) (\mathbf{y}-\mathbf{x})}
$$

⏩ **Gradyan yöntemleri** iteratif olarak, $\mathbf{x}_k$ vektörünü durağan nokta olmaya yaklaştıracak şekilde seçilen $\mathbf{d}_k$ iniş yönünde güncelleyerek  fonksiyonun durağan noktasını bulmaya çalışan yöntemlerdir. 

$$\mathbf{x}_{k+1} = \mathbf{x}_k + \eta \mathbf{d}_k$$

<blockquote>

[](#green) 🔔🔔 Bir $\mathbf{d}$ vektörünün **iniş yönü olabilmesi** için $\boxed{\nabla f(\mathbf{x})^{\intercal} \mathbf{d} < 0}$ olmalıdır.

</blockquote>

<blockquote>

📌 **Gradyan iniş yöntemi** $\mathbf{d}_k$ vektörünü, gradyanın tam tersi yönünde, $\mathbf{d}_k=-\nabla f(\mathbf{x})$ seçen yöntemdir.

$$
\mathbf{x}_{k+1} = \mathbf{x}_k - \eta \nabla f(\mathbf{x})
$$

📌 **Gauss-Newton yöntemi** doğrusal olmayan maliyet fonksiyonlarınının ekstremum noktalarını, bu fonksiyonların **doğrusal yaklaşımlarını** kullanarak bulmayı çalışan bir yöntemdir.

$$
\mathbf{x}_{k+1} = \mathbf{x}_k - \frac{1}{2}\left(\mathbf{J}(\mathbf{x}_k)^{\intercal}\mathbf{J}(\mathbf{x}_k) \right)^{-1} \nabla \mathbf{t}(\mathbf{x}_k)
$$

📌 **Levenberg-Marquardt yöntemi** Gauss-Newton yönteminin gradyan iniş yöntemi ile arasındaki ilşikinin kullanılması üzerine kurulmuştur. 

$$
\mathbf{x}_{k+1} = \left(\mathbf{J}(\mathbf{x}_k)^{\intercal}\mathbf{J}(\mathbf{x}_k) + \lambda \mathbf{I} \right)^{-1} \mathbf{J}(\mathbf{x}_k)^{\intercal} \mathbf{\hat{b}}
$$

📌 **Newton yöntemi** bir fonksiyonun köklerinin bulunması için kullanılan bir yöntemdir. $g(\mathbf{x}) = \nabla f(\mathbf{x})$ şeklinde bir fonksiyon tanımlarsak, $g$ fonksiyonunun kökleri $f$ fonksiyonunun ekstremum noktaları olacaktır.

$$
\boxed{\mathbf{x}_{k+1} = \mathbf{x}_k - \eta\left(\nabla^2 f(\mathbf{x})\right)^{-1}\nabla f(\mathbf{x})}
$$ 

📌 **Yarı Newton yönteminde** Newton yönteminde kullanılan ve hesaplama maliyeti yüksek olan $(\nabla^2 f(\mathbf{x}))^{-1}$ yerine Secant yöntemi ile bir yaklaşım önerilmektedir. 

$$
\mathbf{H} = \nabla^2 f(\mathbf{x}_ k) \approx \frac{\nabla f(\mathbf{x}_ k) - \nabla f(\mathbf{x}_ {k-1})}{\mathbf{x}_ k - \mathbf{x}_ {k-1}}
$$

</blockquote>

📙 **Kısıtlı Optimizasyon ve KKT**

$$
\min f(\mathbf{x}) \quad \text{s.t } \quad g_i(\mathbf{x}) \leq 0, \quad i=1,\dots,m \quad, \quad h_j(\mathbf{x}) = 0, \quad j=1,\dots,p \\
$$

🔔 Burada $f,g_i,h_j$ türevlenebilir fonksiyonları sırasıyla **ana problemi**, **eşitsizlikleri** ve **eşitlikleri** göstermektedir. Bu ifade Lagrange çarpanları kullanılarak aşağıdaki şekilde yazılabilir.

$$
L(\mathbf{x}, \lambda, \mu) = f(\mathbf{x}) + \sum_i \lambda_i g_i(\mathbf{x}) + \sum_j \mu_j h_j(\mathbf{x})
$$

<p style="text-align: center; font-family:cursive; page-break-before: always">ÖRÜNTÜ TANIMA</p>

Bir veri seti üzerinde $A$ olayının gözlenmesi durumunda $B$'nin ne olabileceğine dair kararı;

<blockquote>

[](#blue)

🟢 $P(A \lvert B)$ olasılığını en büyükleyen $B$ değeri olarak veren yönteme **En Büyük Olabilirlikli Karar Verme (ML)** denir.
  
🟡 $P(B \lvert A) \sim P(A \lvert B)P(B)$ olasılığını en büyükleyen $B$ değerine göre veren yönteme **En Büyük Artçıl Karar Verme (MAP)** adı verilir.

🟣 $C(B)$ fonksiyonu $B$ kararının maliyetini göstermek üzere; kararı $C(B)P(B \lvert A)$ maliyeti üzerinden verme işlemine **Bayesçi Karar Verme** denir.

</blockquote>

📢🗧$P(B)$ olasılıkları eşit dağılımlıysa **MAP=ML** olmaktadır.

💊 Hata $C(\theta) = (\theta - \hat{\theta})^2$ karesel hata ile ölçülmesi durumunda en küçük ortalama karesel hata kestirimi $E[f(\theta \lvert \mathbf{X})]$ ile bulunur.

📝 **Parzen penceresi** yönteminde sabit genişlikli bir pencere içerisindeki verinin olasılığı $P(\mathbf{x} \in W)$' ya bakılarak olasılık yoğunluk fonksiyonu kestirilir.

📝 **En yakın komşu yöntemi** pencere hacmini sabit tutmak yerine, $P(\mathbf{x} \in W)$ olasılığını sabit tutacak genişlikteki değişken boyutlu pencereleri kullanarak  yoğunluk fonksiyonunu kestirmektedir. Matematiksel ifade Parzen penceresi ile aynıdır ve aşağıda verilmiştir.

$$
f_x(\mathbf{x}) = P(\mathbf{x} \in W) \frac{1}{\text{Volume}(W)}
$$

📝 **Temel Bileşen Analizi** verinin **en küçük izdüşüm hatası** ile yansıtılabileceği alt uzayı bulan bir algoritmadır. Bu dönüşüm, aynı zamanda **verinin en büyük değişintiyi** gösterdiği eksen ile aynı olmaktadır. 

> [](#green) 💊 $\mathbf{S}$ sıfır ortalamalı verinin kovaryansı olmak üzere, temel bileşen analizi $\mathbf{S}\mathbf{p} = \lambda \mathbf{p}$ özdeğer probleminin çözümü ile bulunur.

📝 **Fisher Ayrıştırma Analizi** izdüşümün varyansı yerine, $\mathbf{S}_b{\mathbf{S}_w}^{-1}$ değerini en büyükler. $\mathbf{S}_b = \sum_i (\mu_i - \mu)$ sınıflar arası varyansı (sınıf ortalamalarının varyansı), $\mathbf{S}_w = \sum_i E[(x_i - \mu_i)^2]$ sınıfların kendi içerisindeki varyanslarının toplamını göstermektedir.

> [](#green) 💊 Fisher Ayrıştırma vektörleri $\mathbf{S}_b\mathbf{p} = \lambda {\mathbf{S}_w}\mathbf{p}$ eşitliğinin çözülmesi ile bulunur.

<blockquote>

[](#red) 🚨🚨 Fisher ayrıştırma analizinde **sınıf ortalamaları aynı/yakın ise** $\mathbf{S}_b \approx 0$ olacağından, bulunan **sonuçlar hatalı** olacaktır.

</blockquote>

📗 **Doğrusal Ayırtaç** fonksiyonları $g(\mathbf{x}) = \mathbf{w}^{\intercal}\mathbf{x}$ şeklinde yazılabilen fonksiyonlardır. Bu fonksiyonlarda $f(\mathbf{x} \in C_1) > 0$ ve $f(\mathbf{x} \in C_2) < 0$ olması istendiğinden;   $\mathbf{x}_i = -\mathbf{x}_i,\phantom{+} \mathbf{x}_i \in C_2$ tanımı yapıldığında doğru sınıflandırılan her örnek için $g(\mathbf{x}) = \mathbf{w}^{\intercal}\mathbf{x} > 0$ olacaktır.

📌 **Perceptron Öğrenmede** ağırlık vektörünün hata miktarı $M$ yanlış sınıflandırılan örnekler üzerinden $f(\mathbf{w}) = \sum_{\mathbf{x}_i \in M} -\mathbf{w}^{\intercal}\mathbf{x}_i$ hata fonksiyonu tanımlanabilir ve gradyan iniş yöntemi ile en küçüklenebilir. 

$$
\mathbf{w}_ {k+1} = \mathbf{w}_ {k} - \eta \nabla f(\mathbf{w}) = \mathbf{w}_ {k} + \eta \sum_{\mathbf{x}_ i \in M} \mathbf{x}_ {i}
$$

📘 **En Küçük Karesel Hata** $f(\mathbf{w}) = \sum_{i} (\mathbf{w}^{\intercal}\mathbf{x}_i - \mathbf{b}_i)^2$ şeklinde tanımlanır. $f(\mathbf{w})$ fonksiyonunun gradyanı sıfıra eşitlenerek $\mathbf{w}$ çözülebilir.

$$
\begin{aligned}
    \nabla f(\mathbf{w}) &= \nabla\sum_{i} (\mathbf{w}^{\intercal}\mathbf{x}_i - \mathbf{b}_i)^2 &= 2 (\mathbf{w}^{\intercal}\mathbf{x}_i - \mathbf{b}_i)\mathbf{x}_i &= 0\\
\end{aligned}
$$

🔹 **Doğrudan Çözüm:** Elde edilen gradyan ifadesi matris biçinde yazıldığında $\mathbf{X}^\intercal \mathbf{X} \mathbf{w} - \mathbf{b} \Rightarrow \mathbf{w} = (\mathbf{X}^\intercal \mathbf{X})^{-1}\mathbf{b}$ çözümü elde edilir. $(\mathbf{X}^\intercal \mathbf{X})^{-1}$ sözde matris tersi işlemi stabil olmayabilir veya çok işlem gücü gerektirebilir.

🔹 **Widrow-Hoff Çözümü:** Bu yaklaşım elde edilen gradyan ifadesi gradyan iniş yönteminde kullanılır. $\mathbf{w}_ {k+1} = \mathbf{w}_ {k} - \eta (\mathbf{w}^{\intercal}\mathbf{x}_ i - \mathbf{b}_ i)\mathbf{x}_ i$

🔹 **Ho-Kashyap Çözümü:** Bu yaklaşım $\mathbf{w}$ değişkenine ek olarak $\mathbf{b}$ için de gradyan iniş yöntemi kullanmayı önerir. Diğer iki yöntemde $\mathbf{b}$ rastgele bir pozitif vektör seçildiğinden bu yaklaşım uzun sürede çalışmakta ancak daha iyi sonuçlar üretmektedir.

<blockquote>

[](#blue) **En Küçük Karesel Hata** büyük hatalara daha çok ceza yüklediğinden, aykırı değerlere daha duyarlı olmakta ve sonucu aykırı değere doğru yaklaştırmaktadır.

</blockquote>

📙 **Destek Vektör Makineleri** sadece ayrıştırıcı **düzleme en yakın** örneklerin (destek vektörleri) mesafelerini belirli bir $\mathbf{b} = 1 / \lVert \mathbf{w} \lVert$ değerine zorlamaktadır.

$\mathbf{b} = 1 / \lVert \mathbf{w} \lVert$ olması durumunda noktaların ayrıştırıcı düzleme uzaklığı $\lvert \mathbf{w}^{\intercal}\mathbf{x} + \mathbf{w}_0\lvert \geq 1$ olacaktır. 

Verinin $\mathbf{x}_i \in C_1$ için $z_i = +1$,  $\mathbf{x}_i \in C_2$ için $z_i = -1$ şeklinde etikenlendiğini varsayarsak, yukarıdaki bu ifade $\mathbf{z} (\mathbf{w}^{\intercal}\mathbf{x} + \mathbf{w}_0) \geq 1$ şeklinde de yazılabilir.

Bu iki bilinen bir optimizasyon problemi olarak yazıldığında, destek vektör makineleri yönteminin maliyet fonksiyonu elde edilir.

$$
f(\mathbf{w}) = \frac{1}{2} \lVert \mathbf{w}\lVert^2 - \sum_i \alpha_i \left( z_i (\mathbf{w}^{\intercal}\mathbf{x}_i + \mathbf{w}_0) - 1 \right)
$$

