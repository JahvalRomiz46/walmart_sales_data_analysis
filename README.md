# 🏪 Analisis Data Penjualan Walmart (Simulation Project)

## 📖 Deskripsi Proyek
Proyek ini merupakan simulasi analisis data bisnis menggunakan SQL yang bertujuan untuk menampilkan kemampuan dalam melakukan eksplorasi dan analisis data penjualan tanpa ETL dan visualisasi data.
Fokus proyek ini adalah mensimulasikan situasi nyata di dunia kerja, di mana seorang Data Analyst diminta untuk menjawab berbagai pertanyaan bisnis yang membutuhkan *advanced SQL query* — seperti *CTE (Common Table Expressions)*, *CASE WHEN*, dan *window functions*.

---

## Dataset
Dataset yang digunakan merupakan data penjualan cabang Walmart yang berisi informasi transaksi seperti:
- Cabang dan kota  
- Lini produk dan jumlah penjualan  
- Detail pelanggan (gender, tipe pelanggan, metode pembayaran)  
- Detail transaksi  
- Nilai rating pelanggan  

**Kolom-kolom:**
`invoice_id`, `branch`, `city`, `customer_type`, `gender`, `product_line`, `unit_price`, `quantity`, `tax_pct`, `total`, `date`, `time`, `payment`, `cogs`, 'gross_margin_pct', `gross_income`, `rating`, 'time_of_day', 'day_name', dan 'month_name'

---

## Tujuan Analisis
Analisis ini bertujuan untuk menjawab berbagai pertanyaan bisnis terkait performa penjualan, perilaku pelanggan, serta pola transaksi.  

---

## Pertanyaan Bisnis
### General
- Berapa banyak kota dalam data ini?  
- Di kota mana setiap cabang berada?  

### Produk
- Berapa jumlah product line yang dimiliki?  
- Metode pembayaran apa yang paling umum digunakan?  
- Product line mana yang memiliki total penjualan terbesar?
- Berapa total revenue setiap bulannya?
- Bulan yang yang memiliki COGS (Cost of Goods Sold) terbesar?
- Product line mana yang memiliki total pendapatan terbesar?
- Cabang atau kota mana yang menghasilkan pendapatan tertinggi?
- Product line mana yang memiliki rata-rata VAT(Value Added Tax)/PPn terbesar?
- Kategori produk mana yang “Good” atau “Bad” berdasarkan rata-rata total penjualan?
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
Sales Performance
1. Waktu yang sering mengalami penjualan terbanyak di tiap harinya adalah, hari Senin, Selasa, dan Kamis di waktu Malam, hari Rabu dan Jumat di waktu Siang.
2. Cabang C yang berada di kota Naypyitaw adalah cabang dengan total pendapatan paling tinggi. 
