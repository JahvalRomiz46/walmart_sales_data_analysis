🏪 Analisis Data Penjualan Walmart (Simulation Project)

## Deskripsi Proyek
Proyek ini merupakan simulasi analisis data bisnis menggunakan SQL yang bertujuan untuk menampilkan kemampuan dalam melakukan eksplorasi dan analisis data penjualan tanpa ETL dan visualisasi data.
Fokus proyek ini adalah mensimulasikan situasi nyata di dunia kerja, di mana seorang Data Analyst diminta untuk menjawab berbagai pertanyaan bisnis yang membutuhkan *advanced SQL query* — seperti *CTE (Common Table Expressions)*, *CASE WHEN*, dan *window functions*.

---

## Dataset
Dataset yang digunakan merupakan data penjualan cabang Walmart dalam 3 bulan terakhir (Januari-Maret 2019) yang berisi informasi transaksi seperti:
- Cabang dan kota  
- Lini produk dan jumlah penjualan  
- Detail pelanggan (gender, tipe pelanggan, metode pembayaran)  
- Detail transaksi  
- Nilai rating pelanggan  

**Kolom-kolom:**
`invoice_id`, `branch`, `city`, `customer_type`, `gender`, `product_line`, `unit_price`, `quantity`, `tax_pct`, `total`, `date`, `time`, `payment`, `cogs`, `gross_margin_pct`, `gross_income`, `rating`, `time_of_day`, `day_name`, & `month_name`

---

## Tujuan Analisis
Analisis ini bertujuan untuk menjawab berbagai pertanyaan bisnis terkait performa penjualan, performa cabang, perilaku pelanggan, serta pola transaksi.  

---

## Pertanyaan Bisnis
### Produk
- Berapa jumlah product line yang dimiliki?  
- Metode pembayaran apa yang paling umum digunakan?  
- Product line mana yang memiliki total penjualan terbesar?
- Berapa total revenue setiap bulannya?
- Bulan yang yang memiliki COGS (Cost of Goods Sold) terbesar?
- Product line mana yang memiliki total pendapatan terbesar?
- Cabang atau kota mana yang menghasilkan pendapatan tertinggi?
- Product line mana yang memiliki rata-rata VAT(Value Added Tax)/PPn terbesar?
- Product line mana yang memiliki penjualan yang melebihi dari rata-rata total penjualan? Kategorikan "Good" jika di atas rata-rata, "Bad" jika di bawah rata-rata!
- Cabang mana yang menjual lebih banyak produk dari rata-rata produk terjual?
- Gender apa yang lebih banyak melakukan transaksi pembelian produk?
- Berapa rata-rata rating tiap produk?

### Penjualan
- Bagaimana pola penjualan berdasarkan *time of day* dan *day of week*?
- Jenis pelanggan mana yang menghasilkan pendapatan terbesar?  
- Kota apa yang memiliki total bayar PPn terbesar?
- Jenis pelanggan apa yang lebih banyak membayar total PPn? Berdasarkan total transaksi, quantity yang dibeli, dan total spend!

### Pelanggan
- Berapa banyak jenis pelanggan yang ada?
- Ada berapa jenis metode pembayaran yang ada?  
- Jenis pelanggan mana yang lebih sering bertransaksi?  
- Distribusi gender per cabang  
- Waktu dan hari apa pelanggan memberikan rating tertinggi?  
- Gender mana yang lebih banyak melakukan transaksi?
- Kelompokkan distribusi gender pelanggan di setiap cabang berdasarkan total transaksi!
- Di waktu apa (time of the day) penjualan memiliki rata-rata rating tertinggi?
- Di hari apa penjualan memiliki rata-rata rating tertinggi?
- Di hari apa penjualan memiliki rata rata rating tertinggi di setiap cabang?

---

## Key Insights
1. Kategori produk **Electronic Accessories** menjadi **penjualan terbanyak secara kuantitas**, menunjukkan tingginya permintaan pelanggan akan kategori tersebut.
2. **Cabang C** (kota Naypyitaw) mencatat pendapatan tertinggi dibanding cabang lain, menunjukkan potensi pasar dan performa penjualan terbaik di wilayah tersebut.
3. Bulan **Januari** memiliki **COGS (Cost of Goods Sold) tertinggi**, menandakan peningkatan volume penjualan pada awal tahun. Ini bisa menjadi acuan untuk strategi promosi tahunan.
4. Rata-rata **rating pelanggan tertinggi** diberikan pada **hari Jumat di cabang A**, **hari Senin di cabang B**, dan **hari Sabtu di cabang C**, yang mungkin dipengaruhi berbagai faktor di masing-masing cabang.
5. Pola penjualan menunjukkan **puncak transaksi terjadi di malam pada awal minggu (Senin–Kamis)**, serta **siang  pada pertengahan hingga akhir minggu (Rabu & Jumat)**. Pola ini dapat dimanfaatkan untuk penjadwalan promosi atau penambahan staf.
7. Tipe pelanggan **Member lebih mendominasi** dalam jumlah transaksi, kuantitas produk, dan total pengeluaran **dibanding Non-member/Normal**, menandakan program loyalitas berjalan efektif dan berkontribusi besar terhadap pendapatan perusahaan.

---

## Conclusion
Melalui proyek ini, saya belajar bagaimana melakukan proses analisis data bisnis hanya dengan menggunakan SQL sebagai alat utama.  
Proyek ini tidak berfokus pada pipeline end-to-end, melainkan menekankan pada pemahaman logika query, transformasi data, dan penerjemahan hasil analisis menjadi insight bisnis yang bermakna.

Dari pengalaman ini, saya mempelajari bagaimana:
- Mengubah data mentah menjadi informasi yang siap dianalisis dengan feature engineering sederhana seperti penambahan kolom waktu dan tanggal.  
- Menggunakan query kompleks (CTE, CASE WHEN, dan Window Functions) untuk menjawab pertanyaan bisnis.  
- Melatih kemampuan berpikir kritis dalam membaca pola penjualan, perilaku pelanggan, dan performa cabang.  
- Menyusun hasil analisis menjadi insight yang relevan bagi pengambilan keputusan bisnis.  

Proyek ini membantu saya memahami kemampuan SQL bukan sekadar menulis query, tetapi juga bagaimana menggunakannya untuk menjawab permasalahan nyata dalam bisnis secara logis dan terstruktur.
