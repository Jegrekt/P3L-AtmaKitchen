<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class PemesananProdukHarian
 *
 * @property int $id
 * @property int $id_produk
 * @property Carbon $tanggal
 * @property int $jumlah_dipesan
 * @property int $kuota_hari_ini
 *
 * @property Produk $produk
 *
 * @package App\Models
 */
class PemesananProdukHarian extends Model
{
	protected $table = 'pemesanan_produk_harian';
	public $timestamps = false;

	protected $casts = [
		'id_produk' => 'int',
		'tanggal' => 'datetime',
		'jumlah_dipesan' => 'float',
		'kuota_hari_ini' => 'int'
	];

	protected $fillable = [
		'id_produk',
		'tanggal',
		'jumlah_dipesan',
		'kuota_hari_ini'
	];

	public function produk()
	{
		return $this->belongsTo(Produk::class, 'id_produk');
	}
}
