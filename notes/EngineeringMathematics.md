# Mühendislik Matematiği

Bu ders kapsamında mühendislik hesaplamalarında kullanılan Dizi ve Seriler, Türev-İntegral, Lineer Cebir ve Diferansiyel Denklemler gibi alanlarda temel bilgiler verilecektir.

- [Dizi ve Seriler](#dizi-ve-seriler)
  - [Yakınsaklık](#yakınsaklık)
  - [Taylor Serisi](#taylor-serisi)
  - [Sık Kullanılan Formüller](#sık-kullanılan-formüller)
- [Lineer Cebir](#lineer-cebir)
  - [Diklik ve Ortonormallik](#diklik-ve-ortonormallik)
  - [Gram-Schmidt Yöntemi](#gram-schmidt-yöntemi)
  - [Özdeğer - Özvektör](#özdeğer---özvektör)
  - [Pozitif-Negatif Tanımlılık](#pozitif-negatif-tanımlılık)
  - [Özdeğer Karakterizasyon Teoremi](#özdeğer-karakterizasyon-teoremi)
  - [Vektörler Üzerinde Türev İşlemleri](#vektörler-üzerinde-türev-i̇şlemleri)
- [Sık Kullanılan Eşitlikler](#sık-kullanılan-eşitlikler)


## Dizi ve Seriler

**Dizi** içerisinde değerler barındıran bir sıralı listedir. Bu listenin eleman sayısına dizinin uzunluğu denir. Genellikle bir dizinin $n$. sırada yer alan elemanı $a_n$ ile gösterilir.

**Seri** herhangi bir dizinin elemanlarının toplamından oluşturulan yeni bir dizidir. Tanım olarak seri $s_n = \sum_{i=0}^{n} a_i$ şeklinde gösterilebilir.

### Yakınsaklık

Bir dizinin indisi $n \to \infty$ sonsuza giderken, $a_n \to L$ gibi bir üst limite yaklaşıyorsa bu dizilere yakınsak dizi denir. 


$s_n = a_1+a_2+\cdots + a_n$ gibi bir seri için yakınsaklık **oranlama testi** ile ölçülür. Yakısak bir serinin aşağıdaki şartı sağlaması gereklidir.

$$
\lim_{n \to \infty} \left \lvert \frac{ s_{n+1} }{ s_{n} } \right \lvert < 1
$$

### Taylor Serisi

Türevlenebilir bir $f$ fonksiyonunun bir noktadaki değeri bilindiğinde, o nokta civarındaki başka bir noktadaki değeri fonksiyonun türevleri yardımıyla hesaplanabilir.

$$
f(y) = f(x) + \frac{d f(x)}{dx} \frac{(y-x)}{1!} + \frac{d^2 f(x)}{dx^2}\frac{(y-x)^2}{2!} + \frac{d^3 f(x)}{dx^3}\frac{(y-x)^3}{3!} + \cdots
$$

### Sık Kullanılan Formüller

$$
\begin{aligned}
    \exp(\theta) &= \sum_{k=0}^{\infty} \frac{\theta^k}{k!} &= 1 + \theta + \frac{\theta^2}{2!} + \frac{\theta^3}{3!} + \cdots\\
    \sum_{k=0}^{N-1} r^k &= \frac{1-r^N}{1-r}\\
\end{aligned}
$$

## Lineer Cebir

**Norm** vektör üzerinde tanımlanan ve vektörün $\mathbb{R}^n \to \mathbb{R}$ şeklinde bir skalar ile gösterimini sağlayan bir büyüklüktür. Norm özellikleri aşağıda verilmiştir.

- $\lVert \mathbf{x} \lVert \geq 0$, eşitlik sadece $\mathbf{x}=0$ için olabilir
- $\lVert \lambda \mathbf{x} \lVert = \lambda \lVert \mathbf{x} \lVert$
- $\lVert \mathbf{x}+\mathbf{y} \lVert \leq \lVert \mathbf{x} \lVert + \lVert \mathbf{y} \lVert$
- $\lVert \mathbf{x} \lVert_p = \sqrt[p]{\sum_{i=1}^{n} \lvert \mathbf{x}_i \lvert^p}$
- $\lvert \mathbf{x}^{\intercal} \mathbf{y} \lvert \leq \lVert \mathbf{x} \lVert_2 \lVert \mathbf{y} \lVert_2$ (Cauchy Schwarz Eşitsizliği)
- $\lVert \mathbf{A} \lVert_p = \max_{x \neq 0} \frac{\lVert \mathbf{A}\mathbf{x} \lVert}{\lVert \mathbf{x} \lVert}$

**Metrik:** Metrik fonksiyonu bir vektör uzayında tanımlı iki noktanın uzaklığını ölçmek için kullanılan özel bir fonksiyondur. Bir fonksiyonun metrik olabilmesi için aşağıdaki **dört şartı** sağlaması gerekmektedir.

- $f(\mathbf{x}, \mathbf{y}) = f(\mathbf{y}, \mathbf{x})$
- $f(\mathbf{x}, \mathbf{y}) \geq 0$
- $f(\mathbf{x}, \mathbf{y}) = 0 \Leftrightarrow \mathbf{x}=\mathbf{y}$
- $f(\mathbf{x}, \mathbf{z}) \geq f(\mathbf{x}, \mathbf{y}) + f(\mathbf{y}, \mathbf{z})$

**Doğrusal Bağımsızlık:** Bir veya birden fazla vektörün doğrusal bağımsız olabilmesi için $p_1 v_1 + p_2 v_2 + \dots + p_n v_n = 0$ şartını sağlayan **hiç bir $p$ değeri bulunamamalıdır**. Yani bir vektör seti doğrusal bağımsız ise, herhangi bir vektörün silinmesi o vektörün kapsadığı uzayı $\textbf{span}(V)$ değiştirecektir.

### Diklik ve Ortonormallik

$\mathbf{x}^{\intercal} \mathbf{y} = 0$ şartını sağlayan iki vektör birbirine **diktir** veya **ortogonaldir** denir. Bu şarta ek olarak $\lVert \mathbf{x} \lVert = \lVert \mathbf{y} \lVert = 1$ şartı da sağlanıyorsa bu vektörlere **ortonormal** vektörler denir.

Sütunları ortonormal vektörlerden oluşan $\mathbf{Q} = \left [ \mathbf{x}_1, \mathbf{x}_2, \cdots, \mathbf{x}_n \right ]$ bir $\mathbf{Q}$ matrisinde tüm $\mathbf{x}_i$'ler ortonormal ise bu matrise ortonormal matris denir. $\mathbf{x}_i^{\intercal} \mathbf{x}_i = 1$ ve $\mathbf{x}_i^{\intercal} \mathbf{x}_j = 0, \forall i \neq j$ olduğundan $\mathbf{Q}^\intercal \mathbf{Q} = \mathbf{I}$ olacaktır.

Diğer bir deyişle, ortonormal matrislerde $\mathbf{Q}^\intercal = \mathbf{Q}^{-1}$ dir.

### Gram-Schmidt Yöntemi

Gram-Schmidt yöntemi kullanılarak $v_1, v_2, v_3, \dots, v_n$ gibi doğrusal bağımsız oldukları bilinen bir vektör seti $q_1, q_2, q_3, \dots, q_n$ gibi ortogonal vektörler haline getirilebilir.

$$
\begin{split}
q_1 & = v_1 \\
q_2 & = v_2 - \frac{\langle v_2,v_1 \rangle}{\langle v_1,v_1 \rangle} v_1 \\
q_3 & = v_3 - \frac{\langle v_3,v_1 \rangle}{\langle v_1,v_1 \rangle} v_1 - \frac{\langle v_3,v_2 \rangle}{\langle v_2,v_2 \rangle} v_2 \\
\vdots & = \vdots \\
q_n & = v_n - \sum_{i=1}^{n-1}\frac{\langle v_n,v_i \rangle}{\langle v_i,v_i \rangle} v_i
\end{split}
$$

### Özdeğer - Özvektör

Özdeğer ve özvektörler bir matris ile ilişkilendirilmiş özel değerlerdir. Herhangi bir $\mathbf{A}$ matrisi için $\mathbf{A} \mathbf{v} = \lambda \mathbf{v}$ şartını sağlayan $\mathbf{v}$ vektörlerine bu matrisin özvektörleri, $\lambda$ katsayısına ise özdeğeri denir.

$\mathbf{A} \mathbf{v} = \lambda \mathbf{v}$ şartı incelendiğinde, $\mathbf{A}$ matrisinin $\mathbf{v}$ vektörüne bir skaler gibi davrandığı ve vektörün yönünü değiştirmediği, sadece $\lambda$ ile ölçeklediği görülür. 

Burada $\mathbf{A}$ simetrik ve gerçel bir matris ise bulunan özdeğerler de gerçel olacaktır.

**ÖNEMLİ:** Gerçel ve simetrik bir $A$ matrisinin **birbirinden farklı özdeğerlere sahip tüm özvektörleri birbirine diktir**.

**İSPAT:** $v_1$ ve $v_2$, $\mathbf{A}$ matrisinin rastgele seçilmiş iki özvektörü, $\lambda_1$ ve $\lambda_2$ ise bu özvektörlere karşı düşen özdeğerler olsun. İç çarpımın yer değiştirme özelliğinden faydalanarak  $\langle \lambda_1 \lambda_2 v_1,v_2 \rangle = \langle v_1,\lambda_1 \lambda_2 v_2 \rangle$ yazılabilir. Özvektör tanımı gereği $\mathbf{A}v_1=\lambda_1v_1,\quad \mathbf{A}v_2=\lambda_2v_2$ olduğundan, bu ifade aşağıdaki şekilde yeniden yazılabilir.

$$
\langle \lambda_2 \mathbf{A} v_1,v_2 \rangle = \langle v_1,\lambda_1 \mathbf{A} v_2 \rangle = \langle \lambda_1 \mathbf{A}^{\intercal} v_1,v_2 \rangle
$$

Burada $\mathbf{A}^\intercal = \mathbf{A}$ olduğundan sadeleştirilebilir ve $\lambda_1 \langle v_1,v_2 \rangle = \lambda_2 \langle v_1,v_2 \rangle$ elde edilir. Bu  denklem düzenlenirse; $\left ( \lambda_1 - \lambda_2\right)\langle v_1,v_2 \rangle = 0$ eşitliği elde edilir. Teoremin başlangıcında $\lambda_1 \neq \lambda_2$ seçildiğinden $\langle v_1, v_2 \rangle = 0$ yani $v_1 \perp v_2$ olmalıdır.

### Pozitif-Negatif Tanımlılık

Herhangi bir $\mathbf{A}$ matrisi için $\mathbf{x}^{\intercal} \mathbf{A} \mathbf{x} > 0$ şartı sağlanıyorsa bu matrise **pozitif tanımlı** matris denir. Eğer ifade $\mathbf{x}^{\intercal} \mathbf{A} \mathbf{x} \geq 0$ şeklinde sağlanabiliyorsa bu durumda **pozitif yarı tanımlı** matris olarak adlandırılır.

Benzer şekilde $\mathbf{x}^{\intercal} \mathbf{A} \mathbf{x} < 0$ ise matrise **negatif tanımlı**, $\mathbf{x}^{\intercal} \mathbf{A} \mathbf{x} \leq 0$ ise **negatif yarı tanımlı** matris denir.

$\mathbf{x}^{\intercal} \mathbf{A} \mathbf{x}$ ifadesinin pozitif ve negatif bileşenlerden oluşması durumunda ise matrise **belirsiz** denir.

**DİKKAT:** Bir matrisin $i$'ninci köşegen elemanı $\mathbf{e}_i$ birim vektörler kullanılarak $\mathbf{e}_i^{\intercal} \mathbf{A} \mathbf{e}_i$ ile seçilebildiğinden;

- Pozitif tanımlı matrislerin tüm köşegen elemanları sıfırdan büyük,
- Negatif tanımlı matrislerin tüm köşegen elemanları sıfırdan küçük olmalıdır.



### Özdeğer Karakterizasyon Teoremi

$\mathbf{A} \mathbf{v} = \lambda \mathbf{v}$ ifadesi soldan $\mathbf{v}^\intercal$ ile çarpıldığında $\mathbf{v}^\intercal \mathbf{A} \mathbf{v} = \lambda \mathbf{v}^\intercal\mathbf{v}$ elde edilir. Burada $\mathbf{v}^\intercal\mathbf{v} > 0$ olduğundan, özdeğerin işareti $\mathbf{v}^\intercal \mathbf{A} \mathbf{v}$ ile belirlenir.

O zaman Pozitif-Negatif Tanımlılık tanımları kullanılarak aşağıdaki ifadeler söylenebilir.

- Pozitif tanımlı matrisler için $\lambda_i > 0, \quad \forall i \in 1,2,\dots,n$
- Pozitif yarı tanımlı matrisler için $\lambda_i \geq 0, \quad \forall i \in 1,2,\dots,n$
- Negatif tanımlı matrisler için $\lambda_i < 0, \quad \forall i \in 1,2,\dots,n$
- Negatif yarı tanımlı matrisler için $\lambda_i \leq 0, \quad \forall i \in 1,2,\dots,n$
- Belirsiz matrisler için $\lambda_i > 0,\lambda_j < 0 \quad \exists i,j \in 1,2,\dots,n$



### Vektörler Üzerinde Türev İşlemleri

Bir boyutlu değişkenler için tanımlanan türev ifadesi, vektörler ve fonksiyonlar için de benzer şekilde tanımlanabilmektedir.

#### Gradyan

Gradyan $\nabla f:\mathbb{R}^n \to \mathbb{R}^n$, skalar değerli $f:\mathbb{R}^n \to \mathbb{R}$ fonksiyonun en büyük değişimi gösterdiği yönü ifade eden bir vektör alanıdır. Bu değer kısmi türevler yardımıyla aşağıdaki şekilde hesaplanır.

$$
\nabla f(\mathbf{x}) = 
\begin{bmatrix}
    \frac{\partial f(\mathbf{x})}{\partial \mathbf{x}_1}&
    \frac{\partial f(\mathbf{x})}{\partial \mathbf{x}_2}&
    \cdots&
    \frac{\partial f(\mathbf{x})}{\partial \mathbf{x}_n}
\end{bmatrix}^{\intercal}
$$

#### Diverjans (Iraksama)

Iraksama $\nabla \cdot f:\mathbb{R}^n \to \mathbb{R}$ bir vektör alanın herhangi bir nokta (kaynak) etrafındaki net akısını göstermektedir. Gradyan operatöründen farklı olarak $f$ fonksiyonu ile $\nabla$ operatörünün **nokta çarpımı** ile hesaplanır.

$$
\nabla \cdot f(\mathbf{x}) = 
\frac{\partial f(\mathbf{x}_1)}{\partial \mathbf{x}_1} +
\frac{\partial f(\mathbf{x}_2)}{\partial \mathbf{x}_2}+
\cdots+
\frac{\partial f(\mathbf{x}_n)}{\partial \mathbf{x}_n}
$$

#### Hessian

Hessian matrisi $\mathbf{H}$, skalar değerli $f:\mathbb{R}^n \to \mathbb{R}$ fonksiyonun tüm ikinci derece kısmi türevlerini içeren bir matristir.


$$
\mathbf{H}_f = 
\begin{bmatrix}
    \frac{\partial^2 f}{\partial \mathbf{x}_1 \partial \mathbf{x}_1} & \frac{\partial^2 f}{\partial \mathbf{x}_1 \partial \mathbf{x}_2} & \dots & \frac{\partial^2 f}{\partial \mathbf{x}_1 \partial \mathbf{x}_n}\\
    \frac{\partial^2 f}{\partial \mathbf{x}_2 \partial \mathbf{x}_1} & \frac{\partial^2 f}{\partial \mathbf{x}_2 \partial \mathbf{x}_2} & \dots & \frac{\partial^2 f}{\partial \mathbf{x}_2 \partial \mathbf{x}_n}\\
    \vdots & \vdots & \ddots & \vdots\\
    \frac{\partial^2 f}{\partial \mathbf{x}_n \partial \mathbf{x}_1} & \frac{\partial^2 f}{\partial \mathbf{x}_n \partial \mathbf{x}_2} & \dots & \frac{\partial^2 f}{\partial \mathbf{x}_n \partial \mathbf{x}_n}
\end{bmatrix}
$$


#### Laplacian

Laplacian $\nabla f:\mathbb{R}^n \to \mathbb{R}$, gradyan vektörünün ıraksamasını gösteren bir büyüklüktür ve skalar değerli $f:\mathbb{R}^n \to \mathbb{R}$ fonksiyon için $\nabla \cdot \nabla f(\mathbf{x})$ şeklinde tanımlanır.

$$
\nabla \cdot \nabla f(\mathbf{x}) = 
\frac{\partial^2 f(\mathbf{x})}{\partial \mathbf{x}_1^2} +
\frac{\partial^2 f(\mathbf{x})}{\partial \mathbf{x}_2^2}+
\cdots+
\frac{\partial^2 f(\mathbf{x})}{\partial \mathbf{x}_n^2}
$$

İfade dikkatli incelenecek olursa bu değerin aynı zamanda Hessian matrisinin izi $\nabla \cdot \nabla f(\mathbf{x}) = \mathrm{Tr}({\mathbf{H}_f})$ olduğu görülür.





## Sık Kullanılan Eşitlikler

**Trigonometrik Eşitlikler**

$$
\begin{aligned}
    e^{j\theta} &= \cos(\theta) + j \sin(\theta)\\
    \sin(\theta) &= \frac{e^{j\theta} - e^{-j\theta}}{2j}\\
    \cos(\theta) &= \frac{e^{j\theta} + e^{-j\theta}}{2}\\
\end{aligned}
$$


$$
\begin{aligned}
    \sin(A+B) &= \sin(A)\cos(B) + \cos(A) \sin(B)\\
    \cos(A+B) &= \cos(A)\cos(B) - \sin(A) \sin(B)\\
\end{aligned}
$$

**Türev & İntegral**

$$
\begin{aligned}
    & \int \frac{1}{1 + x^2}dx &&= \tan^{-1}(x) + C\\
    & \int \frac{1}{x} dx &&= \log(x) + C\\
    & \int u dv &&= uv - \int v du
\end{aligned}
$$

