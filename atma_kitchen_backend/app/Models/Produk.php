<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Produk
 *
 * @property int $id
 * @property int $id_kategori
 * @property int|null $id_penitip
 * @property string $nama
 * @property string|null $deskripsi
 * @property string|null $foto
 * @property int $harga
 * @property int|null $harga_setengah_loyang
 * @property int $stok_ready
 * @property int|null $kuota_harian
 *
 * @property KategoriProduk $kategori_produk
 * @property Penitip|null $penitip
 * @property Collection|DetailHamper[] $detail_hampers
 * @property Collection|DetailPenjualan[] $detail_penjualans
 * @property Collection|ProdukBahan[] $produk_bahans
 *
 * @package App\Models
 */
class Produk extends Model
{
	protected $table = 'produk';
	public $timestamps = false;

	protected $casts = [
		'id_kategori' => 'int',
		'id_penitip' => 'int',
		'harga' => 'int',
		'harga_setengah_loyang' => 'int',
		'stok_ready' => 'int'
	];

	protected $fillable = [
		'id_kategori',
		'id_penitip',
		'nama',
		'deskripsi',
		'foto',
		'harga',
		'harga_setengah_loyang',
		'stok_ready',
		'kuota_harian'
	];

	public function kategori_produk()
	{
		return $this->belongsTo(KategoriProduk::class, 'id_kategori');
	}

	public function penitip()
	{
		return $this->belongsTo(Penitip::class, 'id_penitip');
	}

	public function detail_hampers()
	{
		return $this->hasMany(DetailHamper::class, 'id_hampers');
	}

	public function hampers_produk()
	{
		return $this->hasMany(DetailHamper::class, 'id_produk');
	}

	public function detail_penjualans()
	{
		return $this->hasMany(DetailPenjualan::class, 'id_produk');
	}

	public function pemesanan_produk_harians()
	{
		return $this->hasMany(PemesananProdukHarian::class, 'id_produk');
	}

	public function produk_bahans()
	{
		return $this->hasMany(ProdukBahan::class, 'id_produk');
	}
}
