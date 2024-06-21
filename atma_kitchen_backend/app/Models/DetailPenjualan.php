<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class DetailPenjualan
 *
 * @property int $id
 * @property int $id_produk
 * @property int $id_trx_penjualan
 * @property int $qty
 * @property int $subtotal
 * @property string|null $catatan
 *
 * @property Produk $produk
 * @property TrxPenjualan $trx_penjualan
 *
 * @package App\Models
 */
class DetailPenjualan extends Model
{
	protected $table = 'detail_penjualan';
	public $timestamps = false;

	protected $casts = [
		'id_produk' => 'int',
		'id_trx_penjualan' => 'int',
		'qty' => 'float',
		'subtotal' => 'int'
	];

	protected $fillable = [
		'id_produk',
		'id_trx_penjualan',
		'qty',
		'subtotal',
		'catatan'
	];

	public function produk()
	{
		return $this->belongsTo(Produk::class, 'id_produk');
	}

	public function trx_penjualan()
	{
		return $this->belongsTo(TrxPenjualan::class, 'id_trx_penjualan');
	}
}
